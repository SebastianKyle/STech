import {AfterViewInit, Component, ElementRef, Input, OnDestroy, OnInit, ViewChild} from '@angular/core';
import {FormGroup} from "@angular/forms";
import {CartService} from "../../cart/cart.service";
import {CheckoutService} from "../checkout.service";
import {ToastrService} from "ngx-toastr";
import {ICart, ICartTotals} from "../../shared/models/cart";
import {IOrder, IOrderToCreate} from "../../shared/models/order";
import {Navigation, NavigationExtras, Router} from "@angular/router";
import Swal from 'sweetalert2';
import {ICreateOrderRequest, IPayPalConfig} from "ngx-paypal";
import {map, Observable, take} from "rxjs";

declare var Stripe: any;
declare var paypal: any;

@Component({
  selector: 'app-checkout-payment',
  templateUrl: './checkout-payment.component.html',
  styleUrls: ['./checkout-payment.component.css']
})
export class CheckoutPaymentComponent implements OnInit, AfterViewInit, OnDestroy{
  @Input() checkoutForm: FormGroup;
  @ViewChild('cardNumber', { static: true }) cardNumberElement: ElementRef;
  @ViewChild('cardExpiry', { static: true }) cardExpiryElement: ElementRef;
  @ViewChild('cardCvc', { static: true }) cardCvcElement: ElementRef;
  stripe: any;
  cardNumber: any;
  cardExpiry: any;
  cardCvc: any;
  cardErrors: any;
  cardHandler = this.onChange.bind(this);
  loading = false;
  cardNumberValid = false;
  cardExpiryValid = false;
  cardCvcValid = false;
  currentDate = new Date();
  paypalConfig?: IPayPalConfig;
  cartTotal$: Observable<ICartTotals>;

  constructor(private cartService: CartService, private checkoutService: CheckoutService, private toastr: ToastrService, private router: Router) {

  }

  ngOnInit(): void {
    this.cartTotal$ = this.cartService.cartTotal$;
    this.cartTotal$.subscribe(cartTotal => {
      const total = cartTotal.total;
      document.querySelector('#paypalHolder')!.innerHTML = '';
      this.initPayPalConfig(total);
    });
  }

  ngOnDestroy(): void {
    this.cardNumber.destroy();
    this.cardExpiry.destroy();
    this.cardCvc.destroy();
  }

  ngAfterViewInit(): void {
    this.stripe = Stripe('pk_test_51NEslnG3ZpQEXqjJkn4yGA2jaEnwsa4CqrfUFvpxiTOEOfFGaK6VZ0acvEQgYhwFHM8MUUd6NZNQTa2yBPAMgQZp00soviAEyR');
    const elements = this.stripe.elements({locale: 'en'});

    this.cardNumber = elements.create('cardNumber');
    this.cardNumber.mount(this.cardNumberElement.nativeElement);
    this.cardNumber.addEventListener('change', this.cardHandler);

    this.cardExpiry = elements.create('cardExpiry');
    this.cardExpiry.mount(this.cardExpiryElement.nativeElement);
    this.cardExpiry.addEventListener('change', this.cardHandler);

    this.cardCvc = elements.create('cardCvc');
    this.cardCvc.mount(this.cardCvcElement.nativeElement);
    this.cardCvc.addEventListener('change', this.cardHandler);

  }

  onChange(event: any) {
    if (event.error) {
      this.cardErrors = event.error.message;
    }
    else {
      this.cardErrors = null;
    }

    switch (event.elementType) {
      case 'cardNumber':
        this.cardNumberValid = event.complete;
        break;
      case 'cardExpiry':
        this.cardExpiryValid = event.complete;
        break;
      case 'cardCvc':
        this.cardCvcValid = event.complete;
        break;
      default:

        break;
    }
  }

  createPaymentIntent() {
    return this.cartService.createPaymentIntent().subscribe((response: any) => {
    }, error => {
      console.log(error);
      this.toastr.error(error.message);
    });
  }

  async submitCreditCardOrder() {
    this.checkoutForm.get('paymentForm')?.get('paymentMethod')?.patchValue('1');
    if (this.checkoutForm.invalid || !this.cardNumberValid || !this.cardExpiryValid || !this.cardCvcValid) {
      this.checkoutForm.markAllAsTouched();
      if (this.checkoutForm.invalid) {
        Swal.fire({
          icon: 'error',
          title: 'Warning',
          text: 'Please complete the required fields!'
        });
      }
      else if (!this.cardNumberValid || !this.cardExpiryValid || !this.cardCvcValid) {
        Swal.fire({
          icon: 'error',
          title: 'Warning',
          text: 'Please fill out your card information!'
        });
      }
    }
    else {
      this.loading = true;
      const cart = this.cartService.getCurrentCartValue();

      try {
        const createdOrder = await this.createOrder(cart);
        const paymentResult = await this.confirmPaymentWithStripe(cart);

        if (paymentResult.paymentIntent) {
          this.cartService.deleteLocalCart(cart.id);
          console.log(createdOrder);

          const navigationExtras: NavigationExtras = {state: createdOrder};
          this.router.navigate(['checkout/track'], { queryParams: { orderID: createdOrder?.id }});
        }
        else {
          this.toastr.error(paymentResult.error.message);
        }
        this.loading = false;
      }
      catch (error) {
        console.log(error);
        this.loading = false;
      }
    }
  }

  async submitCashOnDeliveryOrder() {
    this.checkoutForm.get('paymentForm')?.get('paymentMethod')?.patchValue('3');
    if (this.checkoutForm.get('contactForm')?.invalid
      || this.checkoutForm.get('shippingForm')?.invalid
      || this.checkoutForm.get('deliveryForm')?.invalid
      || this.checkoutForm.get('paymentForm')?.invalid) {
      this.checkoutForm.markAllAsTouched();
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please complete the required fields!'
      });
    }
    else {
      this.loading = true;
      const cart = this.cartService.getCurrentCartValue();

      try {
        const createdOrder = await this.createOrder(cart);

        if (createdOrder) {
          this.cartService.deleteLocalCart(cart.id);
          const navigationExtras: NavigationExtras = {state: createdOrder};
          this.router.navigate(['checkout/track'], { queryParams: { orderID: createdOrder?.id }});
          this.loading = false;
        }
      }
      catch (error) {
        console.log(error);
        this.loading = false;
      }
    }
  }

  private async confirmPaymentWithStripe(basket: ICart) {
    return this.stripe.confirmCardPayment(basket.clientSecret, {
      payment_method: {
        card: this.cardNumber,
        billing_details: {
          name: this.checkoutForm.get('creditCardForm')?.get('cardHolderName')?.value
        }
      }
    });
  }

  async submitPaypalOrder() {
    this.checkoutForm.get('paymentForm')?.get('paymentMethod')?.patchValue('2');
    if (this.checkoutForm.get('contactForm')?.invalid
      || this.checkoutForm.get('shippingForm')?.invalid
      || this.checkoutForm.get('deliveryForm')?.invalid
      || this.checkoutForm.get('paymentForm')?.invalid) {
      this.checkoutForm.markAllAsTouched();
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please complete the required fields!'
      });
    }
    else {
      this.loading = true;
      const cart = this.cartService.getCurrentCartValue();

      this.cartTotal$.pipe(
        take(1),
        map(cartTotal => this.initPayPalConfig(cartTotal.total))
      ).subscribe(config => {
        console.log(this.paypalConfig);
      });
    }
  }

  private initPayPalConfig(total: number) {
    paypal.Buttons({
      onClick: (data: any, actions: any) => {
        this.checkoutForm.get('paymentForm')?.get('paymentMethod')?.patchValue('2');
        if (this.checkoutForm.get('contactForm')?.invalid
            || this.checkoutForm.get('shippingForm')?.invalid
            || this.checkoutForm.get('deliveryForm')?.invalid
            || this.checkoutForm.get('paymentForm')?.invalid)
        {
          this.checkoutForm.markAllAsTouched();
          Swal.fire({
            icon: 'error',
            title: 'Warning',
            text: 'Please complete the required fields!'
          });
          return actions.reject();
        }
        else {
          return actions.resolve();
        }
      },
      createOrder: (data: any, actions: any) => {
        return actions.order.create({
          purchase_units: [{
            amount: {
              value: total.toString(),
              currency_code: 'USD',
              breakdown: {
                item_total: {value: total.toString(), currency_code: 'USD'}
              }
            }
          }]
        });
      },
      onApprove: (data: any, actions: any) => {
        console.log('onApprove - transaction was approved, but not authorized', data, actions);
        actions.order.get().then((details: any) => {
          console.log('onApprove - you can get full order details inside onApprove: ', details);
          if (details.status === 'APPROVED') {
            const cart = this.cartService.getCurrentCartValue();
            const orderToCreate = this.getOrderToCreate(cart);
            let createdOrder = null;
            this.checkoutService.createOrder(orderToCreate).subscribe(order => {
              createdOrder = order;

              if (createdOrder) {
                this.cartService.deleteLocalCart(cart.id);
                const navigationExtras: NavigationExtras = {state: createdOrder};
                this.router.navigate(['checkout/track'], { queryParams: { orderID: createdOrder?.id }});
              }
            }, error => {
              console.log(error);
            });
          }
        });
      },
      onClientAuthorization: (data: any) => {
        console.log('onClientAuthorization - you should probably inform your server about completed transaction at this point', data);
      },
      onCancel: (data: any, actions: any) => {
        console.log('OnCancel', data, actions);
      },
      onError: (err: any) => {
        console.log('OnError', err);
      },
    }).render('#paypalHolder');

  }

  private async createOrder(basket: ICart) {
    const orderToCreate = this.getOrderToCreate(basket);
    return this.checkoutService.createOrder(orderToCreate).toPromise();
  }

  private getOrderToCreate(cart: ICart): IOrderToCreate {
    return {
      cartID: cart.id,
      deliveryMethodID: +this.checkoutForm.get('deliveryForm')?.get('deliveryMethod')?.value,
      paymentMethod: +this.checkoutForm.get('paymentForm')?.get('paymentMethod')?.value,
      customerName: this.checkoutForm.get('contactForm')?.get('fullName')?.value,
      customerEmail: this.checkoutForm.get('contactForm')?.get('email')?.value,
      customerPhone: this.checkoutForm.get('contactForm')?.get('phoneNumber')?.value,
      customerCountry: this.checkoutForm.get('shippingForm')?.get('country')?.value,
      customerCity: this.checkoutForm.get('shippingForm')?.get('city')?.value,
      customerAddress: this.checkoutForm.get('shippingForm')?.get('address')?.value,
      customerZipCode: this.checkoutForm.get('shippingForm')?.get('zipCode')?.value
    };
  }
}

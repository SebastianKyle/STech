import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {AccountService} from "../account/account.service";
import {Cart, ICart} from "../shared/models/cart";
import {Observable} from "rxjs";
import {CartService} from "../cart/cart.service";

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit{
  checkoutForm: FormGroup;
  cart: ICart;

  constructor(private fb: FormBuilder, private accountService: AccountService, private cartService: CartService) {
  }

  ngOnInit(): void {
    this.cart = this.cartService.getCurrentCartValue();
    this.createCheckoutForm();
    this.getAddressFormValue();
    this.getDeliveryMethodValue();
    this.getContactDetailsValue();
  }

  createCheckoutForm() {
    this.checkoutForm = this.fb.group({
      contactForm: this.fb.group({
        fullName: ['', Validators.required],
        email: ['', [Validators.required, Validators.pattern('^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$')]],
        phoneNumber: ['', Validators.required]
      }),
      shippingForm: this.fb.group({
        country: ['', Validators.required],
        city: ['', Validators.required],
        address: ['', Validators.required],
        zipCode: ['', Validators.required]
      }),
      deliveryForm: this.fb.group({
        deliveryMethod: [null, Validators.required]
      }),
      creditCardForm: this.fb.group({
        cardHolderName: ['', Validators.required]
      }),
      paymentForm: this.fb.group({
        paymentMethod: [null, Validators.required]
      })
    });
  }

  getAddressFormValue() {
    this.accountService.getUserAddress().subscribe(address => {
      if (address && address.country !== '' && address.city !== '' && address.address !== '' && address.zipCode !== '') {
        this.checkoutForm.get('shippingForm')?.patchValue(address);
      }
    }, error => {
      console.log(error);
    });
  }

  getDeliveryMethodValue() {
    const cart = this.cartService.getCurrentCartValue();
    if (cart.deliveryMethodID !== null) {
      this.checkoutForm.get('deliveryForm')?.get('deliveryMethod')?.patchValue(cart.deliveryMethodID?.toString());
    }
  }

  getContactDetailsValue() {
    this.accountService.getUserDetails().subscribe(userDetails => {
      if (userDetails.fullName !== '') {
        this.checkoutForm.get('contactForm')?.get('fullName')?.patchValue(userDetails.fullName);
      }

      if (userDetails.email !== '') {
        this.checkoutForm.get('contactForm')?.get('email')?.patchValue(userDetails.email);
      }

      if (userDetails.phoneNumber !== '') {
        this.checkoutForm.get('contactForm')?.get('phoneNumber')?.patchValue(userDetails.phoneNumber);
      }
    });
  }
}

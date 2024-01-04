import {Component, Input, OnInit} from '@angular/core';
import {FormGroup} from "@angular/forms";
import {CheckoutService} from "../checkout.service";
import {IDeliveryMethod} from "../../shared/models/deliveryMethod";
import {CartService} from "../../cart/cart.service";

@Component({
  selector: 'app-checkout-delivery',
  templateUrl: './checkout-delivery.component.html',
  styleUrls: ['./checkout-delivery.component.css']
})
export class CheckoutDeliveryComponent implements OnInit {
  @Input() checkoutForm: FormGroup;
  deliMethods: IDeliveryMethod[];

  constructor(private checkoutService: CheckoutService, private cartService: CartService) {

  }

  ngOnInit(): void {
    this.checkoutService.getDeliveryMethods().subscribe((dm: IDeliveryMethod[]) => {
      this.deliMethods = dm;
    }, error => {
      console.log(error);
    });
  }

  setShippingPrice(deliveryMethod: IDeliveryMethod) {
    this.cartService.setShippingPrice(deliveryMethod);
  }

}

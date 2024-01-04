import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CheckoutComponent } from './checkout.component';
import {CheckoutRoutingModule} from "./checkout-routing.module";
import { CheckoutContactDetailsComponent } from './checkout-contact-details/checkout-contact-details.component';
import { CheckoutShippingDetailsComponent } from './checkout-shipping-details/checkout-shipping-details.component';
import { CheckoutPaymentComponent } from './checkout-payment/checkout-payment.component';
import { CheckoutReviewComponent } from './checkout-review/checkout-review.component';
import { CheckoutSuccessComponent } from './checkout-success/checkout-success.component';
import {SharedModule} from "../shared/shared.module";
import { CheckoutDeliveryComponent } from './checkout-delivery/checkout-delivery.component';
import {NgxPayPalModule} from "ngx-paypal";
import { OrderTrackingComponent } from './order-tracking/order-tracking.component';



@NgModule({
  declarations: [
    CheckoutComponent,
    CheckoutContactDetailsComponent,
    CheckoutShippingDetailsComponent,
    CheckoutPaymentComponent,
    CheckoutReviewComponent,
    CheckoutSuccessComponent,
    CheckoutDeliveryComponent,
    OrderTrackingComponent
  ],
    imports: [
        CommonModule,
        CheckoutRoutingModule,
        SharedModule,
        NgxPayPalModule
    ]
})
export class CheckoutModule { }

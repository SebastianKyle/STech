import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {CheckoutComponent} from "./checkout.component";
import {RouterModule, Routes} from "@angular/router";
import {CheckoutSuccessComponent} from "./checkout-success/checkout-success.component";
import {OrderTrackingComponent} from "./order-tracking/order-tracking.component";

const routes: Routes = [
  { path: '', component: CheckoutComponent },
  { path: 'success', component: CheckoutSuccessComponent },
  { path: 'track', component: OrderTrackingComponent }
];

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    RouterModule.forChild(routes)
  ],
  exports: [
    RouterModule
  ]
})
export class CheckoutRoutingModule { }

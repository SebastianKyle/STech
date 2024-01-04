import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CustomerComponent } from './customer.component';
import {HomeComponent} from "../home/home.component";
import {CoreModule} from "../core/core.module";
import {CustomerRoutingModule} from "./customer-routing.module";
import {HttpClientModule} from "@angular/common/http";
import {FormsModule} from "@angular/forms";
import {CarouselModule} from "ngx-owl-carousel-o";
import {SweetAlert2Module} from "@sweetalert2/ngx-sweetalert2";
import {NgxPayPalModule} from "ngx-paypal";



@NgModule({
  declarations: [
    CustomerComponent,
    HomeComponent
  ],
  imports: [
    CommonModule,
    CoreModule,
    CustomerRoutingModule,
    HttpClientModule,
    FormsModule,
    CarouselModule,
    NgxPayPalModule
  ]
})
export class CustomerModule { }

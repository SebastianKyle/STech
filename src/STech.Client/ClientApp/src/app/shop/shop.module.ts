import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ShopComponent } from './shop.component';
import {ShopRoutingModule} from "./shop-routing.module";
import {FormsModule} from "@angular/forms";
import {SharedModule} from "../shared/shared.module";
import { ProductDetailsComponent } from './product-details/product-details.component';



@NgModule({
  declarations: [
    ShopComponent,
    ProductDetailsComponent
  ],
    imports: [
        CommonModule,
        ShopRoutingModule,
        FormsModule,
        SharedModule
    ]
})
export class ShopModule { }

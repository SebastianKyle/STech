import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {UserProfileComponent} from "./user-profile.component";
import {UserInfoComponent} from "./user-info/user-info.component";
import {UserOrdersComponent} from "./user-orders/user-orders.component";
import {UserCommentsComponent} from "./user-comments/user-comments.component";
import {UserProfileRoutingModule} from "./user-profile-routing.module";
import {SharedModule} from "../../shared/shared.module";



@NgModule({
  declarations: [
    UserProfileComponent,
    UserInfoComponent,
    UserOrdersComponent,
    UserCommentsComponent
  ],
  imports: [
    CommonModule,
    UserProfileRoutingModule,
    SharedModule
  ]
})
export class UserProfileModule { }

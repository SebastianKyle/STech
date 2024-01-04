import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import {AccountRoutingModule} from "./account-routing.module";
import {SharedModule} from "../shared/shared.module";
import {FormsModule} from "@angular/forms";
import { UserProfileComponent } from './user-profile/user-profile.component';
import { UserInfoComponent } from './user-profile/user-info/user-info.component';
import { UserOrdersComponent } from './user-profile/user-orders/user-orders.component';
import { UserCommentsComponent } from './user-profile/user-comments/user-comments.component';



@NgModule({
  declarations: [
    LoginComponent,
    RegisterComponent,
  ],
    imports: [
        CommonModule,
        AccountRoutingModule,
        SharedModule,
        FormsModule
    ]
})
export class AccountModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from "@angular/router";
import {UserInfoComponent} from "./user-info/user-info.component";
import {UserOrdersComponent} from "./user-orders/user-orders.component";
import {UserCommentsComponent} from "./user-comments/user-comments.component";
import {UserProfileComponent} from "./user-profile.component";

const routes: Routes = [
  { path: '', component: UserProfileComponent, children: [
      { path: 'info', component: UserInfoComponent },
      { path: 'orders', component: UserOrdersComponent },
      { path: 'comments', component: UserCommentsComponent }
    ]},
  // { path: 'info', component: UserInfoComponent },
  // { path: 'orders', component: UserOrdersComponent },
  // { path: 'comments', component: UserCommentsComponent }
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
export class UserProfileRoutingModule { }

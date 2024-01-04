import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from "@angular/router";
import {DashboardComponent} from "./dashboard.component";
import {CategoriesComponent} from "./categories/categories.component";
import {ProductsComponent} from "./products/products.component";
import {OrdersComponent} from "./orders/orders.component";
import {CommentsComponent} from "./comments/comments.component";
import {UsersComponent} from "./users/users.component";
import {DashboardDetailsComponent} from "./dashboard-details/dashboard-details.component";
import {CategoryDetailsComponent} from "./categories/category-details/category-details.component";
import {ProductDetailsComponent} from "./products/product-details/product-details.component";
import {OrderDetailsComponent} from "./orders/order-details/order-details.component";
import {UserDetailsComponent} from "./users/user-details/user-details.component";

const routes: Routes = [
  { path: '', component: DashboardComponent, children: [
      { path: '', component: DashboardDetailsComponent},
      { path: 'categories', component: CategoriesComponent },
      { path: 'categories/edit/:id', component: CategoryDetailsComponent },
      { path: 'categories/create', component: CategoryDetailsComponent },
      { path: 'products', component: ProductsComponent },
      { path: 'products/edit/:id', component: ProductDetailsComponent },
      { path: 'products/create', component: ProductDetailsComponent },
      { path: 'orders', component: OrdersComponent },
      { path: 'orders/edit/:id', component: OrderDetailsComponent },
      { path: 'comments', component: CommentsComponent },
      { path: 'users', component: UsersComponent },
      { path: 'users/:id', component: UserDetailsComponent }
    ]}
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
export class DashboardRoutingModule { }

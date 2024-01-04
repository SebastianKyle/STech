import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardComponent } from './dashboard.component';
import {DashboardRoutingModule} from "./dashboard-routing.module";
import {CoreModule} from "../core/core.module";
import {HttpClientModule} from "@angular/common/http";
import {FormsModule} from "@angular/forms";
import {CarouselModule} from "ngx-owl-carousel-o";
import {JwtHelperService, JwtModule} from "@auth0/angular-jwt";
import { TopBarComponent } from './top-bar/top-bar.component';
import { SideBarComponent } from './side-bar/side-bar.component';
import { CategoriesComponent } from './categories/categories.component';
import { ProductsComponent } from './products/products.component';
import { OrdersComponent } from './orders/orders.component';
import { CommentsComponent } from './comments/comments.component';
import { UsersComponent } from './users/users.component';
import { DashboardDetailsComponent } from './dashboard-details/dashboard-details.component';
import { DashboardFooterComponent } from './dashboard-footer/dashboard-footer.component';
import {SharedModule} from "../shared/shared.module";
import { CategoryDetailsComponent } from './categories/category-details/category-details.component';
import { ProductDetailsComponent } from './products/product-details/product-details.component';
import { OrderDetailsComponent } from './orders/order-details/order-details.component';
import { UserDetailsComponent } from './users/user-details/user-details.component';



@NgModule({
  declarations: [
    DashboardComponent,
    TopBarComponent,
    SideBarComponent,
    CategoriesComponent,
    ProductsComponent,
    OrdersComponent,
    CommentsComponent,
    UsersComponent,
    DashboardDetailsComponent,
    DashboardFooterComponent,
    CategoryDetailsComponent,
    ProductDetailsComponent,
    OrderDetailsComponent,
    UserDetailsComponent
  ],
  imports: [
      CommonModule,
      DashboardRoutingModule,
      CoreModule,
      HttpClientModule,
      FormsModule,
      CarouselModule,
      SharedModule
  ],
  providers: [
  ]
})
export class DashboardModule { }

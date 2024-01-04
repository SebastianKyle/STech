import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from "@angular/router";
import {HomeComponent} from "../home/home.component";
import {AuthGuard} from "../core/guards/auth.guard";
import {CustomerComponent} from "./customer.component";

const routes: Routes = [
  { path: '', component: CustomerComponent,
    children: [
      { path: '', component: HomeComponent},
      { path: 'shop',
        loadChildren: () => import('../shop/shop.module').then(mod => mod.ShopModule)
      },
      { path: 'cart',
        loadChildren: () => import('../cart/cart.module').then(mod => mod.CartModule)
      },
      { path: 'checkout',
        canActivate: [AuthGuard],
        loadChildren: () => import('../checkout/checkout.module').then(mod => mod.CheckoutModule)
      },
      { path: 'account',
        loadChildren: () => import('../account/account.module').then(mod => mod.AccountModule)
      },
    ]
  },
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
export class CustomerRoutingModule { }

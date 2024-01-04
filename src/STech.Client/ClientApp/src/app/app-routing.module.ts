import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from "@angular/router";
import {HomeComponent} from "./home/home.component";
import {ServerErrorComponent} from "./core/server-error/server-error.component";
import {NotFoundComponent} from "./core/not-found/not-found.component";
import {TestErrorComponent} from "./core/test-error/test-error.component";
import {AuthGuard} from "./core/guards/auth.guard";

const routes: Routes = [
  // { path: '', component: HomeComponent},
  // { path: 'shop',
  //   loadChildren: () => import('./shop/shop.module').then(mod => mod.ShopModule)
  // },
  // { path: 'cart',
  //   loadChildren: () => import('./cart/cart.module').then(mod => mod.CartModule)
  // },
  // { path: 'checkout',
  //   canActivate: [AuthGuard],
  //   loadChildren: () => import('./checkout/checkout.module').then(mod => mod.CheckoutModule)
  // },
  // { path: 'account',
  //   loadChildren: () => import('./account/account.module').then(mod => mod.AccountModule)
  // },
  { path: '',
    loadChildren: () => import('./customer/customer.module').then(mod => mod.CustomerModule)
  },
  { path: 'dashboard',
    loadChildren: () => import('./dashboard/dashboard.module').then(mod => mod.DashboardModule)
  },
  { path: 'server-error', component: ServerErrorComponent },
  { path: 'not-found', component: NotFoundComponent },
  { path: 'test-error', component: TestErrorComponent },
  { path: '**', redirectTo: 'not-found', pathMatch: 'full'}
];

@NgModule({
  declarations: [],
  imports: [
    RouterModule.forRoot(routes)
  ],
  exports: [
    RouterModule
  ]
})
export class AppRoutingModule { }

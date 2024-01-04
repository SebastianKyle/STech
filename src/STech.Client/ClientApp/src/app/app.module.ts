import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { CounterComponent } from './counter/counter.component';
import { FetchDataComponent } from './fetch-data/fetch-data.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {CoreModule} from "./core/core.module";
import {CarouselModule} from "ngx-owl-carousel-o";
import {AppRoutingModule} from "./app-routing.module";
import {ErrorInterceptor} from "./core/interceptors/error.interceptor";
import {NgxSpinnerModule} from "ngx-spinner";
import {LoadingInterceptor} from "./core/interceptors/loading.interceptor";
import {JwtInterceptor} from "./core/interceptors/jwt.interceptor";
import {SweetAlert2Module} from "@sweetalert2/ngx-sweetalert2";
import {NgxPayPalModule} from "ngx-paypal";

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    CounterComponent,
    FetchDataComponent
  ],
  imports: [
    BrowserModule.withServerTransition({appId: 'ng-cli-universal'}),
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    CoreModule,
    CarouselModule,
    NgxSpinnerModule,
    SweetAlert2Module.forRoot(),
    NgxPayPalModule
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: LoadingInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

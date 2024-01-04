import {Component, OnInit} from '@angular/core';
import {NavigationEnd, NavigationStart, Router} from "@angular/router";
import {CartService} from "./cart/cart.service";
import {AccountService} from "./account/account.service";

declare var $: any;

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent implements OnInit{
  title = 'app';

  constructor(private router: Router, private cartService: CartService, private accountService: AccountService) {

  }

  resetPosition() {
    window.scrollTo(0, 0);
  }

  ngOnInit(): void {
    this.loadCart();
    this.loadCurrentUser();
  }

  loadCart() {
    const cartID = localStorage.getItem('cart_id');
    if (cartID) {
      this.cartService.getCart(cartID).subscribe(() => {
        console.log("Initialized cart")
      }, error => {
        console.log(error);
      });
    }
  }

  loadCurrentUser() {
    const token = localStorage.getItem('token');
    this.accountService.loadCurrentUser(token).subscribe(() => {
      console.log("Loaded user");
    }, error => {
      console.log(error);
    });
  }

}

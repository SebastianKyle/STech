import {Component, OnInit} from '@angular/core';
import {Router} from "@angular/router";
import {CartService} from "../cart/cart.service";
import {AccountService} from "../account/account.service";

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit {
  title = 'customer';


  constructor(private router: Router, private cartService: CartService, private accountService: AccountService) {

  }

  ngOnInit(): void {
    this.loadCart();
    this.loadCurrentUser();
  }

  resetPosition() {
    window.scrollTo(0, 0);
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

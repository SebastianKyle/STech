import {Component, OnInit} from '@angular/core';
import {CartService} from "../../cart/cart.service";
import {ICart, ICartTotals} from "../../shared/models/cart";
import {Observable} from "rxjs";

@Component({
  selector: 'app-checkout-review',
  templateUrl: './checkout-review.component.html',
  styleUrls: ['./checkout-review.component.css']
})
export class CheckoutReviewComponent implements OnInit{
  cart$: Observable<ICart>;
  cartTotal$: Observable<ICartTotals>;

  constructor(private cartService: CartService) {

  }

  ngOnInit(): void {
    this.cart$ = this.cartService.cart$;
    this.cartTotal$ = this.cartService.cartTotal$;
  }

}

import {Component, OnInit} from '@angular/core';
import {IOrder} from "../../shared/models/order";
import {Router} from "@angular/router";

@Component({
  selector: 'app-checkout-success',
  templateUrl: './checkout-success.component.html',
  styleUrls: ['./checkout-success.component.css']
})
export class CheckoutSuccessComponent implements OnInit{
  order: IOrder;

  constructor(private router: Router) {
  }

  ngOnInit(): void {
    const navigation = this.router.getCurrentNavigation();
    const state = navigation?.extras?.state;

    if (state) {
      this.order = state as IOrder;
      console.log(this.order);
    }
  }

  viewOrder() {
    this.router.navigate(['/checkout/track'], { queryParams: {orderID: this.order.id}});
  }

}

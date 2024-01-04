import {AfterViewInit, Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {IOrderDetails, IOrderHistoryDetails, OrderStatus} from "../../shared/models/order";
import {CheckoutService} from "../checkout.service";
import {PaymentMethod} from "../../shared/models/paymentMethod";
import Swal from "sweetalert2";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-order-tracking',
  templateUrl: './order-tracking.component.html',
  styleUrls: ['./order-tracking.component.css']
})
export class OrderTrackingComponent implements OnInit, AfterViewInit{
  @ViewChild('trackOrderID') trackOrderID: ElementRef;
  order: IOrderDetails;
  orderHistories: IOrderHistoryDetails[];
  orderStatus = OrderStatus;
  paymentMethods = PaymentMethod;
  retrieved = false;

  constructor(private checkoutService: CheckoutService, private route: ActivatedRoute) {

  }

  ngOnInit(): void {
  }

  ngAfterViewInit(): void {
    this.route.queryParamMap.subscribe(paramMap => {
      if (paramMap.has('orderID')) {
        this.trackOrderID.nativeElement.value = paramMap.get('orderID');
        this.getOrderDetails();
      }
    });
  }

  getOrderDetails() {
    if (!isNaN(+this.trackOrderID.nativeElement.value)) {
      let id = +this.trackOrderID.nativeElement.value;
      this.checkoutService.getOrderDetails(id).subscribe(order => {
        console.log(order);
        if (order) {
          this.order = order;

          this.getOrderHistoriesDetails(id);
          this.retrieved = true;
        }
      }, error => {
        console.log(error);
      });
    }
    else {
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please provide your order ID!'
      });
    }
  }

  getOrderStatusValue(orderStatus: number) {
    return this.orderStatus.find(o => {
      return o.value === orderStatus;
    });
  }

  getPaymentMethodValue(paymentMethod: number) {
    return this.paymentMethods.find(p => {
      return p.value === paymentMethod;
    });
  }

  getOrderHistoriesDetails(id: number) {
    this.checkoutService.getOrderHistories(id).subscribe(histories => {
      this.orderHistories = histories;
    }, error => {
      console.log(error);
    });
  }

}

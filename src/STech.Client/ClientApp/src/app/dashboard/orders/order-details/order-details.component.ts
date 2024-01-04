import {Component, OnInit} from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {OrdersService} from "../orders.service";
import {IOrderDetails, IOrderHistoryDetails, OrderStatus} from "../../../shared/models/order";
import {PaymentMethod} from "../../../shared/models/paymentMethod";
import {FormControl, FormGroup, Validators} from "@angular/forms";
import Swal from "sweetalert2";

@Component({
  selector: 'app-order-details',
  templateUrl: './order-details.component.html',
  styleUrls: ['./order-details.component.css']
})
export class OrderDetailsComponent implements OnInit {
  currentOrder: IOrderDetails;
  orderHistories: IOrderHistoryDetails[] = [];
  orderStatus = OrderStatus;
  paymentMethods = PaymentMethod;
  orderHistoryForm: FormGroup;

  constructor(private router: Router, private route: ActivatedRoute, private orderService: OrdersService) {

  }

  ngOnInit(): void {
    this.router.events.subscribe(() => {
      if (this.route.snapshot.url.length > 0) {
        this.getCurrentOrder(+this.route.snapshot.url[2]);
      }
    });

    this.createOrderHistoryForm();
  }

  createOrderHistoryForm() {
    this.orderHistoryForm = new FormGroup({
      orderID: new FormControl(null, Validators.required),
      orderStatus: new FormControl(null, Validators.required),
      note: new FormControl(null, Validators.required)
    });
  }

  getCurrentOrder(id: number) {
    this.orderService.getOrderDetails(id).subscribe(order => {
      this.currentOrder = order;
      this.getOrderHistories(id);
      this.orderHistoryForm.get('orderID')?.patchValue(this.currentOrder.id);
      this.orderHistoryForm.get('orderStatus')?.patchValue(1);
    }, error => {
      console.log(error);
    });
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

  getOrderHistories(id: number) {
    this.orderService.getOrderHistories(id).subscribe(orderHistories => {
      this.orderHistories = orderHistories;
    }, error => {
      console.log(error);
    });
  }

  updateOrderStatus() {
    if (this.orderHistoryForm.invalid) {
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please provide some note!'
      });
    }
    else {
      this.orderService.updateOrderStatus(this.orderHistoryForm.value).subscribe(response => {
        this.orderHistoryForm.get('orderStatus')?.patchValue(1);
        this.orderHistoryForm.get('note')?.patchValue('');
        this.getCurrentOrder(this.currentOrder.id);
      }, error => {
        console.log(error);
      });
    }
  }
}

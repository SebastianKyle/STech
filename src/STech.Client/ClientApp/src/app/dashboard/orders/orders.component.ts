import {AfterViewChecked, Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {OrderParams} from "../../shared/models/params";
import {OrdersService} from "./orders.service";
import {IOrderDetails, OrderStatus} from "../../shared/models/order";
import Swal from "sweetalert2";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.css']
})
export class OrdersComponent implements OnInit, AfterViewChecked {
  @ViewChild('userEmailSearch') userEmailSearch: ElementRef;
  @ViewChild('orderIDSearch') orderIDSearch: ElementRef;
  @ViewChild('orderStatusSearch') orderStatusSearch: ElementRef;
  orderParams: OrderParams = new OrderParams();
  orders: IOrderDetails[] = [];
  totalOrdersCount = 0;
  orderStatus = OrderStatus;
  customerEmail: string;

  constructor(private orderService: OrdersService, private route: ActivatedRoute) {

  }

  ngOnInit(): void {
    this.orderParams = this.orderService.getOrderParams();
    this.orderParams.pageSize = 8;

    this.route.queryParamMap.subscribe(paramMap => {
      if (paramMap.has('customerEmail')) {
        this.orderParams.customerEmail = paramMap.get('customerEmail')!;
        this.customerEmail = paramMap.get('customerEmail')!;
      }

      this.orderService.setOrderParams(this.orderParams);
      this.getOrders();
    });
  }

  ngAfterViewChecked(): void {
    if (this.customerEmail) {
      this.userEmailSearch.nativeElement.value = this.customerEmail;
    }
  }

  getOrders() {
    this.orderService.getOrders().subscribe(pagination => {
      this.orders = pagination.data;
      this.totalOrdersCount = pagination.count;
      console.log(pagination);
    }, error => {
      console.log(error);
    });
  }

  getOrderStatusInstance(value: number) {
    return this.orderStatus.find(o => o.value === value);
  }

  onPageChanged(event: any) {
    const params = this.orderService.getOrderParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.orderService.setOrderParams(params);

      this.getOrders();
    }
  }

  onSearch() {
    const params = this.orderService.getOrderParams();
    if (this.userEmailSearch.nativeElement.value) {
      params.customerEmail = this.userEmailSearch.nativeElement.value;
    }

    if (!isNaN(this.orderIDSearch.nativeElement.value)) {
      params.orderID = +this.orderIDSearch.nativeElement.value;
    }
    else {
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Order ID must be a number!'
      });
      return;
    }

    if (this.orderStatusSearch.nativeElement.value > 0) {
      params.orderStatus = +this.orderStatusSearch.nativeElement.value;
    }

    this.orderService.setOrderParams(params);

    this.getOrders();
  }

  onReset() {
    let params = new OrderParams();
    params.pageSize = 8;
    this.orderService.setOrderParams(params);

    this.userEmailSearch.nativeElement.value = '';
    this.orderIDSearch.nativeElement.value = '';
    this.orderStatusSearch.nativeElement.value = 0;

    this.getOrders();
  }

}

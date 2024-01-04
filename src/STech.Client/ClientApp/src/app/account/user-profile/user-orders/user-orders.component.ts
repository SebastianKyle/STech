import {AfterViewInit, Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {AccountService} from "../../account.service";
import {IOrder, IOrderDetails, OrderStatus} from "../../../shared/models/order";
import {OrderPagination} from "../../../shared/models/pagination";
import {OrderParams} from "../../../shared/models/params";
import {IUser} from "../../../shared/models/user";

declare var $: any;

@Component({
  selector: 'app-user-orders',
  templateUrl: './user-orders.component.html',
  styleUrls: ['./user-orders.component.css']
})
export class UserOrdersComponent implements OnInit, AfterViewInit{
  @ViewChild('orderIDSearch') orderIDSearch: ElementRef;
  @ViewChild('orderStatusSearch') orderStatusSearch: ElementRef;
  userOrders: IOrderDetails[] = [];
  totalOrdersCount: number = 0;
  userOrdersPagination: OrderPagination;
  orderParams: OrderParams = new OrderParams();
  orderStatus = OrderStatus;
  currentUser: IUser;

  constructor(private accountService: AccountService) {

  }

  ngOnInit(): void {
    this.accountService.currentUser$.subscribe(user => {
      this.currentUser = user;
    })
    this.orderParams = this.accountService.getOrderParams();
    this.getUserOrders();
  }

  ngAfterViewInit(): void {
    console.log(this.orderStatusSearch);
    $(this.orderStatusSearch.nativeElement).on('change', () => {
      this.onOrderStatusSelected(this.orderStatusSearch.nativeElement.value);
    })
  }

  getUserOrders() {
    this.accountService.getUserOrders().subscribe(orders => {
      this.userOrdersPagination = orders;
      this.userOrders = orders.data;
      this.totalOrdersCount = orders.count;
      console.log(orders);
    }, error => {
      console.log(error);
    })
  }

  getOrderStatusConfig(orderStatus: number) {
    return this.orderStatus.find(o => {
      return o.value === orderStatus;
    });
  }

  onOrderStatusSelected(value: number) {
    const params = this.accountService.getOrderParams();
    if (value > 0) {
      params.orderStatus = value;
      this.accountService.setOrderParams(params);
    }
  }

  searchOrders() {
    const orderParams = this.accountService.getOrderParams();
    orderParams.customerEmail = this.currentUser.email;
    if (!isNaN(+this.orderIDSearch.nativeElement.value)) {
      orderParams.orderID = +this.orderIDSearch.nativeElement.value;
    }

    this.accountService.setOrderParams(orderParams);
    this.getUserOrders();
  }

  resetOrders() {
    this.orderIDSearch.nativeElement.value = '';
    this.orderStatusSearch.nativeElement.value = 0;
    this.accountService.setOrderParams(new OrderParams());
    this.getUserOrders();
  }

  onPageChanged(event: any) {
    const params = this.accountService.getOrderParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.accountService.setOrderParams(params);
      this.getUserOrders();
    }
  }

}

import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from "@angular/common/http";
import {OrderPagination} from "../../shared/models/pagination";
import {OrderParams} from "../../shared/models/params";
import {environment} from "../../../environments/environment";
import {map} from "rxjs";
import {IOrderDetails, IOrderHistoryDetails} from "../../shared/models/order";

@Injectable({
  providedIn: 'root'
})
export class OrdersService {
  baseUrl = environment.apiUrl;
  ordersPagination: OrderPagination = new OrderPagination();
  orderParams: OrderParams = new OrderParams();

  constructor(private http: HttpClient) { }

  getOrderParams() {
    return this.orderParams;
  }

  setOrderParams(params: OrderParams) {
    this.orderParams = params;
  }

  getOrders() {
    let params = new HttpParams();
    if (this.orderParams.customerEmail) {
      params = params.append('customerEmail', this.orderParams.customerEmail);
    }

    if (this.orderParams.orderID) {
      params = params.append('orderID', this.orderParams.orderID);
    }

    if (this.orderParams.orderStatus) {
      params = params.append('orderStatus', this.orderParams.orderStatus);
    }

    params = params.append('pageIndex', this.orderParams.pageIndex);
    params = params.append('pageSize', this.orderParams.pageSize);

    return this.http.get<OrderPagination>(this.baseUrl + 'Order/get', { observe: 'response', params })
      .pipe(
        map(response => {
          if (response.body) {
            this.ordersPagination = response.body;
          }
          else {
            console.log('Null response body at getOrders - order.service.ts');
          }

          return this.ordersPagination;
        })
      );
  }

  getOrderDetails(id: number) {
    return this.http.get<IOrderDetails>(this.baseUrl + 'Order/get/' + id.toString());
  }

  getOrderHistories(id: number) {
    return this.http.get<IOrderHistoryDetails[]>(this.baseUrl + 'Order/histories/' + id.toString());
  }

  updateOrderStatus(values: any) {
    return this.http.post(this.baseUrl + 'Order/update', values);
  }
}

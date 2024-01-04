import { Injectable } from '@angular/core';
import {environment} from "../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {IDeliveryMethod} from "../shared/models/deliveryMethod";
import {map} from "rxjs";
import {IOrder, IOrderDetails, IOrderHistoryDetails, IOrderToCreate} from "../shared/models/order";
import {IAddress} from "../shared/models/address";

@Injectable({
  providedIn: 'root'
})
export class CheckoutService {
  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  createOrder(order: IOrderToCreate) {
    return this.http.post<IOrder>(this.baseUrl + 'Order', order);
  }

  getDeliveryMethods() {
    return this.http.get<IDeliveryMethod[]>(this.baseUrl + 'order/deliverymethods').pipe(
      map((dm: IDeliveryMethod[]) => {
        return dm.sort((a, b) => b.price - a.price);
      })
    );
  }

  getOrderDetails(id: number) {
    return this.http.get<IOrderDetails>(this.baseUrl + 'Order/tracking/' + id.toString());
  }

  getOrderHistories(id: number) {
    return this.http.get<IOrderHistoryDetails[]>(this.baseUrl + 'Order/histories/' + id.toString());
  }
}

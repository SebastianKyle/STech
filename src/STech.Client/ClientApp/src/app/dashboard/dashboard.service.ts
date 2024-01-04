import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {IYearlyProfit} from "../shared/models/profit";
import {environment} from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class DashboardService {
  baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getYearlyProfit() {
    return this.http.get<IYearlyProfit[]>(this.baseUrl + 'Dashboard/profits');
  }

  getProductsCount() {
    return this.http.get<number>(this.baseUrl + 'Product/count');
  }

  getCategoriesCount() {
    return this.http.get<number>(this.baseUrl + 'Category/count');
  }

  getOrdersCount() {
    return this.http.get<number>(this.baseUrl + 'Order/count');
  }

  getCommentsCount() {
    return this.http.get<number>(this.baseUrl + 'Comment/count');
  }

  getUsersCount() {
    return this.http.get<number>(this.baseUrl + 'User/count');
  }
}

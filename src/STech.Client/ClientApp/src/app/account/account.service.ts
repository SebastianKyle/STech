import { Injectable } from '@angular/core';
import {environment} from "../../environments/environment";
import {HttpClient, HttpHeaders, HttpParams} from "@angular/common/http";
import {BehaviorSubject, map, Observable, of, ReplaySubject} from "rxjs";
import {IUser, IUserDetails} from "../shared/models/user";
import {Router} from "@angular/router";
import {IAddress} from "../shared/models/address";
import {CommentPagination, CommentWithProductPagination, OrderPagination} from "../shared/models/pagination";
import {CommentParams, OrderParams} from "../shared/models/params";

@Injectable({
  providedIn: 'root'
})
export class AccountService {
  baseUrl = environment.apiUrl;
  private currentUserSource = new ReplaySubject<IUser>(1);
  currentUser$ = this.currentUserSource.asObservable();
  orderParams: OrderParams = new OrderParams();
  orderPagination: OrderPagination = new OrderPagination();
  commentParams: CommentParams = new CommentParams();
  commentPagination: CommentWithProductPagination = new CommentWithProductPagination();

  constructor(private http: HttpClient, private router: Router) { }

  loadCurrentUser(token: string | null) {
    if (token == null) {
      this.currentUserSource.next({ email: '', username: '', token: '', roles: [] });
      return of({ email: '', username: '', token: '', roles: [] });
    }

    let headers = new HttpHeaders();
    headers = headers.set('Authorization', `Bearer ${token}`);

    return this.http.get<IUser>(this.baseUrl + 'account', {headers}).pipe(
      map((user: IUser) => {
        if (user) {
          localStorage.setItem('token', user.token);
          this.currentUserSource.next(user);

          return user;
        }

        return { email: '', username: '', token: '', roles: [] };
      })
    );
  }

  login(values: any) {
    return this.http.post<IUser>(this.baseUrl + 'Account/login', values).pipe(
      map((user: IUser) => {
        if (user) {
          localStorage.setItem('token', user.token);
          this.currentUserSource.next(user);
        }
      })
    );
  }

  register(values: any) {
    return this.http.post<IUser>(this.baseUrl + 'Account/register', values).pipe(
      map((user: IUser) => {
        if (user) {
          localStorage.setItem('token', user.token);
          this.currentUserSource.next(user);
        }
      })
    );
  }

  logout() {
    localStorage.removeItem('token');
    this.currentUserSource.next({ email: '', username: '', token: '', roles: [] });
    this.router.navigateByUrl('/');
  }

  checkEmailExists(email: string) {
    return this.http.get(this.baseUrl + 'Account/emailexists?email=' + email);
  }

  getUserAddress() {
    return this.http.get<IAddress>(this.baseUrl + 'Account/address');
  }

  updateUserAddress(address: IAddress) {
    return this.http.post<IAddress>(this.baseUrl + 'Account/address', address);
  }

  getUserDetails() {
    return this.http.get<IUserDetails>(this.baseUrl + 'Account/details');
  }

  updateUserDetails(userDetails: IUserDetails) {
    return this.http.post<IUserDetails>(this.baseUrl + 'Account/details', userDetails);
  }

  setOrderParams(orderParams: OrderParams) {
    this.orderParams = orderParams;
  }

  getOrderParams() {
    return this.orderParams;
  }

  getUserOrders() {
    let params = new HttpParams();
    if (this.orderParams.customerEmail) {
      params = params.append('customerEmail', this.orderParams.customerEmail);
    }

    if (this.orderParams.orderID) {
      params = params.append('orderID', this.orderParams.orderID.toString());
    }

    if (this.orderParams.orderStatus) {
      params = params.append('orderStatus', this.orderParams.orderStatus.toString());
    }

    params = params.append('sort', this.orderParams.sort);
    params = params.append('pageIndex', this.orderParams.pageIndex);
    params = params.append('pageSize', this.orderParams.pageSize);

    return this.http.get<OrderPagination>(this.baseUrl + 'Order', { observe: 'response', params })
      .pipe(
        map(response => {
          if (response.body) {
            this.orderPagination = response.body;
          }
          else {
            console.log("Null response body at getUsersOrder() - account.service.ts");
          }

          return this.orderPagination;
        })
      );
  }

  getCommentParams() {
    return this.commentParams;
  }

  setCommentParams(commentParams: CommentParams) {
    this.commentParams = commentParams;
  }

  getUserComments() {
    let params = new HttpParams();
    params = params.append('sort', this.commentParams.sort);
    params = params.append('pageIndex', this.commentParams.pageIndex);
    params = params.append('pageSize', this.commentParams.pageSize);
    params = params.append('searchTerm', this.commentParams.searchTerm);

    return this.http.get<CommentWithProductPagination>(this.baseUrl + 'Comment/user', { observe: 'response', params })
      .pipe(
        map(response => {
          if (response.body) {
            this.commentPagination = response.body;
          }
          else {
            console.log("Null response body at getUsersComments() - account.service.ts");
          }

          return this.commentPagination;
        })
      );
  }
}

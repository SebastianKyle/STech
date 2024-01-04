import { Injectable } from '@angular/core';
import {environment} from "../../../environments/environment";
import {HttpClient, HttpParams} from "@angular/common/http";
import {UserParams} from "../../shared/models/params";
import {UserPagination} from "../../shared/models/pagination";
import {map} from "rxjs";
import {IUserDetails} from "../../shared/models/user";

@Injectable({
  providedIn: 'root'
})
export class UsersService {
  baseUrl = environment.apiUrl;
  userParams: UserParams = new UserParams();
  userPagination: UserPagination = new UserPagination();

  constructor(private http: HttpClient) { }

  getUserParams() {
    return this.userParams;
  }

  setUserParams(params: UserParams) {
    this.userParams = params;
  }

  getUsers() {
    let params = new HttpParams();
    params = params.append('pageIndex', this.userParams.pageIndex);
    params = params.append('pageSize', this.userParams.pageSize);

    if (this.userParams.userName !== '') {
      params = params.append('userName', this.userParams.userName);
    }

    if (this.userParams.role !== '') {
      params = params.append('role', this.userParams.role);
    }

    return this.http.get<UserPagination>(this.baseUrl + 'User/users', { observe: 'response', params })
      .pipe(
        map(response => {
          if (response.body) {
            this.userPagination = response.body;
          }
          else {
            console.log('Null response body at getUsers - users.service.ts');
          }

          return this.userPagination;
        })
      );
  }

  getCurrentUser(id: string) {
    return this.http.get<IUserDetails>(this.baseUrl + 'User/userdetails/' + id);
  }

  getUserRoles(id: string) {
    return this.http.get<string[]>(this.baseUrl + 'User/userroles/' + id);
  }

  assignUserToRole(id: string, role: string) {
    return this.http.put(this.baseUrl + 'User/addtorole/' + id + '/' + role, {});
  }

  removeUserFromRole(id: string, role: string) {
    return this.http.put(this.baseUrl + 'User/removefromrole/' + id + '/' + role, {});
  }

  getRoles() {
    return this.http.get<string[]>(this.baseUrl + 'User/roles');
  }
}

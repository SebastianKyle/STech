import { Injectable } from '@angular/core';
import {JwtHelperService} from "@auth0/angular-jwt";

@Injectable({
  providedIn: 'root'
})
export class RolesService {

  constructor() { }

  // getUserRoles() {
  //   const token = localStorage.getItem('token');
  //   if (token) {
  //     const decodedToken = this.jwtHelper.decodeToken(token);
  //     console.log(decodedToken);
  //   }
  // }
}

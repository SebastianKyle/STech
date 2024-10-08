import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import {catchError, delay, Observable, throwError} from 'rxjs';
import {NavigationExtras, Router} from "@angular/router";
import {ToastrService} from "ngx-toastr";

@Injectable()
export class ErrorInterceptor implements HttpInterceptor {

  constructor(private router: Router, private toastr: ToastrService) {

  }

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    return next.handle(request).pipe(
      // delay(1000),
      catchError(error => {
        if (error) {
          if (error.status === 404) {
            this.router.navigateByUrl('/not-found');
          }
          else if (error.status === 500) {
            const navigationExtras: NavigationExtras = { state: { error: error.error } };
            this.router.navigateByUrl('/server-error', navigationExtras);
          }
          else if (error.status === 400) {
            if (error.error.errors) {
              throw error.error;
            }
            else {
              if (request.url.includes('tracking')) {
                this.toastr.error(error.error.message);
              }
              else {
                this.toastr.error(error.error.message);
              }
            }
          }
          else if (error.status === 401) {
            this.toastr.error(error.error.message, error.error.statusCode);
          }
        }

        return throwError(error);
      })
    );
  }
}

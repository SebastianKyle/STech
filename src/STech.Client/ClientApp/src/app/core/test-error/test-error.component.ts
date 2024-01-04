import {Component, OnInit} from '@angular/core';
import {environment} from "../../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {ToastrService} from "ngx-toastr";

@Component({
  selector: 'app-test-error',
  templateUrl: './test-error.component.html',
  styleUrls: ['./test-error.component.css']
})
export class TestErrorComponent implements OnInit {
  baseUrl = environment.apiUrl;
  validationErrors: any;

  constructor(private http: HttpClient, private toastr: ToastrService) {

  }

  ngOnInit(): void {
  }

  get404Error() {
    this.http.get(this.baseUrl + 'Products/200').subscribe(response => {
      console.log(response);
    }, error => {
      console.log(error);
    })
  }

  get500Error() {
    this.http.get(this.baseUrl + 'Buggy/servererror').subscribe(response => {
      console.log(response);
    }, error => {
      console.log(error);
    });
  }

  get400Error() {
    this.http.get(this.baseUrl + 'Buggy/badrequest').subscribe(response => {
      console.log(response);
    }, error => {
      console.log(error);
    });
  }

  get400ValidationError() {
    this.http.get(this.baseUrl + 'Products/twohundred').subscribe(response => {
      console.log(response);
    }, error => {
      console.log(error);
      this.validationErrors = error.errors;
    });
  }

  cartToast() {
    this.toastr.success('Item added to cart!', undefined, {
      toastClass: 'cart-toast'
    });
  }

}

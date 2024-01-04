import {AfterViewInit, Component, OnInit} from '@angular/core';
import {ProductPagination} from "../shared/models/pagination";
import {IProduct} from "../shared/models/product";
import {environment} from "../../environments/environment";
import {HttpClient, HttpParams} from "@angular/common/http";
import {ICategory} from "../shared/models/category";
import {OwlOptions} from "ngx-owl-carousel-o";
import {CartService} from "../cart/cart.service";
import {ToastrService} from "ngx-toastr";
import {add} from "ngx-bootstrap/chronos";
import Swal, {SweetAlertOptions} from "sweetalert2";

declare var $: any;

type CartSweetAlertOptions = SweetAlertOptions & {
  onOpen?: (toast: any) => void;
};

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent implements OnInit{
  baseUrl = environment.apiUrl;
  products: IProduct[] = [];
  pagination = new ProductPagination();
  sliderCategories: ICategory[] = [];
  sliderOptions: OwlOptions = {
    loop: true,
    margin: 25,
    nav: false,
    items: 8,
    dots: true,
    navText: ['<i class="fas fa-chevron-left"></i>', '<i class="fas fa-chevron-right"></i>'],
    smartSpeed: 1200,
    autoHeight: false,
    autoplay: true,
    responsive: {
      0: {
        items: 1,
      },
      576: {
        items: 4,
      },
      992: {
        items: 4,
      },
      1200: {
        items: 6,
      }
    },
  }
  options: CartSweetAlertOptions = {
    toast: true,
    position: 'bottom',
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true,
    customClass: 'cart-swal',
    onOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer);
      toast.addEventListener('mouseleave', Swal.resumeTimer);
    }
  };
  Toast = Swal.mixin(this.options);

  constructor(private http: HttpClient, private cartService: CartService, private toastr: ToastrService) {

  }

  ngOnInit(): void {
    this.getSliderCaterories();
  }

  getSliderCaterories() {
    for (let i = 2; i <= 4; i++) {
      this.http.get<ICategory>(this.baseUrl + 'Category/' + i.toString()).subscribe(response => {
        let category = response;

        let params = new HttpParams();
        params = params.append('pageSize', '50');
        params = params.append('CategoryID', category.id.toString());
        this.http.get<ProductPagination>(this.baseUrl + 'Products', {params}).subscribe(response => {
          category.products = response.data;
          this.sliderCategories.push(category);
        })
      });
    }
  }

  addItemToCart(product: IProduct) {
    this.cartService.addItemToCart(product);
    this.Toast.fire({
      icon: 'success',
      iconHtml: '<i class="fas fa-cart-plus"></i>',
      title: 'Item added to cart!'
    });
  }
}

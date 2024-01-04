import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {ICategoryResponse, ICategoryWithChildren} from "../../shared/models/category";
import {environment} from "../../../environments/environment";
import {map, Observable} from "rxjs";
import {CartService} from "../../cart/cart.service";
import {ICart, ICartTotals} from "../../shared/models/cart";
import {IUser} from "../../shared/models/user";
import {AccountService} from "../../account/account.service";
import {Router} from "@angular/router";

declare var $: any;

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit{
  @ViewChild('search') search: ElementRef;
  baseUrl = environment.apiUrl;
  categoriesWithChildren: ICategoryWithChildren[] = [];
  cart: ICart;
  cart$: Observable<ICart>;
  cartTotal$: Observable<ICartTotals>;
  fetchTimeout: any;
  currentUser$: Observable<IUser>;

  constructor(private http: HttpClient, private cartService: CartService, private accountService: AccountService, private router: Router) {
    this.initializeMenu();
  }

  initializeMenu() {
    $(document).ready(function() {
      console.log($(".mobile-menu"));
      $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
      });
    })
  }

  getCategories() {
    this.http.get<ICategoryResponse>(this.baseUrl + 'Category/all').subscribe((response) => {
      this.categoriesWithChildren = response.categoryWithChildren;
    }, error => {
      console.log(error);
    });
  }

  ngOnInit(): void {
    this.getCategories();
    this.cart$ = this.cartService.cart$;
    this.cartTotal$ = this.cartService.cartTotal$;
    this.cart = this.cartService.getCurrentCartValue();
    this.currentUser$ = this.accountService.currentUser$;
  }

  logout() {
    this.accountService.logout();
    this.router.navigateByUrl('/');
  }

  fetchCartItems() {
    clearTimeout(this.fetchTimeout);

    $(".bloader", ".cartMenu").show();

    this.fetchTimeout = setTimeout(() => {
      this.cart = this.cartService.getCurrentCartValue();
      console.log(this.cart);

      $(".bloader", ".cartMenu").hide();

      if (this.cart && this.cart.cartItems.length > 0) {
        $(".select-items", ".cart-items-modal").show();
        $(".select-total", ".cart-items-modal").show();
        $(".select-button", ".cart-items-modal").show();
      }
      else {
        console.log($("#no-products"));
        $("#no-products", ".cart-items-modal").show();
      }
    }, 1000);
  }

  stopFetchingCartItems() {
    if (this.cart && this.cart.cartItems.length > 0) {
      $(".select-items", ".cart-items-modal").hide();
      $(".select-total", ".cart-items-modal").hide();
      $(".select-button", ".cart-items-modal").hide();
    }
    else {
      console.log($("#no-products"));
      $("#no-products", ".cart-items-modal").hide();
    }
    clearTimeout(this.fetchTimeout);
  }

  onSearch() {
    if (this.search.nativeElement.value) {
      console.log(this.search.nativeElement.value);
      this.router.navigate(['/shop'], { queryParams: { search: this.search.nativeElement.value.toString() }});
    }
  }

}

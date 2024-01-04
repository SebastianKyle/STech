import { Injectable } from '@angular/core';
import {environment} from "../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {BehaviorSubject, map, Observable} from "rxjs";
import {Cart, ICart, ICartItem, ICartTotals} from "../shared/models/cart";
import {IProduct} from "../shared/models/product";
import {ToastrService} from "ngx-toastr";
import {ShopService} from "../shop/shop.service";
import {IDeliveryMethod} from "../shared/models/deliveryMethod";

@Injectable({
  providedIn: 'root'
})
export class CartService {
  baseUrl = environment.apiUrl;
  private cartSource = new BehaviorSubject<ICart>(new Cart());
  cart$ = this.cartSource.asObservable();
  private cartTotalSource = new BehaviorSubject<ICartTotals>({
    shipping: 0,
    subTotal: 0,
    total: 0
  });
  cartTotal$ = this.cartTotalSource.asObservable();
  matchingProducts: IProduct[] = [];
  shipping = 0;

  constructor(private http: HttpClient, private toastr: ToastrService, private shopService: ShopService) {
    if (this.cartSource.value) {
      if (!localStorage.getItem('cart_id'))
        localStorage.setItem('cart_id', this.cartSource.value.id);
    }
  }

  createPaymentIntent() {
    return this.http.post<ICart>(this.baseUrl + 'Payment/' + this.getCurrentCartValue().id, {})
      .pipe(
        map((cart: ICart) => {
          this.cartSource.next(cart);
          console.log(this.getCurrentCartValue());
        })
      );
  }

  setShippingPrice(deliveryMethod: IDeliveryMethod) {
    this.shipping = deliveryMethod.price;
    const cart = this.getCurrentCartValue();
    cart.deliveryMethodID = deliveryMethod.id;
    cart.shippingPrice = deliveryMethod.price;
    this.calculateTotals();
    this.setCart(cart);
  }

  getCart(id: string) {
    return this.http.get<ICart>(this.baseUrl + 'Cart?cartID=' + id)
      .pipe(
        map((cart: ICart) => {
          this.cartSource.next(cart);
          this.shipping = cart.shippingPrice ? cart.shippingPrice : 0;
          this.calculateTotals();
        })
      );
  }

  setCart(cart: ICart) {
    return this.http.post<ICart>(this.baseUrl + 'Cart', cart).subscribe((response: ICart) => {
      this.cartSource.next(response);
      this.calculateTotals();
    }, error => {
      console.log(error);
    });
  }

  getCurrentCartValue() {
    return this.cartSource.value;
  }

  addItemToCart(item: IProduct, quantity = 1) {
    const itemToAdd: ICartItem = this.mapProductItemToCartItem(item, quantity);
    const cart = this.getCurrentCartValue().id === '' ? this.createCart() : this.getCurrentCartValue();

    cart.cartItems = this.addOrUpdateItem(cart.cartItems, itemToAdd, quantity);

    this.setCart(cart);
  }

  incrementItemQuantity(item: ICartItem) {
    const cart = this.getCurrentCartValue();
    const foundItemIndex = cart.cartItems.findIndex(i => i.id === item.id);

    if (cart.cartItems[foundItemIndex].quantity < cart.cartItems[foundItemIndex].stockQuantity) {
      cart.cartItems[foundItemIndex].quantity++;
      this.setCart(cart);
    }
  }

  decrementItemQuantity(item: ICartItem) {
    const cart = this.getCurrentCartValue();
    const foundItemIndex = cart.cartItems.findIndex(i => i.id === item.id);

    if (cart.cartItems[foundItemIndex].quantity > 1) {
      cart.cartItems[foundItemIndex].quantity--;
      this.setCart(cart);
    }
    else
      this.removeItemFromCart(item);
  }

  private calculateTotals() {
    const cart = this.getCurrentCartValue();
    const shipping = this.shipping;
    const subTotal = cart.cartItems.reduce((a, b) => (b.price * b.quantity) + a, 0);
    const total = subTotal + shipping;
    this.cartTotalSource.next({shipping, total, subTotal});
  }

  private mapProductItemToCartItem(item: IProduct, quantity: number) : ICartItem {
    return {
      id: item.productID,
      productName: item.name,
      price: item.price,
      pictureUrl: item.pictureUrls[0],
      quantity: quantity,
      categoryName: item.categoryName,
      stockQuantity: item.stockQuantity
    }
  }

  private createCart() : ICart{
    const cart = new Cart();
    localStorage.setItem('cart_id', cart.id);

    return cart;
  }

  private addOrUpdateItem(items: ICartItem[], itemToAdd: ICartItem, quantity: number): ICartItem[] {
    const index = items.findIndex(i => i.id === itemToAdd.id);
    if (index === -1) {
      itemToAdd.quantity = quantity;
      items.push(itemToAdd);
    }
    else {
      items[index].quantity += quantity;
    }

    return items;
  }

  removeItemFromCart(item: ICartItem) {
    const cart = this.getCurrentCartValue();
    if (cart.cartItems.some(x => x.id === item.id)) {
      cart.cartItems = cart.cartItems.filter(i => i.id !== item.id);
      if (cart.cartItems.length > 0) {
        this.setCart(cart);
      }
      else {
        this.deleteCart(cart);
      }
    }
  }

  deleteLocalCart(id: string) {
    this.cartSource.next({ id: '', cartItems: [] });
    this.cartTotalSource.next({ shipping: 0, subTotal: 0, total: 0 });
    this.shipping = 0;
    localStorage.removeItem('cart_id');
  }

  deleteCart(cart: ICart) {
    return this.http.delete(this.baseUrl + 'Cart?cartID=' + cart.id).subscribe(() => {
      this.cartSource.next({ id: '', cartItems: [] });
      this.cartTotalSource.next({ shipping: 0, subTotal: 0, total: 0 });
      this.shipping = 0;
      localStorage.removeItem('cart_id');
    }, error => {
      console.log(error);
    });
  }
}

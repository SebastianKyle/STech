import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from "@angular/common/http";
import {ProductDetailsPagination} from "../../shared/models/pagination";
import {environment} from "../../../environments/environment";
import {ShopParams} from "../../shared/models/params";
import {map} from "rxjs";
import {IProductDetails} from "../../shared/models/product";
import {ICategory} from "../../shared/models/category";

@Injectable({
  providedIn: 'root'
})
export class ProductsService {
  baseUrl = environment.apiUrl;
  productParams: ShopParams = new ShopParams();
  productDetailsPagination: ProductDetailsPagination = new ProductDetailsPagination();

  constructor(private http: HttpClient) { }

  getProductParams() {
    return this.productParams;
  }

  setProductParams(params: ShopParams) {
    this.productParams = params;
  }

  getProducts() {
    let params = new HttpParams();
    params = params.append('pageIndex', this.productParams.pageIndex);
    params = params.append('pageSize', this.productParams.pageSize);

    if (this.productParams.categoryID > 0) {
      params = params.append('categoryID', this.productParams.categoryID);
    }

    if (this.productParams.searchTerm !== '') {
      params = params.append('searchTerm', this.productParams.searchTerm);
    }

    return this.http.get<ProductDetailsPagination>(this.baseUrl + 'Product/get', { observe: 'response', params })
      .pipe(
        map(response => {
          if (response.body) {
            this.productDetailsPagination = response.body;
          }
          else {
            console.log('Null response at getProducts - product.service.ts');
          }

          return this.productDetailsPagination;
        })
      );
  }

  getProduct(id: number) {
    return this.http.get<IProductDetails>(this.baseUrl + 'Product/get/' + id.toString());
  }

  deleteProduct(id: number) {
    return this.http.delete(this.baseUrl + 'Product/delete/' + id.toString());
  }

  createProduct(formData: any) {
    return this.http.post(this.baseUrl + 'Product/create', formData);
  }

  updateProduct(formData: any) {
    return this.http.post(this.baseUrl + 'Product/update', formData);
  }

  getAllCategories() {
    return this.http.get<ICategory[]>(this.baseUrl + 'Category/getall');
  }

  deleteProductPicture(id: number) {
    return this.http.delete(this.baseUrl + 'Product/deleteprodpic/' + id.toString());
  }
}

import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from "@angular/common/http";
import {environment} from "../../environments/environment";
import {IProduct} from "../shared/models/product";
import {ICategoryResponse, ICategoryWithChildren} from "../shared/models/category";
import {CommentPagination, ProductPagination} from "../shared/models/pagination";
import {CommentParams, Params, ShopParams} from "../shared/models/params";
import {map, of} from "rxjs";
import {IComment} from "../shared/models/comment";

@Injectable({
  providedIn: 'root'
})
export class ShopService {
  baseUrl = environment.apiUrl;
  products: IProduct[] = [];
  categories: ICategoryWithChildren[] = [];
  pagination: ProductPagination = new ProductPagination();
  commentPagination: CommentPagination = new CommentPagination();
  shopParams = new ShopParams();
  commentParams = new CommentParams();
  productCache = new Map();

  constructor(private http: HttpClient) {

  }

  getProducts(useCache: boolean) {
    if (useCache === false) {
      this.productCache = new Map();
    }

    if (this.productCache.size > 0 && useCache === true) {
      if (this.productCache.has(Object.values(this.shopParams).join('-'))) {
        this.pagination.data = this.productCache.get(Object.values(this.shopParams).join('-'));
        return of(this.pagination);
      }
    }

    let params = new HttpParams();

    if (this.shopParams.categoryID != 0) {
      params = params.append('categoryID', this.shopParams.categoryID.toString());
    }

    if (this.shopParams.searchTerm !== '') {
      params = params.append('searchTerm', this.shopParams.searchTerm);
    }

    params = params.append('sort', this.shopParams.sort);
    params = params.append('pageIndex', this.shopParams.pageIndex.toString());
    params = params.append('pageSize', this.shopParams.pageSize.toString());

    return this.http.get<ProductPagination>(this.baseUrl + 'Products', { observe: 'response', params })
      .pipe(
        map(response => {
          if (response.body) {
            this.productCache.set(Object.values(this.shopParams).join('-'), response.body.data);
            this.pagination = response.body;
          }
          else {
            console.log("Null response body at getProducts() - shop.service.ts!");
          }

          return this.pagination;
        })
      );
  }

  setShopParams(params: ShopParams) {
    this.shopParams = params;
  }

  getShopParams() {
    return this.shopParams;
  }

  getProduct(id: number) {
    let product: IProduct | undefined;
    this.productCache.forEach((products: IProduct[]) => {
      product = products.find(p => p.productID === id);
    });

    if (product) {
      return of(product);
    }

    return this.http.get<IProduct>(this.baseUrl + 'Products/' + id);
  }

  getProductDetails(id: number) {
    return this.http.get<IProduct>(this.baseUrl + 'Products/' + id);
  }

  getCategories() {
    if (this.categories.length > 0) {
      return of(this.categories);
    }

    return this.http.get<ICategoryResponse>(this.baseUrl + 'Category/all')
      .pipe(
        map(response => {
          this.categories = response.categoryWithChildren;
          return response.categoryWithChildren;
        })
      );
  }

  getCommentsParams() {
    return this.commentParams;
  }

  setCommentsParams(params: CommentParams) {
    this.commentParams = params;
  }

  getComments(id: number) {
    this.commentParams.entityID = id;

    let params = new HttpParams();
    params = params.append('entityID', this.commentParams.entityID.toString());

    if (this.shopParams.searchTerm !== '') {
      params = params.append('searchTerm', this.commentParams.searchTerm);
    }

    params = params.append('sort', this.commentParams.sort);
    params = params.append('pageIndex', this.commentParams.pageIndex.toString());
    params = params.append('pageSize', this.commentParams.pageSize.toString());

    return this.http.get<CommentPagination>(this.baseUrl + 'Comment/product', { observe: 'response', params})
      .pipe(
        map(response => {
          if (response.body) {
            this.commentPagination = response.body;
          }
          else {
            console.log('Null response body at getComments - shop.service.ts');
          }

          return this.commentPagination;
        })
      );
  }

  leaveComment(comment: IComment) {
    return this.http.post<IComment>(this.baseUrl + 'Comment/leave', comment);
  }

  deleteComment(id: number) {
    return this.http.delete(this.baseUrl + 'Comment/delete/' + id.toString());
  }
}

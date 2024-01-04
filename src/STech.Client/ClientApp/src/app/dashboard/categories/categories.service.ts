import { Injectable } from '@angular/core';
import {environment} from "../../../environments/environment";
import {HttpClient, HttpParams} from "@angular/common/http";
import {CategoryPagination} from "../../shared/models/pagination";
import {ICategory} from "../../shared/models/category";
import {Params} from "../../shared/models/params";
import {map} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class CategoriesService {
  baseUrl = environment.apiUrl;
  categoryParams: Params = new Params();
  categoryPagination: CategoryPagination = new CategoryPagination();

  constructor(private http :HttpClient) { }

  getCategoryParams() {
    return this.categoryParams;
  }

  setCategoryParams(params: Params) {
    this.categoryParams = params;
  }

  getCategories() {
    let params = new HttpParams();
    params = params.append('pageSize', this.categoryParams.pageSize);
    params = params.append('pageIndex', this.categoryParams.pageIndex);

    if (this.categoryParams.searchTerm) {
      params = params.append('searchTerm', this.categoryParams.searchTerm);
    }

    return this.http.get<CategoryPagination>(this.baseUrl + 'Category/get', { observe: 'response', params })
      .pipe(
        map(response => {
          if (response.body) {
            this.categoryPagination = response.body;
          }
          else {
            console.log('Null response at getCategories() - category.service.ts');
          }

          return this.categoryPagination;
        })
      );
  }

  getCategory(id: number) {
    return this.http.get<ICategory>(this.baseUrl + 'Category/' + id.toString());
  }

  deleteCategory(id: number) {
    return this.http.delete(this.baseUrl + 'Category/delete/' + id.toString());
  }

  createCategory(values: any) {
    return this.http.post(this.baseUrl + 'Category/create', values);
  }

  updateCategory(values: any) {
    return this.http.post(this.baseUrl + 'Category/update', values);
  }

  getTopLevelCategories() {
    return this.http.get<ICategory[]>(this.baseUrl + 'Category/toplevel');
  }
}

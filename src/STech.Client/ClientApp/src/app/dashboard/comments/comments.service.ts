import { Injectable } from '@angular/core';
import {environment} from "../../../environments/environment";
import {HttpClient, HttpParams} from "@angular/common/http";
import {CommentParams} from "../../shared/models/params";
import {CommentPagination, CommentWithProductPagination} from "../../shared/models/pagination";
import {map} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class CommentsService {
  baseUrl = environment.apiUrl;
  commentParams: CommentParams = new CommentParams();
  commentPagination: CommentWithProductPagination = new CommentWithProductPagination();

  constructor(private http: HttpClient) { }

  getCommentParams() {
    return this.commentParams;
  }

  setCommentParams(commentParams: CommentParams) {
    this.commentParams = commentParams;
  }

  getComments() {
    let params = new HttpParams();
    params = params.append('sort', this.commentParams.sort);
    params = params.append('pageIndex', this.commentParams.pageIndex);
    params = params.append('pageSize', this.commentParams.pageSize);
    params = params.append('searchTerm', this.commentParams.searchTerm);

    if (this.commentParams.userID && this.commentParams.userID !== '') {
      params = params.append('userID', this.commentParams.userID);
    }

    if (this.commentParams.entityID && this.commentParams.entityID > 0) {
      params = params.append('entityID', this.commentParams.entityID);
    }

    return this.http.get<CommentWithProductPagination>(this.baseUrl + 'Comment/user', { observe: 'response', params })
      .pipe(
        map(response => {
          if (response.body) {
            this.commentPagination = response.body;
          }
          else {
            console.log("Null response body at getComments() - comments.service.ts");
          }

          return this.commentPagination;
        })
      );
  }

  getDashboardUserComments() {
    let params = new HttpParams();
    params = params.append('sort', this.commentParams.sort);
    params = params.append('pageIndex', this.commentParams.pageIndex);
    params = params.append('pageSize', this.commentParams.pageSize);
    params = params.append('searchTerm', this.commentParams.searchTerm);

    if (this.commentParams.userID && this.commentParams.userID !== '') {
      params = params.append('userID', this.commentParams.userID);
    }

    if (this.commentParams.entityID && this.commentParams.entityID > 0) {
      params = params.append('entityID', this.commentParams.entityID);
    }

    return this.http.get<CommentWithProductPagination>(this.baseUrl + 'Comment/get', { observe: 'response', params })
      .pipe(
        map(response => {
          if (response.body) {
            this.commentPagination = response.body;
          }
          else {
            console.log("Null response body at getDashboardUserComments() - comments.service.ts");
          }

          return this.commentPagination;
        })
      );
  }
}

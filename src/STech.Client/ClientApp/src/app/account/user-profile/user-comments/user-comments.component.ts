import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {AccountService} from "../../account.service";
import {CommentParams} from "../../../shared/models/params";
import {IComment, ICommentWithProduct} from "../../../shared/models/comment";
import {CommentPagination, CommentWithProductPagination} from "../../../shared/models/pagination";
import {User} from "oidc-client";
import {ShopService} from "../../../shop/shop.service";
import Swal from "sweetalert2";
import {ToastrService} from "ngx-toastr";
import {CommaExpr} from "@angular/compiler";

@Component({
  selector: 'app-user-comments',
  templateUrl: './user-comments.component.html',
  styleUrls: ['./user-comments.component.css']
})
export class UserCommentsComponent implements OnInit{
  @ViewChild('search') commentSearch: ElementRef;
  commentParams: CommentParams = new CommentParams();
  userComments: ICommentWithProduct[] = [];
  commentsPagination: CommentWithProductPagination;
  totalCommentsCount: number = 0;

  constructor(private accountService: AccountService, private shopService: ShopService, private toastr: ToastrService) {

  }

  ngOnInit(): void {
    this.commentParams = this.accountService.getCommentParams();
    this.getUserComments();
  }

  getUserComments() {
    this.accountService.getUserComments().subscribe(response => {
      this.commentsPagination = response;
      this.userComments = response.data;
      this.totalCommentsCount = response.count;
      console.log(response);
    }, error => {
      console.log(error);
    });
  }

  searchComments() {
    const commentParams = this.accountService.getCommentParams();
    commentParams.searchTerm = this.commentSearch.nativeElement.value;
    this.accountService.setCommentParams(commentParams);
    this.getUserComments();
  }

  resetComments() {
    this.commentSearch.nativeElement.value = '';
    this.accountService.setCommentParams(new CommentParams());
    this.getUserComments();
  }

  deleteComment(id: number) {
    Swal.fire({
      title: "Are you sure you want to delete this comment ?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it',
      cancelButtonText: 'No, dont delete'
    }).then((result) => {
      if (result.value) {
        this.shopService.deleteComment(id).subscribe((response) => {
          this.getUserComments();
        }, error => {
          console.log(error);
          // this.toastr.error(error.message);
        });
      }
    });
  }

  onPageChanged(event: any) {
    const params = this.accountService.getCommentParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.accountService.setCommentParams(params);
      this.getUserComments();
    }
  }
}

import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {CommentsService} from "./comments.service";
import {ICommentWithProduct} from "../../shared/models/comment";
import {CommentParams} from "../../shared/models/params";

@Component({
  selector: 'app-comments',
  templateUrl: './comments.component.html',
  styleUrls: ['./comments.component.css']
})
export class CommentsComponent implements OnInit {
  @ViewChild('commentSearch') commentSearch: ElementRef;
  commentParams: CommentParams = new CommentParams();
  comments: ICommentWithProduct[] = [];
  totalCommentsCount = 0;

  constructor(private commentService: CommentsService) {

  }

  ngOnInit(): void {
    this.commentParams.pageSize = 5;
    this.commentService.setCommentParams(this.commentParams);
    this.getComments();
  }

  getComments() {
    this.commentService.getDashboardUserComments().subscribe(response => {
      this.comments = response.data;
      this.totalCommentsCount = response.count;
    }, error => {
      console.log(error);
    });
  }

  onPageChanged(event: any) {
    const params = this.commentService.getCommentParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.commentService.setCommentParams(params);
      this.getComments();
    }
  }

  onSearch() {
    const params = this.commentService.getCommentParams();
    if (this.commentSearch.nativeElement.value) {
      params.searchTerm = this.commentSearch.nativeElement.value;
      this.commentService.setCommentParams(params);
      this.getComments();
    }
  }

  onReset() {
    this.commentSearch.nativeElement.value = '';
    this.commentParams.searchTerm = '';
    this.commentParams.pageIndex = 1;
    this.commentService.setCommentParams(this.commentParams);
    this.getComments();
  }

}

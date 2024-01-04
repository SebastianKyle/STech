import {Component, OnInit} from '@angular/core';
import {IProduct} from "../../shared/models/product";
import {IComment} from "../../shared/models/comment";
import {HttpClient} from "@angular/common/http";
import {ShopService} from "../shop.service";
import {ActivatedRoute} from "@angular/router";
import {CommentParams} from "../../shared/models/params";
import {CartService} from "../../cart/cart.service";
import {ToastrService} from "ngx-toastr";
import Swal, {SweetAlertOptions} from "sweetalert2";
import {IUser} from "../../shared/models/user";
import {Observable} from "rxjs";
import {AccountService} from "../../account/account.service";
import {getLocaleCurrencyName} from "@angular/common";
import {FormControl, FormGroup, Validators} from "@angular/forms";

declare var $: any;

type CartSweetAlertOptions = SweetAlertOptions & {
  onOpen?: (toast: any) => void;
};

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.css']
})
export class ProductDetailsComponent implements OnInit {
  product: IProduct;
  comments: IComment[];
  commentsCount: number;
  quantity = 1;
  commentParams: CommentParams = new CommentParams();
  currentUser$: Observable<IUser>;
  commentForm: FormGroup;
  rating: number = 5;
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

  constructor(private shopService: ShopService,
              private cartService: CartService,
              private toastr: ToastrService,
              private accountService: AccountService,
              private activatedRoute: ActivatedRoute) {
    this.commentParams = shopService.getCommentsParams();
  }

  ngOnInit(): void {
    this.currentUser$ = this.accountService.currentUser$;
    this.loadProduct();
    this.loadComments();

    this.createCommentForm();
    this.setRatingStar();
  }

  createCommentForm() {
    this.commentForm = new FormGroup({
      rating: new FormControl(null, Validators.required),
      text: new FormControl(null, Validators.required),
      entityID: new FormControl(null, Validators.required)
    });
  }

  loadProduct() {
    this.shopService.getProductDetails(+this.activatedRoute.snapshot.paramMap.get('id')!).subscribe(product => {
      console.log(product);
      this.product = product;
    }, error => {
      console.log(error);
    });
  }

  loadComments() {
    this.shopService.getComments(+this.activatedRoute.snapshot.paramMap.get('id')!).subscribe(comments => {
      this.comments = comments.data;
      this.commentsCount = comments.count;
    }, error => {
      console.log(error);
    });
  }

  onCommentPageChanged(event: any) {
    const params = this.shopService.getCommentsParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.shopService.setCommentsParams(params);
      this.loadComments();
    }
  }

  incrementQuantity() {
    if (this.quantity < this.product.stockQuantity)
      this.quantity++;
  }

  decrementQuantity() {
    if (this.quantity > 1)
      this.quantity--;
  }

  addItemToCart() {
    this.cartService.addItemToCart(this.product, this.quantity);
    this.Toast.fire({
      icon: 'success',
      iconHtml: '<i class="fas fa-cart-plus"></i>',
      title: 'Item added to cart!'
    });
  }

  setRatingStar() {
    $(".ratingStar").click(function (this: HTMLElement) {
      console.log(this);
      $(".ratingStar").addClass("far").removeClass("fas");

      var $thisStar = $(this);
      $thisStar.addClass("fas").removeClass("far");
      $thisStar.prevAll(".ratingStar").addClass("fas").removeClass("far");
      $("#ratingsValue").val($thisStar.attr("data-value"));
      $("#ratingDisplay").html($thisStar.attr("data-value"));
    });
  }

  setRating(rating: number) {
    this.rating = rating;
    this.commentForm.get('rating')?.patchValue(rating);
  }

  leaveComment() {
    this.commentForm.get('rating')?.patchValue(this.rating);
    this.commentForm.get('entityID')?.patchValue(this.product.productID);

    if (this.commentForm.invalid) {
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please fill out your comment!'
      });
    }
    else {
      const commentToLeave = {
        rating: +this.commentForm.get('rating')?.value,
        text: this.commentForm.get('text')?.value,
        entityID: +this.commentForm.get('entityID')?.value
      } as IComment;

      this.shopService.leaveComment(commentToLeave).subscribe((comment: IComment) => {
        if (comment.commentID) {
          this.loadComments();

          this.rating = 5;
          this.commentForm.get('rating')?.patchValue(null);
          this.commentForm.get('text')?.patchValue(null);
          this.commentForm.get('entityID')?.patchValue(null);
        }
      }, error => {
        console.log(error);
      });
    }
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
          this.loadComments();
        }, error => {
          console.log(error);
          this.toastr.error(error.message);
        });
      }
    });

  }
}

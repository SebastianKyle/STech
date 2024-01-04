import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {UsersService} from "../users.service";
import {ActiveElement} from "chart.js";
import {ActivatedRoute, Router} from "@angular/router";
import {IUser, IUserDetails} from "../../../shared/models/user";
import {IOrderDetails, OrderStatus} from "../../../shared/models/order";
import {ICommentWithProduct} from "../../../shared/models/comment";
import Swal from "sweetalert2";
import {CommentParams, OrderParams} from "../../../shared/models/params";
import {OrdersService} from "../../orders/orders.service";
import {CommentsService} from "../../comments/comments.service";
import {User} from "oidc-client";

@Component({
  selector: 'app-user-details',
  templateUrl: './user-details.component.html',
  styleUrls: ['./user-details.component.css']
})
export class UserDetailsComponent implements OnInit {
  currentUser: IUserDetails;

  @ViewChild('assignUserRole') assignUserRole: ElementRef;
  roles: string[] = [];
  userRoles: string[] = [];

  @ViewChild('orderIDSearch') orderIDSearch: ElementRef;
  @ViewChild('orderStatusSearch') orderStatusSearch: ElementRef;
  orderParams: OrderParams = new OrderParams();
  userOrders: IOrderDetails[] = [];
  totalOrdersCount = 0;
  orderStatus = OrderStatus;

  @ViewChild('commentSearch') commentSearch: ElementRef;
  commentParams: CommentParams = new CommentParams();
  userComments: ICommentWithProduct[] = [];
  totalCommentsCount = 0;

  activeTab: string = 'Info';

  constructor(private userService: UsersService,
              private orderService: OrdersService,
              private commentService: CommentsService,
              private router: Router,
              private route: ActivatedRoute
  ) {

  }

  ngOnInit(): void {
    this.router.events.subscribe(() => {
      if (this.route.snapshot.url.length > 0) {
        this.getCurrentUser(this.route.snapshot.url[1].toString());
      }
    });
  }

  getCurrentUser(id: string) {
    this.userService.getCurrentUser(id).subscribe(user => {
      this.currentUser = user;
    }, error => {
      console.log(error);
    });
  }

  setActiveTab(tab: string) {
    this.activeTab = tab;

    if (tab === 'Roles') {
      if (this.userRoles.length === 0) {
        this.getUserRoles();
      }

      if (this.roles.length === 0) {
        this.getRoles();
      }
    }

    if (tab === 'Orders') {
      if (this.userOrders.length === 0) {
        this.orderParams.customerEmail = this.currentUser.email;
        this.orderService.setOrderParams(this.orderParams);
        this.getUserOrders();
      }
    }

    if (tab === 'Comments') {
      if (this.userComments.length === 0) {
        this.commentParams.userID = this.currentUser.id;
        this.commentService.setCommentParams(this.commentParams);
        this.getUserComments();
      }
    }
  }

  getUserRoles() {
    this.userService.getUserRoles(this.currentUser.id).subscribe(userRoles => {
      this.userRoles = userRoles;
    }, error => {
      console.log(error);
    });
  }

  getRoles() {
    this.userService.getRoles().subscribe(roles => {
      this.roles = roles;
    }, error => {
      console.log(error);
    });
  }

  removeUserFromRole(role: string) {
    this.userService.removeUserFromRole(this.currentUser.id, role).subscribe(response => {
      this.getUserRoles();
    }, error => {
      console.log(error);
    });
  }

  assignUserToRole() {
    if (this.assignUserRole.nativeElement.value !== '') {
      let role = this.assignUserRole.nativeElement.value;

      this.userService.assignUserToRole(this.currentUser.id, role).subscribe(response => {
        this.assignUserRole.nativeElement.value = '';
        this.getUserRoles();
      }, error => {
        console.log(error);
      });
    }
    else {
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please choose a role!'
      });
    }
  }

  getUserOrders() {
    this.orderService.getOrders().subscribe(response => {
      this.userOrders = response.data;
      this.totalOrdersCount = response.count;
    }, error => {
      console.log(error);
    });
  }

  onOrderSearch() {
    if (this.orderIDSearch.nativeElement.value) {
      this.orderParams.orderID = +this.orderIDSearch.nativeElement.value;
    }

    if (this.orderStatusSearch.nativeElement.value) {
      this.orderParams.orderStatus = +this.orderStatusSearch.nativeElement.value;
    }

    this.orderService.setOrderParams(this.orderParams);
    this.getUserOrders();
  }

  onOrderReset() {
    this.orderIDSearch.nativeElement.value = '';
    this.orderStatusSearch.nativeElement.value = 0;
    let newOrderParams = new OrderParams();
    newOrderParams.customerEmail = this.currentUser.email;
    this.orderService.setOrderParams(newOrderParams);
    this.getUserOrders();
  }

  onOrderPageChanged(event: any) {
    const params = this.orderService.getOrderParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.orderService.setOrderParams(params);
      this.getUserOrders();
    }
  }

  getOrderStatusInstance(value: number) {
    return this.orderStatus.find(o => o.value === value);
  }

  getUserComments() {
    this.commentParams.userID = this.currentUser.id;
    this.commentService.setCommentParams(this.commentParams);
    console.log(this.commentParams);

    this.commentService.getDashboardUserComments().subscribe(pagination => {
      this.userComments = pagination.data;
      this.totalCommentsCount = pagination.count;
    }, error => {
      console.log(error);
    });
  }

  onCommentSearch() {
    if (this.commentSearch.nativeElement.value) {
      this.commentParams.searchTerm = this.commentSearch.nativeElement.value;
      this.commentService.setCommentParams(this.commentParams);

      this.getUserComments();
    }
  }

  onCommentReset() {
    this.commentSearch.nativeElement.value = '';
    this.commentParams.searchTerm = '';
    this.commentParams.pageIndex = 1;
    this.commentService.setCommentParams(this.commentParams);
    this.getUserComments();
  }

  onCommentPageChanged(event: any) {
    const params = this.commentService.getCommentParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.commentService.setCommentParams(params);
      this.getUserComments();
    }
  }
}

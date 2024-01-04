import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {UsersService} from "./users.service";
import {ActivatedRoute, Router} from "@angular/router";
import {UserParams} from "../../shared/models/params";
import {User} from "oidc-client";
import {IUserManagement} from "../../shared/models/user";

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {
  @ViewChild('usernameEmailSearch') usernameEmailSearch: ElementRef;
  @ViewChild('userRoleSearch') userRoleSearch: ElementRef;
  userParams: UserParams = new UserParams();
  users: IUserManagement[] = [];
  totalUsersCount = 0;
  roles: string[] = [];

  constructor(private userService: UsersService, private router: Router, private route: ActivatedRoute) {

  }

  ngOnInit(): void {
    this.userParams = this.userService.getUserParams();
    this.getUsers();
    this.getRoles();
  }

  getUsers() {
    this.userService.getUsers().subscribe(pagination => {
      this.users = pagination.data;
      this.totalUsersCount = pagination.count;
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

  onSearch() {
    const params = this.userService.getUserParams();
    if (this.usernameEmailSearch.nativeElement.value) {
      params.userName = this.usernameEmailSearch.nativeElement.value;
    }

    if (this.userRoleSearch.nativeElement.value) {
      params.role = this.userRoleSearch.nativeElement.value;
    }

    this.userService.setUserParams(params);
    this.getUsers();
  }

  onReset() {
    this.usernameEmailSearch.nativeElement.value = '';
    this.userRoleSearch.nativeElement.value = '';
    this.userService.setUserParams(new UserParams());
    this.getUsers();
  }

  onPageChanged(event: any) {
    const params = this.userService.getUserParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.userService.setUserParams(params);
      this.getUsers();
    }
  }

}

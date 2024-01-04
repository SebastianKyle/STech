import {Component, OnInit} from '@angular/core';
import {Observable} from "rxjs";
import {IUser, IUserDetails} from "../../shared/models/user";
import {AccountService} from "../account.service";
import {User} from "oidc-client";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent implements OnInit {
  currentUser$: Observable<IUser>;
  userDetails: IUserDetails;
  activeTab: string = 'info';

  constructor(private accountService: AccountService, private router: Router, private route: ActivatedRoute) {

  }

  ngOnInit(): void {
    this.currentUser$ = this.accountService.currentUser$;
    this.getUserDetails();
    this.router.events.subscribe(() => {
      let childRoute = this.route.firstChild;
      if (childRoute) {
        this.activeTab = childRoute.snapshot.url[0].path;
      }
    });
  }

  getUserDetails() {
    this.accountService.getUserDetails().subscribe(userDetails => {
      console.log(userDetails);
      this.userDetails = userDetails;
    }, error => {
      console.log(error);
    });
  }

}

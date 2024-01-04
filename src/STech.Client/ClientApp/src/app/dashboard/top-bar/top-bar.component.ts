import {Component, OnInit} from '@angular/core';
import {AccountService} from "../../account/account.service";
import {Observable} from "rxjs";
import {IUser} from "../../shared/models/user";
import {Router} from "@angular/router";

@Component({
  selector: 'app-top-bar',
  templateUrl: './top-bar.component.html',
  styleUrls: ['./top-bar.component.css']
})
export class TopBarComponent implements OnInit {
  currentUser$: Observable<IUser>;

  constructor(private accountService: AccountService, private router: Router) {

  }

  ngOnInit(): void {
    this.currentUser$ = this.accountService.currentUser$;
  }

  logOut() {
    this.accountService.logout();
    this.router.navigateByUrl('/');
  }

}

import {Component, OnInit} from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {IUser} from "../../shared/models/user";
import {Observable} from "rxjs";
import {AccountService} from "../../account/account.service";

@Component({
  selector: 'app-side-bar',
  templateUrl: './side-bar.component.html',
  styleUrls: ['./side-bar.component.css']
})
export class SideBarComponent implements OnInit{
  activeTab: string = '';
  currentUser$: Observable<IUser>;

  constructor(private router: Router, private route: ActivatedRoute, private accountService: AccountService) {

  }

  ngOnInit(): void {
    this.currentUser$ = this.accountService.currentUser$;

    this.router.events.subscribe(() => {
      let childRoute = this.route.firstChild;
      if (childRoute) {
        if (childRoute.snapshot.url.length > 0) {
          this.activeTab = childRoute.snapshot.url[0].path;
        }
        else {
          this.activeTab = '';
        }
      }
    });
  }

}

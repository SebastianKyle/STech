import {Component, Input, OnInit} from '@angular/core';
import {FormGroup} from "@angular/forms";
import {AccountService} from "../../account/account.service";
import Swal from "sweetalert2";
import {IAddress} from "../../shared/models/address";

@Component({
  selector: 'app-checkout-shipping-details',
  templateUrl: './checkout-shipping-details.component.html',
  styleUrls: ['./checkout-shipping-details.component.css']
})
export class CheckoutShippingDetailsComponent implements OnInit{
  @Input() checkoutForm: FormGroup;
  loading = false;

  constructor(private accountService: AccountService) {

  }

  ngOnInit(): void {
  }

}

import {Component, Input, OnInit} from '@angular/core';
import {FormGroup} from "@angular/forms";

@Component({
  selector: 'app-checkout-contact-details',
  templateUrl: './checkout-contact-details.component.html',
  styleUrls: ['./checkout-contact-details.component.css']
})
export class CheckoutContactDetailsComponent implements OnInit{
  @Input() checkoutForm: FormGroup;

  constructor() {

  }

  ngOnInit(): void {
  }

}

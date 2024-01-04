import {Component, OnInit} from '@angular/core';
import {IUserDetails} from "../../../shared/models/user";
import {AccountService} from "../../account.service";
import {FormControl, FormGroup, Validators} from "@angular/forms";
import Swal from "sweetalert2";

@Component({
  selector: 'app-user-info',
  templateUrl: './user-info.component.html',
  styleUrls: ['./user-info.component.css']
})
export class UserInfoComponent implements OnInit {
  userDetails: IUserDetails;
  userDetailsForm: FormGroup;

  constructor(private accountService: AccountService) {

  }

  ngOnInit(): void {
    this.createUserDetailsForm();
    this.getUserDetails();
  }

  getUserDetails() {
    this.accountService.getUserDetails().subscribe(userDetails => {
      console.log(userDetails);
      this.userDetails = userDetails;

      // Populate user details
      this.userDetailsForm.get('fullName')?.patchValue(userDetails.fullName);
      this.userDetailsForm.get('email')?.patchValue(userDetails.email);
      this.userDetailsForm.get('username')?.patchValue(userDetails.userName);
      this.userDetailsForm.get('phoneNumber')?.patchValue(userDetails.phoneNumber);
      this.userDetailsForm.get('country')?.patchValue(userDetails.country);
      this.userDetailsForm.get('city')?.patchValue(userDetails.city);
      this.userDetailsForm.get('address')?.patchValue(userDetails.address);
      this.userDetailsForm.get('zipCode')?.patchValue(userDetails.zipCode);
    }, error => {
      console.log(error);
    });
  }

  createUserDetailsForm() {
    this.userDetailsForm = new FormGroup({
      fullName: new FormControl(null, Validators.required),
      email: new FormControl(null, Validators.required),
      username: new FormControl(null, Validators.required),
      phoneNumber: new FormControl(null, Validators.required),
      country: new FormControl(null, Validators.required),
      city: new FormControl(null, Validators.required),
      address: new FormControl(null, Validators.required),
      zipCode: new FormControl(null, Validators.required)
    });
  }

  updateUserDetails() {
    if (this.userDetailsForm.invalid) {
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please complete the required fields!'
      });
    }
    else {
      this.userDetails.fullName = this.userDetailsForm.get('fullName')?.value;
      this.userDetails.email = this.userDetailsForm.get('email')?.value;
      this.userDetails.userName = this.userDetailsForm.get('username')?.value;
      this.userDetails.phoneNumber = this.userDetailsForm.get('phoneNumber')?.value;
      this.userDetails.country = this.userDetailsForm.get('country')?.value;
      this.userDetails.city = this.userDetailsForm.get('city')?.value;
      this.userDetails.address = this.userDetailsForm.get('address')?.value;
      this.userDetails.zipCode = this.userDetailsForm.get('zipCode')?.value;

      this.accountService.updateUserDetails(this.userDetails).subscribe(response => {
        this.userDetails = response;
        this.patchUserDetailsFormValue();
      }, error => {
        console.log(error);
      });
    }
  }

  patchUserDetailsFormValue() {
    this.userDetailsForm.get('fullName')?.patchValue(this.userDetails.fullName);
    this.userDetailsForm.get('email')?.patchValue(this.userDetails.email);
    this.userDetailsForm.get('username')?.patchValue(this.userDetails.userName);
    this.userDetailsForm.get('phoneNumber')?.patchValue(this.userDetails.phoneNumber);
    this.userDetailsForm.get('country')?.patchValue(this.userDetails.country);
    this.userDetailsForm.get('city')?.patchValue(this.userDetails.city);
    this.userDetailsForm.get('address')?.patchValue(this.userDetails.address);
    this.userDetailsForm.get('zipCode')?.patchValue(this.userDetails.zipCode);
  }

}

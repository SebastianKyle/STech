import {Component, OnInit} from '@angular/core';
import {AsyncValidatorFn, FormBuilder, FormGroup, Validators} from "@angular/forms";
import {AccountService} from "../account.service";
import {Router} from "@angular/router";
import {map, of, switchMap, timer} from "rxjs";

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  registerForm: FormGroup;
  errors: string[];

  constructor(private fb: FormBuilder, private accountService: AccountService, private router: Router) {

  }

  ngOnInit(): void {
    this.createRegisterForm();
  }

  createRegisterForm() {
    this.registerForm = this.fb.group({
      fullName: ['', [Validators.required]],
      email: ['',
        [Validators.required, Validators.pattern('^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$')],
        [this.validateEmailNotTaken()]
      ],
      username: ['', Validators.required],
      password: [null, Validators.required],
      confirmPassword: [null, Validators.required]
    }, {
      validator: this.passwordMatchValidator
    });
  }

  passwordMatchValidator(g: FormGroup) {
    const password = g.get('password')?.value;
    const confirmPassword = g.get('confirmPassword')?.value;
    const mismatch = password === confirmPassword ? null : {'mismatch': true};

    g.get('confirmPassword')?.setErrors(mismatch);

    return mismatch;
  }

  validateEmailNotTaken(): AsyncValidatorFn {
    return control => {
      return timer(500).pipe(
        switchMap(() => {
          if (!control.value) {
            return of(null);
          }
          return this.accountService.checkEmailExists(control.value).pipe(
            map(res => {
              return res ? {emailExists: true} : null;
            })
          );
        })
      );
    };
  }

  onSubmit() {
    this.accountService.register(this.registerForm.value).subscribe(response => {
      this.router.navigateByUrl('/');
    }, error => {
      console.log(error);
      this.errors = error.errors;
    });
  }

}

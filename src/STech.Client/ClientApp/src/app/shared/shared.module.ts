import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PagerComponent } from './components/pager/pager.component';
import {ReactiveFormsModule} from "@angular/forms";



@NgModule({
  declarations: [
    PagerComponent
  ],
  exports: [
    PagerComponent,
    ReactiveFormsModule
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule
  ]
})
export class SharedModule { }

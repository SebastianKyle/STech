import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import {RouterLink} from "@angular/router";
import { SectionHeaderComponent } from './section-header/section-header.component';
import { NotFoundComponent } from './not-found/not-found.component';
import { ServerErrorComponent } from './server-error/server-error.component';
import {ToastrModule} from "ngx-toastr";
import { TestErrorComponent } from './test-error/test-error.component';



@NgModule({
  declarations: [
    HeaderComponent,
    FooterComponent,
    SectionHeaderComponent,
    NotFoundComponent,
    ServerErrorComponent,
    TestErrorComponent
  ],
    imports: [
        CommonModule,
        RouterLink,
        ToastrModule.forRoot({
          positionClass: 'toast-bottom-right',
          preventDuplicates: true
        })
    ],
  exports: [
    HeaderComponent,
    FooterComponent,
    SectionHeaderComponent
  ]
})
export class CoreModule { }

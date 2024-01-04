import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {CategoryPagination} from "../../shared/models/pagination";
import {ICategory} from "../../shared/models/category";
import {CategoriesService} from "./categories.service";
import {Params} from "../../shared/models/params";
import Swal from "sweetalert2";
import {ToastrService} from "ngx-toastr";

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.css']
})
export class CategoriesComponent implements OnInit {
  @ViewChild('categoryNameSearch') categoryNameSearch: ElementRef;
  categories: ICategory[] = [];
  totalCategoriesCount: number = 0;
  categoryParams: Params = new Params();

  constructor(private categoriesService: CategoriesService, private toastr: ToastrService) {
  }

  ngOnInit(): void {
    this.categoryParams.pageIndex = 1;
    this.categoryParams.pageSize = 8;
    this.categoriesService.setCategoryParams(this.categoryParams);
    this.getCategories();
  }

  getCategories() {
    this.categoriesService.getCategories().subscribe(response => {
      this.categories = response.data;
      this.totalCategoriesCount = response.count;
    }, error => {
      console.log(error);
    });
  }

  onCategoryNameSearch() {
    const params = this.categoriesService.getCategoryParams();
    if (this.categoryNameSearch.nativeElement.value) {
      params.searchTerm = this.categoryNameSearch.nativeElement.value;
      this.categoriesService.setCategoryParams(params);
      this.getCategories();
    }
  }

  onReset() {
    this.categoryParams.pageSize = 8;
    this.categoryParams.pageIndex = 1;
    this.categoryParams.searchTerm = '';

    this.categoryNameSearch.nativeElement.value = '';

    this.categoriesService.setCategoryParams(this.categoryParams);
    this.getCategories();
  }

  onPageChanged(event: any) {
    const params = this.categoriesService.getCategoryParams();
    if (event !== params.pageIndex) {
      params.pageIndex = event;
      this.categoriesService.setCategoryParams(params);
      this.getCategories();
    }
  }

  deleteCategory(id: number) {
    Swal.fire({
      title: "Are you sure you want to delete this category ?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it',
      cancelButtonText: 'No, dont delete'
    }).then((result) => {
      if (result.value) {
        this.categoriesService.deleteCategory(id).subscribe(response => {
          this.getCategories();
        }, error => {
          console.log(error);
        });
      }
    });
  }

}

import {AfterViewChecked, Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {FormControl, FormGroup, Validators} from "@angular/forms";
import Swal from "sweetalert2";
import {CategoriesService} from "../categories.service";
import {ICategory} from "../../../shared/models/category";
import {error} from "@angular/compiler-cli/src/transformers/util";

declare var $: any;

@Component({
  selector: 'app-category-details',
  templateUrl: './category-details.component.html',
  styleUrls: ['./category-details.component.css']
})
export class CategoryDetailsComponent implements OnInit, AfterViewChecked {
  @ViewChild('parentCategorySelect') parentCategorySelect: ElementRef;
  @ViewChild('categoryName') categoryName: ElementRef;
  @ViewChild('categoryDescription') categoryDescription: ElementRef;
  @ViewChild('categoryImage') categoryImage: ElementRef;
  action: string;
  categoryForm: FormGroup;
  categoryFormData: FormData = new FormData();
  topLevelCategories: ICategory[] = [];
  currentCategory: ICategory;

  constructor(private router: Router, private route: ActivatedRoute, private categoriesService: CategoriesService) {

  }

  ngOnInit(): void {
    this.router.events.subscribe(() => {
      if (this.route.snapshot.url.length > 0) {
        if (this.route.snapshot.url[1].path === 'create') {
          this.action = 'Create';
        }
        else {
          this.action = 'Edit';
          this.getCurrentCategory(+this.route.snapshot.url[2].path);
        }
      }
    });

    this.createCategoryForm();
    this.getTopLevelCategories();
  }

  ngAfterViewChecked(): void {
    if (this.parentCategorySelect) {
      $(this.parentCategorySelect.nativeElement).on('change', () => {
        if (this.parentCategorySelect.nativeElement.value > 0) {
          console.log(this.parentCategorySelect.nativeElement.value);
          this.categoryForm.get('parentCategoryID')?.patchValue(this.parentCategorySelect.nativeElement.value);
        }
      });
    }
  }

  createCategoryForm() {
    this.categoryForm = new FormGroup({
      id: new FormControl(null),
      name: new FormControl(null, Validators.required),
      description: new FormControl(null),
      parentCategoryID: new FormControl(null),
      picture: new FormControl(null)
    });
  }

  getTopLevelCategories() {
    this.categoriesService.getTopLevelCategories().subscribe(categories => {
      this.topLevelCategories = categories;
    }, error => {
      console.log(error);
    });
  }

  getCurrentCategory(id: number) {
    this.categoriesService.getCategory(id).subscribe(category => {
      this.currentCategory = category;

      this.categoryName.nativeElement.value = this.currentCategory.name;
      this.categoryDescription.nativeElement.value = this.currentCategory.description;

      this.categoryForm.get('id')?.patchValue(this.currentCategory.id);
      this.categoryForm.get('name')?.patchValue(this.currentCategory.name);
      this.categoryForm.get('description')?.patchValue(this.currentCategory.description);
      this.categoryForm.get('parentCategoryID')?.patchValue(this.currentCategory.parentCategoryID);
    }, error => {
      console.log(error);
    });
  }

  handlePictureInput(event: any) {
    this.categoryFormData.append('picture', event.target.files[0]);

    let reader = new FileReader();
    reader.onload = (e) => {
      this.categoryImage.nativeElement.src = e.target?.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  }

  createCategory() {
    if (this.categoryForm.invalid) {
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please provide category name!'
      });
    }
    else {
      this.categoryFormData.append('name', this.categoryForm.get('name')?.value);
      if (this.categoryForm.get('description')?.value) {
        this.categoryFormData.append('description', this.categoryForm.get('description')?.value);
      }

      if (this.categoryForm.get('parentCategoryID')?.value) {
        this.categoryFormData.append('parentCategoryID', this.categoryForm.get('parentCategoryID')?.value);
      }

      this.categoriesService.createCategory(this.categoryFormData).subscribe(response => {
        this.router.navigateByUrl('/dashboard/categories');
      }, error => {
        console.log(error);
      });
    }
  }

  updateCategory() {
    if (this.categoryForm.invalid) {
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please provide category name!'
      });
    }
    else {
      this.categoryFormData.append('id', this.categoryForm.get('id')?.value);
      this.categoryFormData.append('name', this.categoryForm.get('name')?.value);
      if (this.categoryForm.get('description')?.value) {
        this.categoryFormData.append('description', this.categoryForm.get('description')?.value);
      }

      if (this.categoryForm.get('parentCategoryID')?.value) {
        this.categoryFormData.append('parentCategoryID', this.categoryForm.get('parentCategoryID')?.value);
      }

      this.categoriesService.updateCategory(this.categoryFormData).subscribe(response => {
        this.router.navigateByUrl('/dashboard/categories');
      }, error => {
        console.log(error);
      });
    }
  }

  deleteCategory() {
    if (this.currentCategory) {
      this.categoriesService.deleteCategory(this.currentCategory.id).subscribe(response => {
        this.router.navigateByUrl('/dashboard/categories');
      }, error => {
        console.log(error);
      });
    }
  }

}

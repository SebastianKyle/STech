import {AfterViewChecked, Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {ProductsService} from "./products.service";
import {IProductDetails} from "../../shared/models/product";
import {ShopParams} from "../../shared/models/params";
import {ICategory} from "../../shared/models/category";

declare var $: any;

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit, AfterViewChecked {
  @ViewChild('productNameSearch') productNameSearch: ElementRef;
  @ViewChild('productCategorySearch') productCategorySearch: ElementRef;
  action: string;
  productParams: ShopParams = new ShopParams();
  products: IProductDetails[] = [];
  categories: ICategory[] = [];
  totalProductsCount = 0;

  constructor(private router: Router, private route: ActivatedRoute, private productService: ProductsService) {

  }

  ngOnInit(): void {
    this.productParams.pageSize = 8;
    this.productService.setProductParams(this.productParams);
    this.getProducts();
    this.getCategories();
  }

  ngAfterViewChecked(): void {
    // $(this.productNameSearch.nativeElement).on('change', () => {
    //   this.productParams.searchTerm = this.productNameSearch.nativeElement.value;
    //   this.productService.setProductParams(this.productParams);
    // });
    //
    // $(this.productCategorySearch.nativeElement).on('change', () => {
    //   this.productParams.categoryID = this.productCategorySearch.nativeElement.value;
    //   this.productService.setProductParams(this.productParams);
    // });
  }

  getProducts() {
    this.productService.getProducts().subscribe(pagination => {
      this.products = pagination.data;
      this.totalProductsCount = pagination.count;
    }, error => {
      console.log(error);
    });
  }

  getCategories() {
    this.productService.getAllCategories().subscribe(categories => {
      this.categories = categories;
    }, error => {
      console.log(error);
    });
  }

  onSearch() {
    const params = this.productService.getProductParams();
    if (this.productNameSearch.nativeElement.value) {
      params.searchTerm = this.productNameSearch.nativeElement.value;
      this.productService.setProductParams(params);
    }

    if (this.productCategorySearch.nativeElement.value > 0) {
      params.categoryID = this.productCategorySearch.nativeElement.value;
      this.productService.setProductParams(params);
    }

    this.getProducts();
  }

  onReset() {
    this.productParams.pageIndex = 1;
    this.productParams.pageSize = 8;
    this.productParams.searchTerm = '';
    this.productParams.categoryID = 0;

    this.productNameSearch.nativeElement.value = '';
    this.productCategorySearch.nativeElement.value = 0;

    this.productService.setProductParams(this.productParams);
    this.getProducts();
  }

  onPageChanged(event: any) {
    const params = this.productService.getProductParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.productService.setProductParams(params);

      this.getProducts();
    }
  }

}

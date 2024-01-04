import {AfterViewInit, ChangeDetectorRef, Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {ShopService} from "./shop.service";
import {IProduct} from "../shared/models/product";
import {ICategoryWithChildren} from "../shared/models/category";
import {Params, ShopParams} from "../shared/models/params";
import {ActivatedRoute} from "@angular/router";
import {CartService} from "../cart/cart.service";
import {ToastrService} from "ngx-toastr";
import Swal, {SweetAlertOptions} from "sweetalert2";

declare var $: any;

type CartSweetAlertOptions = SweetAlertOptions & {
  onOpen?: (toast: any) => void;
};

@Component({
  selector: 'app-shop',
  templateUrl: './shop.component.html',
  styleUrls: ['./shop.component.css']
})
export class ShopComponent implements OnInit, AfterViewInit {
  @ViewChild('search', { static: false }) searchTerm: ElementRef;
  products: IProduct[] = [];
  categories: ICategoryWithChildren[] = [];
  shopParams: ShopParams = new ShopParams();
  totalCount = 0;
  selectedSortOptions: string = 'name';
  sortOptions = [
    { name: 'Alphabetical', value: 'name' },
    { name: 'Price: Low to High', value: 'priceAsc' },
    { name: 'Price: High to Low', value: 'priceDesc' }
  ];
  selectedPageSizeOptions: number;
  pageSizeOptions = [
    { name: 'Show 6 Products', value: 6 },
    { name: 'Show 8 Products', value: 8 },
    { name: 'Show 10 Products', value: 10 },
    { name: 'Show 12 Products', value: 12 },
    { name: 'Show 15 Products', value: 15 },
    { name: 'Show 18 Products', value: 18 },
    { name: 'Show 20 Products', value: 20 },
    { name: 'Show 25 Products', value: 25 },
    { name: 'Show 30 Products', value: 30 },
    { name: 'Show 35 Products', value: 35 },
    { name: 'Show 40 Products', value: 40 }
  ];
  @ViewChild('selectSortOption') selectSortOption: ElementRef;
  @ViewChild('selectPageSize') selectPageSize: ElementRef;
  options: CartSweetAlertOptions = {
    toast: true,
    position: 'bottom',
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true,
    customClass: 'cart-swal',
    onOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer);
      toast.addEventListener('mouseleave', Swal.resumeTimer);
    }
  };
  Toast = Swal.mixin(this.options);

  constructor(private shopService: ShopService, private cartService: CartService, private toastr: ToastrService, private route: ActivatedRoute, private cdr: ChangeDetectorRef) {
    this.shopParams = shopService.getShopParams();
  }

  ngOnInit(): void {
    this.route.queryParamMap.subscribe(paramMap => {
      const params = this.shopService.getShopParams();

      if (paramMap.has('categoryID')) {
        params.categoryID = Number(paramMap.get('categoryID'));
      }

      if (paramMap.has('pageSize')) {
        params.pageSize = Number(paramMap.get('pageSize'));
      }

      if (paramMap.has('pageIndex')) {
        params.pageIndex = Number(paramMap.get('pageIndex'));
      }

      if (paramMap.has('sort')) {
        params.sort = paramMap.get('sort')!;
      }

      if (paramMap.has('search')) {
        params.searchTerm = paramMap.get('search')!;
        console.log(paramMap.get('search'));
      }

      this.shopService.setShopParams(params);
    });

    this.getProducts(true);
    this.getCategories();
  }

  ngAfterViewInit() {
    $(this.selectSortOption.nativeElement).niceSelect();
    $(this.selectSortOption.nativeElement).on('change', () => {
      this.onSortSelected(this.selectSortOption.nativeElement.value);
    });

    $(this.selectPageSize.nativeElement).niceSelect();
    $(this.selectPageSize.nativeElement).on('change', () => {
      console.log('Page size selected');
      this.onPageSizeSelected(this.selectPageSize.nativeElement.value);
    });
  }

  getProducts(useCache = false) {
    this.shopService.getProducts(useCache).subscribe(response => {
      this.products = response.data;
      this.totalCount = response.count;
      this.cdr.detectChanges();
    }, error => {
      console.log(error);
    });
  }

  getCategories() {
    this.shopService.getCategories().subscribe(response => {
      this.categories = response;
    }, error => {
      console.log(error);
    });
  }

  onCategorySelected(id: number) {
    const params = this.shopService.getShopParams();
    params.categoryID = id;
    this.shopService.setShopParams(params);
    this.getProducts();
  }

  onSortSelected(sort: string) {
    const params = this.shopService.getShopParams();
    params.sort = sort;
    this.shopService.setShopParams(params);
    this.getProducts();
  }

  onPageSizeSelected(pageSize: number) {
    const params = this.shopService.getShopParams();
    params.pageSize = pageSize;
    params.pageIndex = 1;
    this.shopService.setShopParams(params);
    this.getProducts();
  }

  onPageChanged(event: any) {
    const params = this.shopService.getShopParams();
    if (params.pageIndex !== event) {
      params.pageIndex = event;
      this.shopService.setShopParams(params);
      this.getProducts(true);
    }
  }

  onSearch() {
    const params = this.shopService.getShopParams();
    params.searchTerm = this.searchTerm.nativeElement.value;
    params.pageIndex = 1;
    this.shopService.setShopParams(params);
    this.getProducts();
  }

  onReset() {
    this.searchTerm.nativeElement.value = '';
    this.selectSortOption.nativeElement.value = 'name';
    this.selectPageSize.nativeElement.value = 20;
    $(this.selectSortOption.nativeElement).niceSelect('update');
    $(this.selectPageSize.nativeElement).niceSelect('update');

    this.shopParams = new ShopParams();
    this.shopService.setShopParams(this.shopParams);
    this.getProducts();
  }

  addItemToCart(product: IProduct) {
    this.cartService.addItemToCart(product);
    this.Toast.fire({
      icon: 'success',
      iconHtml: '<i class="fas fa-cart-plus"></i>',
      title: 'Item added to cart!'
    });
  }
}

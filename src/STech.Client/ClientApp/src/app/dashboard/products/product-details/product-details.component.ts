import {AfterViewChecked, Component, ElementRef, OnInit, Renderer2, ViewChild} from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {ICategory} from "../../../shared/models/category";
import {IProductDetails} from "../../../shared/models/product";
import {ProductsService} from "../products.service";
import Swal from "sweetalert2";
import {HttpClient} from "@angular/common/http";
import {map} from "rxjs";

declare var $: any;

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.css']
})
export class ProductDetailsComponent implements OnInit, AfterViewChecked {
  @ViewChild('productName') productName: ElementRef;
  @ViewChild('productDescription') productDescription: ElementRef;
  @ViewChild('productCategory') productCategory: ElementRef;
  @ViewChild('productPrice') productPrice: ElementRef;
  @ViewChild('productCost') productCost: ElementRef;
  @ViewChild('productStockQuantity') productStockQuantity: ElementRef;
  @ViewChild('productPictures') productPictures: ElementRef;
  @ViewChild('picturesHolder') picturesHolder: ElementRef;
  productForm: FormGroup;
  productFormData: FormData = new FormData();
  categories: ICategory[] = [];
  currentProduct: IProductDetails;
  action: string;
  pictures: { value: boolean, blob: Blob }[] = [];
  prodPicIDsToRemove: number[] = [];

  constructor(private http: HttpClient,
              private router: Router,
              private route: ActivatedRoute,
              private productService: ProductsService,
              private renderer: Renderer2) {

  }

  ngAfterViewChecked(): void {
    if (this.productCategory) {
      $(this.productCategory.nativeElement).on('change', () => {
        this.productForm.get('categoryID')?.patchValue(this.productCategory.nativeElement.value);
      });
    }
  }

  ngOnInit(): void {
    this.router.events.subscribe(() => {
      if (this.route.snapshot.url.length > 0) {
        if (this.route.snapshot.url[1].path === 'create') {
          this.action = 'Create';
        }
        else {
          this.action = 'Edit';
          this.getCurrentProduct(+this.route.snapshot.url[2].path);
        }
      }
    });

    this.createProductForm();
    this.getCategories();
  }

  createProductForm() {
    this.productForm = new FormGroup({
      id: new FormControl(null),
      name: new FormControl(null, Validators.required),
      description: new FormControl(null),
      categoryID: new FormControl(null, Validators.required),
      price: new FormControl(null, Validators.required),
      cost: new FormControl(null, Validators.required),
      stockQuantity: new FormControl(null, Validators.required)
    });
  }

  getCategories() {
    this.productService.getAllCategories().subscribe(categories => {
      this.categories = categories;
      this.productForm.get('categoryID')?.patchValue(1);
    }, error => {
      console.log(error);
    })
  }

  getCurrentProduct(id: number) {
    this.productService.getProduct(id).subscribe(product => {
      this.currentProduct = product;

      this.productName.nativeElement.value = this.currentProduct.name;
      this.productDescription.nativeElement.value = this.currentProduct.description;
      this.productCategory.nativeElement.value = this.currentProduct.categoryID;
      this.productPrice.nativeElement.value = this.currentProduct.price;
      this.productCost.nativeElement.value = this.currentProduct.cost;
      this.productStockQuantity.nativeElement.value = this.currentProduct.stockQuantity;

      this.productForm.get('id')?.patchValue(this.currentProduct.id);
      this.productForm.get('name')?.patchValue(this.currentProduct.name);
      this.productForm.get('description')?.patchValue(this.currentProduct.description);
      this.productForm.get('categoryID')?.patchValue(this.currentProduct.categoryID);
      this.productForm.get('price')?.patchValue(this.currentProduct.price);
      this.productForm.get('cost')?.patchValue(this.currentProduct.cost);
      this.productForm.get('stockQuantity')?.patchValue(this.currentProduct.stockQuantity);

      // Handle product pictures
      if (this.currentProduct.productPictures.length > 0) {
        this.currentProduct.productPictures.forEach(prodPic => {
          this.renderImage(prodPic.picture.url, prodPic.id);
        });
      }
    }, error => {
      console.log(error);
    })
  }

  handlePicturesInput(event: any) {
    this.pictures.push({ value: true, blob: event.target.files[event.target.files.length - 1] });
    console.log(event.target.files.length - 1);

    let reader = new FileReader();
    reader.onload = (e) => {
      this.renderImage(e.target?.result, 0, this.pictures.length - 1);
    };
    reader.readAsDataURL(event.target.files[event.target.files.length - 1]);
  }

  renderImage(src: any, prodPicID: number = 0, picIndex: number = -1) {
    const d2 = this.renderer.createElement('div');
    d2.className = 'thisImage col-md-3';
    const card = this.renderer.createElement('div');
    card.className = 'card mt-4';
    const uPicHolder = this.renderer.createElement('div');
    uPicHolder.className = 'uPicHolder card-body text-center';
    const img = this.renderer.createElement('img');
    img.className = 'image img-thumbnail';
    img.src = src;
    const cardFooter = this.renderer.createElement('div');
    cardFooter.className = 'card-footer';
    const button = this.renderer.createElement('button');
    button.type = 'button';
    button.className = 'btn btn-danger';

    if (prodPicID > 0) {
      button.onclick = () => this.removeImage(button, prodPicID);
    }
    if (picIndex > -1) {
      button.onclick = () => this.removeImage(button, 0, picIndex);
    }

    const icon = this.renderer.createElement('i');
    const text = this.renderer.createText(' Remove Picture');
    icon.className = 'fas fa-times mr-1';
    this.renderer.appendChild(button, icon);
    this.renderer.appendChild(button, text);

    this.renderer.appendChild(cardFooter, button);
    this.renderer.appendChild(uPicHolder, img);
    this.renderer.appendChild(card, uPicHolder);
    this.renderer.appendChild(card, cardFooter);
    this.renderer.appendChild(d2, card);
    this.renderer.appendChild(this.picturesHolder.nativeElement, d2);
  }

  removeImage(button: any, id: number = 0, picIndex: number = -1) {
    const cardFooter = button.parentNode;
    const card = cardFooter.parentNode;
    const thisImage = card.parentNode;
    const picsHolder = thisImage.parentNode;

    this.renderer.removeChild(picsHolder, thisImage);

    if (id > 0) {
      this.prodPicIDsToRemove.push(id);
    }

    if (picIndex > -1) {
      // this.pictures.splice(picIndex, 1);
      this.pictures[picIndex].value = false;
      console.log(this.pictures);
    }
  }

  createProduct() {
    if (this.productForm.invalid) {
      this.productForm.markAllAsTouched();
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please fill out the required fields!'
      });
    }
    else {
      this.productFormData.append('name', this.productForm.get('name')?.value);
      this.productFormData.append('categoryID', this.productForm.get('categoryID')?.value);
      this.productFormData.append('price', this.productForm.get('price')?.value);
      this.productFormData.append('cost', this.productForm.get('cost')?.value);
      this.productFormData.append('stockQuantity', this.productForm.get('stockQuantity')?.value);

      if (this.productForm.get('description')?.value) {
        this.productFormData.append('description', this.productForm.get('description')?.value);
      }

      if (this.pictures.length > 0) {
        let count = 0;
        this.pictures.forEach(pic => {
          if (pic.value) {
            this.productFormData.append('pictures', pic.blob);
            count++;
          }
        })

        if (count === 0) {
          Swal.fire({
            icon: 'error',
            title: 'Warning',
            text: 'Please provide at least one product picture!'
          });

          return;
        }
      }
      else {
        Swal.fire({
          icon: 'error',
          title: 'Warning',
          text: 'Please provide at least one product picture!'
        });

        return;
      }

      this.productService.createProduct(this.productFormData).subscribe(response => {
        this.router.navigateByUrl('/dashboard/products');
      }, error => {
        console.log(error);
      });
    }
  }

  updateProduct() {
    if (this.productForm.invalid) {
      this.productForm.markAllAsTouched();
      Swal.fire({
        icon: 'error',
        title: 'Warning',
        text: 'Please fill out the required fields!'
      });
    }
    else {
      this.productFormData.append('id', this.productForm.get('id')?.value);
      this.productFormData.append('name', this.productForm.get('name')?.value);
      this.productFormData.append('categoryID', this.productForm.get('categoryID')?.value);
      this.productFormData.append('price', this.productForm.get('price')?.value);
      this.productFormData.append('cost', this.productForm.get('cost')?.value);
      this.productFormData.append('stockQuantity', this.productForm.get('stockQuantity')?.value);

      if (this.productForm.get('description')?.value) {
        this.productFormData.append('description', this.productForm.get('description')?.value);
      }

      let count = 0;
      if (this.pictures.length > 0) {
        this.pictures.forEach(pic => {
          if (pic.value) {
            this.productFormData.append('pictures', pic.blob);
            count++;
          }
        })
      }

      if (this.prodPicIDsToRemove.length > 0) {
        this.prodPicIDsToRemove.forEach(prodPicID => {
          this.productFormData.append('prodPicIDsToRemove', prodPicID.toString());
        });
      }

      if (count === 0 && this.prodPicIDsToRemove.length === this.currentProduct.productPictures.length) {
        Swal.fire({
          icon: 'error',
          title: 'Warning',
          text: 'Please provide at least one product picture!'
        });

        return;
      }

      this.productService.updateProduct(this.productFormData).subscribe(response => {
        this.router.navigateByUrl('/dashboard/products');
      }, error => {
        console.log(error);
      });
    }
  }

  deleteProduct() {
    if (this.currentProduct) {
      this.productService.deleteProduct(this.currentProduct.id).subscribe(response => {
        this.router.navigateByUrl('/dashboard/products');
      }, error => {
        console.log(error);
      });
    }
  }

}

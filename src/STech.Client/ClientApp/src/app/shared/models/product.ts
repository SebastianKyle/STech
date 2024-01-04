import {ProductRating} from "./productRatings";
import {ICategory} from "./category";
import {IPicture} from "./picture";

export interface IProduct {
  productID: number,
  id: number,
  name: string,
  description: string,
  price: number,
  stockQuantity: number,
  pictureUrls: string[],
  categoryName: string,
  ratings: ProductRating
}

export interface IProductList {
  products: IProduct[]
}

export interface IProductDetails {
  id: number;
  name: string;
  description: string;
  price: number;
  cost: number;
  stockQuantity: number;
  categoryID: number;
  category: ICategory;
  productPictures: IProductPictures[];
}

export interface IProductPictures {
  id: number;
  productID: number;
  pictureID: number;
  picture: IPicture;
}

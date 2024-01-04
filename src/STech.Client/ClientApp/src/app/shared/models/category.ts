import {IProduct} from "./product";
import {IPicture} from "./picture";

export interface ICategory {
  id: number,
  name: string,
  description: string,
  parentCategoryID: number,
  parentCategory: ICategory,
  pictureID: number,
  picture: IPicture,
  modifiedOn: string,
  products: IProduct[]
}

export interface ICategoryWithChildren {
  category: ICategory,
  children: ICategory[]
}

export interface ICategoryResponse {
  categoryWithChildren: ICategoryWithChildren[]
}

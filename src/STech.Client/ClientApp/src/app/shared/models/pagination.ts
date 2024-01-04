import {IProduct, IProductDetails} from "./product";
import {IComment, ICommentWithProduct} from "./comment";
import {IOrderDetails} from "./order";
import {ICategory} from "./category";
import {IUserManagement} from "./user";

export interface IPagination {
  pageIndex: number;
  pageSize: number;
  count: number;
  data: any[];
}

export class ProductPagination implements IPagination {
  count: number = 0;
  pageIndex: number = 1;
  pageSize: number = 20;
  data: IProduct[] = [];
}

export class ProductDetailsPagination implements IPagination {
  count: number;
  data: IProductDetails[];
  pageIndex: number;
  pageSize: number;
}

export class CommentPagination implements IPagination {
  count: number = 0;
  pageIndex: number = 1;
  pageSize: number = 10;
  data: IComment[] = [];
}

export class CommentWithProductPagination implements IPagination {
  count: number = 0;
  pageIndex: number = 1;
  pageSize: number = 10;
  data: ICommentWithProduct[] = [];
}

export class OrderPagination implements IPagination {
  count: number = 0;
  data: IOrderDetails[];
  pageIndex: number = 1;
  pageSize: number = 8;
}

export class CategoryPagination implements IPagination {
  count: number = 0;
  data: ICategory[] = [];
  pageIndex: number = 1;
  pageSize: number = 8;
}

export class UserPagination implements IPagination {
  count: number;
  data: IUserManagement[];
  pageIndex: number;
  pageSize: number;
}

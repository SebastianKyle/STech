export class Params {
  sort: string;
  pageIndex: number;
  pageSize: number;
  searchTerm: string;
}

export class ShopParams implements Params{
  categoryID = 0;
  sort = 'name';
  pageIndex = 1;
  pageSize = 20;
  searchTerm: string = '';
}

export class CommentParams implements Params {
  entityID: number;
  userID: string;
  sort = '';
  pageIndex = 1;
  pageSize = 10;
  searchTerm = '';
}

export class OrderParams implements Params {
  pageIndex: number = 1;
  pageSize: number = 6;
  searchTerm: string = '';
  sort: string = '';
  customerEmail: string;
  orderID: number;
  orderStatus: number;
}

export class UserParams implements Params {
  pageIndex: number = 1;
  pageSize: number = 8;
  searchTerm: string = '';
  sort: string = '';
  userName: string = '';
  role: string = '';
}


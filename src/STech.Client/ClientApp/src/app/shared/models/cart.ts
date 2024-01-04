import { v4 as uuidv4 } from 'uuid';

export interface ICart {
  id: string;
  cartItems: ICartItem[];
  clientSecret?: string;
  paymentIntentID?: string;
  deliveryMethodID?: number;
  shippingPrice?: number;
}

export interface ICartItem {
  id: number;
  productName: string;
  price: number;
  quantity: number;
  pictureUrl: string;
  categoryName: string;
  stockQuantity: number;
}

export class Cart implements ICart {
  id: string = uuidv4();
  cartItems: ICartItem[] = [];
}

export interface ICartTotals {
  shipping: number;
  subTotal: number;
  total: number;
}

import {IProduct} from "./product";
import {IDeliveryMethod} from "./deliveryMethod";

export interface IOrderToCreate {
  cartID: string;
  deliveryMethodID: number;
  paymentMethod: number;
  customerName: string;
  customerEmail: string;
  customerPhone: string;
  customerCountry: string;
  customerCity: string;
  customerAddress: string;
  customerZipCode: string;
}

export interface IOrder {
  id: number;
  customerID: number;
  customerName: string;
  customerEmail: string;
  customerPhone: string;
  customerCountry: string;
  customerCity: string;
  customerAddress: string;
  customerZipCode: string;
  paymentMethod: number;
  totalAmount: number;
  finalAmount: number;
  placedOn: string;
  orderItems: IOrderItem[];
  orderHistories: IOrderHistory[];
  deliveryMethodID: number;
  deliveryMethod: IDeliveryMethod;
  paymentIntentID: string;
}

export interface IOrderItem {
  id: number;
  orderID: number;
  productID: number;
  product: IProduct;
  productName: string;
  itemPrice: number;
  quantity: number;
}

export interface IOrderHistory {
  id: number;
  orderID: number;
  orderStatus: number;
  note: string;
}

export interface IOrderDetails {
  id: number;
  customerID: number;
  customerName: string;
  customerEmail: string;
  customerPhone: string;
  customerCountry: string;
  customerCity: string;
  customerAddress: string;
  customerZipCode: string;
  paymentMethod: string;
  totalAmount: number;
  finalAmount: number;
  placedOn: string;
  orderItems: IOrderItemDetails[];
  orderHistory: IOrderHistoryDetails;
  deliveryMethod: string;
  shippingPrice: number;
}

export interface IOrderItemDetails {
  productID: number;
  productName: string;
  pictureUrl: string;
  price: number;
  quantity: number;
}

export interface IOrderHistoryDetails {
  orderID: number;
  orderStatus: number;
  note: string;
  modifiedOn: string;
}

export let OrderStatus = [
  { value: 1, status: 'Placed', bgClass: 'bg-primary text-white'},
  { value: 2, status: 'Processing', bgClass: 'bg-info text-white' },
  { value: 3, status: 'Delivered', bgClass: 'bg-success text-white' },
  { value: 4, status: 'Failed', bgClass: 'bg-danger text-white' },
  { value: 5, status: 'Cancelled', bgClass: 'bg-danger text-white' },
  { value: 6, status: 'On Hold', bgClass: 'bg-warning' },
  { value: 7, status: 'Waiting For Payment', bgClass: 'bg-info text-white' },
  { value: 8, status: 'Refunded', bgClass: 'bg-warning'}
];

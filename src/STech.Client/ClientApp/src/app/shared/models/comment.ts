import { IProduct } from "./product"

export interface IComment {
  commentID: number,
  username: string,
  fullName: string,
  entityID: number,
  productName: string,
  timestamp: string,
  rating: number,
  text: string
}

export interface ICommentWithProduct {
  id: number,
  userID: string,
  username: string,
  fullName: string,
  entityID: number,
  product: IProduct,
  timestamp: string,
  rating: number,
  text: string
}

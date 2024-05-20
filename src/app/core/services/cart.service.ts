import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { ProductoResponse } from '../models/response/producto';

@Injectable({
  providedIn: 'root',
})
export class CartService {
  private cartProducts: ProductoResponse[] = [];
  private _products: BehaviorSubject<ProductoResponse[]> = new BehaviorSubject<
    ProductoResponse[]
  >([]);
  constructor() {
    this._products = new BehaviorSubject<ProductoResponse[]>([]);
  }

  get products() {
    return this._products.asObservable();
  }

  addNewProduct(product: ProductoResponse) {
    this.cartProducts.push(product);
    console.log(product);
    this._products.next(this.cartProducts);
  }

  deleteProduct(index: number) {
    this.cartProducts.splice(index, 1);
    this._products.next(this.cartProducts);
  }
}

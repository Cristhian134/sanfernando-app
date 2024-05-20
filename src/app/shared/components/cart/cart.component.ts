import { Component } from '@angular/core';
import { ProductoResponse } from '../../../core/models/response/producto';
import { CartService } from '../../../core/services/cart.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-cart',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './cart.component.html',
  styleUrl: './cart.component.scss'
})
export class CartComponent {
  products: ProductoResponse[] = [];

  constructor(private cartService: CartService) { }

  ngOnInit() {
    this.cartService.products.subscribe(products => {
      this.products = products;
    });
  }
  onClickDelete(index: number) {
    console.log(index)
    this.cartService.deleteProduct(index);
  }
}

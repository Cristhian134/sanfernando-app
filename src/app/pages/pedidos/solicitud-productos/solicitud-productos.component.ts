import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ButtonModule } from 'primeng/button';
import { DataViewModule } from 'primeng/dataview';
import { TagModule } from 'primeng/tag';
import { RatingModule } from 'primeng/rating';
import { SkeletonModule } from 'primeng/skeleton';
import { PedidosService } from '../../../core/services/pedidos.service';
import { ProductoResponse } from '../../../core/models/response/producto';
import { CommonModule } from '@angular/common';
import { CartComponent } from '../../../shared/components/cart/cart.component';
import { CartService } from '../../../core/services/cart.service';

@Component({
  selector: 'app-solicitud-productos',
  standalone: true,
  imports: [
    CartComponent,
    CommonModule,
    ButtonModule,
    RatingModule,
    TagModule,
    DataViewModule,
    SkeletonModule
  ],
  templateUrl: './solicitud-productos.component.html',
  styleUrl: './solicitud-productos.component.scss'
})
export class SolicitudProductosComponent implements OnInit {

  layout: string = 'list';

  products: ProductoResponse[] = [];

  constructor(
    private pedidoService: PedidosService,
    private router: Router,
    private cartService: CartService
  ) { }

  ngOnInit(): void {
    this.pedidoService.getProductos()
      .subscribe((response) => {
        this.products = response
      });
  }

  complete() {
    return null;
  }
  prevPage() {
    this.router.navigate(['pages/pedidos/proceso/datos-envio']);
  }

  onClickAdd(product: ProductoResponse) {
    this.cartService.addNewProduct(product);
  }

  getSeverity(product: ProductoResponse) {
    return null
  };
}

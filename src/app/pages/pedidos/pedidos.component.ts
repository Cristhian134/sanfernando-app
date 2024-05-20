import { Component } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { CartComponent } from '../../shared/components/cart/cart.component';
import { ProductoResponse } from '../../core/models/response/producto';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-pedidos',
  standalone: true,
  imports: [RouterModule, CommonModule],
  templateUrl: './pedidos.component.html',
  styleUrl: './pedidos.component.scss'
})
export class PedidosComponent {

  constructor(
    private router: Router,
    private cartService: CartComponent
  ) { }

  nextPage() {
    this.router.navigate(['pages/pedidos/proceso/solicitud-productos']);
  }

}

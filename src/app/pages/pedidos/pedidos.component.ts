import { Component } from '@angular/core';
import { Router, RouterModule } from '@angular/router';

@Component({
  selector: 'app-pedidos',
  standalone: true,
  imports: [RouterModule],
  templateUrl: './pedidos.component.html',
  styleUrl: './pedidos.component.scss'
})
export class PedidosComponent {

  constructor(private router: Router) { }

  nextPage() {
    this.router.navigate(['pages/pedidos/proceso/solicitud-productos']);
  }
}

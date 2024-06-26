import { Component, Inject } from '@angular/core';
import { Router } from '@angular/router';
import { ButtonModule } from 'primeng/button';

@Component({
  selector: 'app-seguimiento-home',
  standalone: true,
  imports: [
    ButtonModule
  ],
  templateUrl: './seguimiento-home.component.html',
  styleUrl: './seguimiento-home.component.scss'
})
export class SeguimientoHomeComponent {

  constructor(
    // private pedidoService: PedidosService,
    private router: Router
  ) { }

  irTrasladosProceso(): void {
    this.router.navigate([`pages/seguimiento/traslados/proceso`]);
  }
}

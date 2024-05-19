import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ButtonModule } from 'primeng/button';

@Component({
  selector: 'app-datos-envio',
  standalone: true,
  imports: [ButtonModule],
  templateUrl: './datos-envio.component.html',
  styleUrl: './datos-envio.component.scss'
})
export class DatosEnvioComponent {

  constructor(private router: Router) { }

  nextPage() {
    this.router.navigate(['pages/pedidos/proceso/solicitud-productos']);
  }
}

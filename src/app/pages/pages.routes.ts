import { Routes } from "@angular/router";
import { HomeComponent } from "./home/home.component";
import { AlmacenComponent } from "./almacen/almacen.component";
import { ReportesComponent } from "./reportes/reportes.component";
import { authGuard } from "../core/guards/auth.guard";
import { ControlComponent } from "./control/control.component";
import { PedidosComponent } from "./pedidos/pedidos.component";
import { ReclamosComponent } from "./reclamos/reclamos.component";
import { SeguimientoComponent } from "./seguimiento/seguimiento.component";
import { DatosEnvioComponent } from "./pedidos/datos-envio/datos-envio.component";
import { SolicitudProductosComponent } from "./pedidos/solicitud-productos/solicitud-productos.component";
import { DetallePedidoComponent } from "./pedidos/detalle-pedido/detalle-pedido.component";
import { PedidosHomeComponent } from "./pedidos/pedidos-home/pedidos-home.component";
import { ProcesoPedidoComponent } from "./pedidos/proceso-pedido/proceso-pedido.component";

export const PAGES_ROUTES: Routes = [
  { path: 'home', component: HomeComponent, canActivate: [authGuard] },
  { path: 'almacen', component: AlmacenComponent, canActivate: [authGuard] },
  // Format this how down
  {
    path: 'control',
    component: ControlComponent,
    canActivate: [authGuard]
  },
  {
    path: 'pedidos',
    children: [
      {
        path: 'proceso',
        component: ProcesoPedidoComponent,
        children: [
          { path: 'datos-envio', component: DatosEnvioComponent },
          { path: 'solicitud-productos', component: SolicitudProductosComponent },
        ]
      },
      {
        path: 'detalle/:idPedido',
        component: DetallePedidoComponent,
      },
      { path: '', component: PedidosHomeComponent }
    ],
    canActivate: [authGuard]
  },
  { path: 'reclamos', component: ReclamosComponent, canActivate: [authGuard] },
  { path: 'reportes', component: ReportesComponent, canActivate: [authGuard] },
  { path: 'seguimiento', component: SeguimientoComponent, canActivate: [authGuard] },
];
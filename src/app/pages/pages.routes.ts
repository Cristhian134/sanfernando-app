import { Routes } from "@angular/router";
import { HomeComponent } from "./home/home.component";
import { AlmacenComponent } from "./almacen/almacen.component";
import { ReportesComponent } from "./reportes/reportes.component";
import { authGuard } from "../core/guards/auth.guard";
import { ControlComponent } from "./control/control.component";
import { PedidosComponent } from "./pedidos/pedidos.component";
import { ReclamosComponent } from "./reclamos/reclamos.component";
import { SeguimientoComponent } from "./seguimiento/seguimiento.component";

export const PAGES_ROUTES: Routes = [
  { path: 'home', component: HomeComponent, canActivate: [authGuard] },
  { path: 'almacen', component: AlmacenComponent, canActivate: [authGuard] },
  { path: 'control', component: ControlComponent, canActivate: [authGuard] },
  { path: 'pedidos', component: PedidosComponent, canActivate: [authGuard] },
  { path: 'reclamos', component: ReclamosComponent, canActivate: [authGuard] },
  { path: 'reportes', component: ReportesComponent, canActivate: [authGuard] },
  { path: 'seguimiento', component: SeguimientoComponent, canActivate: [authGuard] },
];
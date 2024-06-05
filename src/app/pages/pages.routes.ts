import { Routes } from "@angular/router";
import { HomeComponent } from "./home/home.component";
import { AlmacenComponent } from "./almacen/almacen.component";
import { ReportesComponent } from "./reportes/reportes.component";
import { authGuard } from "../core/guards/auth.guard";
import { ControlComponent } from "./control/control.component";
import { ReclamosComponent } from "./reclamos/reclamos.component";
import { SeguimientoComponent } from "./seguimiento/seguimiento.component";
import { VistaProcesosComponent } from "./almacen/vista-procesos/vista-procesos.component";
import { RegistroOperacionComponent } from "./almacen/registro-operacion/registro-operacion.component";

export const PAGES_ROUTES: Routes = [
  {
    path: 'home',
    component: HomeComponent,
    canActivate: []
  },
  {
    path: 'almacen',
    component: AlmacenComponent,
    canActivate: [authGuard],
    children: [
      { path: '', component: VistaProcesosComponent },
      { path: 'vista-procesos', component: VistaProcesosComponent },
      { path: 'registro-operacion', component: RegistroOperacionComponent }
    ]
  },
  {
    path: 'control',
    component: ControlComponent,
    canActivate: [authGuard]
  },
  {
    path: '',
    loadChildren: () => import('./pedidos/pedidos.routes').then(m => m.PEDIDOS_ROUTES),
  },
  {
    path: '',
    loadChildren: () => import('./reportes/reportes.routes').then(m => m.REPORTES_ROUTES),
  },
  { path: 'reclamos', component: ReclamosComponent, canActivate: [authGuard] },
  { path: 'seguimiento', component: SeguimientoComponent, canActivate: [authGuard] },
];
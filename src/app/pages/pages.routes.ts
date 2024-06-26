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
import { TransportistaComponent } from "./control/transportista/transportista.component";
import { VehiculoComponent } from "./control/vehiculo/vehiculo.component";
import { IncidenciasComponent } from "./control/incidencias/incidencias.component";
import { RegistroIncidenciaComponent } from "./control/registro-incidencia/registro-incidencia.component";

export const PAGES_ROUTES: Routes = [
  {
    path: 'home',
    component: HomeComponent,
    canActivate: []
  },
  {
    path: '',
    loadChildren: () => import('./almacen/almacen.routes').then(m => m.ALMACEN_ROUTES),
  },
  {
    path: '',
    loadChildren: () => import('./control/control.routes').then(m => m.CONTROL_ROUTES),
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
  {
    path: '',
    loadChildren: () => import('./seguimiento/seguimiento.routes').then(m => m.SEGUIMIENTO_ROUTES),
  },
];
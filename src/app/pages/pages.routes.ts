import { Routes } from "@angular/router";
import { HomeComponent } from "./home/home.component";
import { AlmacenComponent } from "./almacen/almacen.component";
import { ReportesComponent } from "./reportes/reportes.component";
import { authGuard } from "../core/guards/auth.guard";

export const PAGES_ROUTES: Routes = [
  { path: 'home', component: HomeComponent, canActivate: [authGuard] },
  { path: 'almacen', component: AlmacenComponent, canActivate: [authGuard] },
  { path: 'reportes', component: ReportesComponent, canActivate: [authGuard] },
];
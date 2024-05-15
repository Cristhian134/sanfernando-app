import { Routes } from "@angular/router";
import { HomeComponent } from "./home/home.component";
import { AlmacenComponent } from "./almacen/almacen.component";
import { ReportesComponent } from "./reportes/reportes.component";

export const PAGES_ROUTES: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'almacen', component: AlmacenComponent },
  { path: 'reportes', component: ReportesComponent },
];
import { Routes } from "@angular/router";
import { authGuard } from "../../core/guards/auth.guard";
import { SeguimientoHomeComponent } from "./seguimiento-home/seguimiento-home.component";
import { TrasladosProcesoComponent } from "./traslados/traslados-proceso/traslados-proceso.component";

export const SEGUIMIENTO_ROUTES: Routes = [
  {
    path: 'seguimiento',
    children: [
      {
        path: 'traslados',
        children: [
          {
            path: 'proceso',
            component: TrasladosProcesoComponent
          },
        ]
      },
      {
        path: '',
        component: SeguimientoHomeComponent
      },
    ],
    canActivate: [authGuard]
  },
];
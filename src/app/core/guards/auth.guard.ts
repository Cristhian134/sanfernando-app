import { Injectable, inject } from '@angular/core';
import {
  CanActivate,
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
  Router,
  CanActivateFn,
} from '@angular/router';
import { AuthService } from '../services/auth.service';

export const authGuard: CanActivateFn = (
  route: ActivatedRouteSnapshot,
  state: RouterStateSnapshot
) => {
  if (inject(AuthService).isLogged()) {
    console.log(inject(AuthService).isLogged())
    console.log(Router.prototype.url.toString())
    return true;
  } else {
    inject(Router).navigate(['/login']);
    console.log(sessionStorage.getItem("dni"))
    return false;
  }
};

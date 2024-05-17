import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const loginGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const router = inject(Router);
  if (!authService.isLogged()) {
    return true;
  } else {
    router.navigate(['pages/home']);
    return false;
  }

  // if (authService.isLogged() == false) {
  //   router.navigate(['/login']);
  //   return false;
  // }
  // return true;
};
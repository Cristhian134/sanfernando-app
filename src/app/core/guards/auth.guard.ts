import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const authGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const router = inject(Router);
  if (authService.isLogged()) {
    if (route.url.length > 0) {
      let menu = route.url[0].path;
      console.log(route.url.toString())
      if (menu == "almacen") {
        if (authService.getUserRole() == 'Almacen') {
          return true;
        } else {
          router.navigate(['pages/home']);
          console.log('No tienes acceso')
          return false;
        }
      } else {

        return true;
      }
    } else {
      return true
    }
  } else {
    router.navigate(['login']);
    return false;
  }

  // if (authService.isLogged() == false) {
  //   router.navigate(['/login']);
  //   return false;
  // }
  // return true;
};
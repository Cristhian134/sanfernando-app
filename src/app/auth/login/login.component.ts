import { Component } from '@angular/core';
import { FormBuilder, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { AuthService } from '../../core/services/auth.service';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { LoginResponse } from '../../core/models/response/login-response';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, CommonModule, ReactiveFormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})

export class LoginComponent {
  constructor(
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private router: Router,
  ) { }

  loginForm = this.formBuilder.group({
    username: this.formBuilder.control('', Validators.required),
    password: this.formBuilder.control('', Validators.required),
  })

  private userData?: LoginResponse;

  proceedLogin() {
    if (this.loginForm.valid) {
      this.authService.login(this.loginForm.value.username as String, this.loginForm.value.password as String).subscribe(res => {
        this.userData = res;
        if (this.userData.representante || !this.userData.representante) {
          console.log(this.userData)
          sessionStorage.setItem('dni', this.userData.dni);
          sessionStorage.setItem('area', this.userData.area);
          this.router.navigate(['pages/home'])
          console.log(sessionStorage?.getItem("dni"))
          console.log("Redireccionando...")
        } else {
          console.log("El usuario no esta activo")
        }

        // if (this.userData.password === this.loginForm.value.password) {
        //   if (this.userData.isActive) {
        //     sessionStorage.setItem('username', this.userData.username);
        //     sessionStorage.setItem('userrole', this.userData.role);
        //     this.router.navigate(['/'])
        //   } else {
        //     console.log("El usuario no esta activo")
        //   }
        // }
      })
    } else {
      sessionStorage.clear()
      console.log(sessionStorage.getItem("dni") == undefined)
      console.log("Error en la contraseña/username")
    }
  }
}

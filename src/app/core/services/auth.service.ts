// import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { LoginResponse } from "../models/response/login-response";

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }
  private apiurl = 'http://localhost:8080/api/auth/login';

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json;charset=utf-8'
    })
  };

  login(username: String, password: String) {
    return this.http.post<LoginResponse>(`${this.apiurl}`, { dni: username }, this.httpOptions);
  }

  isLogged(): boolean {
    return sessionStorage?.getItem("dni") != undefined;
  }

  getUserRole() {
    return sessionStorage?.getItem("area")?.toString();
  }

}
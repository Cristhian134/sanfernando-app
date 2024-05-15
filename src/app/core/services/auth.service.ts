// import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }
  apiurl = 'http://localhost:8080/api/auth/login';
  httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json;charset=utf-8' }) };
  login(username: String, password: String) {
    console.log({ dni: username, password })
    return this.http.post<any>(`${this.apiurl}`, { dni: username, password }, this.httpOptions);
  }

  isLogged(): boolean {
    return sessionStorage.getItem("dni") != undefined;
  }

  getUserRole() {
    return sessionStorage.getItem("userrole")?.toString();
  }
}
import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { LoginResponse } from "../models/response/login-response";
import { ProductoResponse } from "../models/response/producto";

@Injectable({
  providedIn: 'root'
})
export class PedidosService {

  constructor(private http: HttpClient) { }
  private apiurl = 'http://localhost:8080/api/pedido';

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json;charset=utf-8'
    })
  };

  getProductos() {
    return this.http.get<ProductoResponse[]>(`${this.apiurl}/productos`, this.httpOptions);
  }
}
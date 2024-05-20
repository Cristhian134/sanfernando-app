import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { LoginResponse } from "../models/response/login-response";
import { ProductoResponse } from "../models/response/producto";
import { PedidoListaResponse } from "../models/response/pedido-lista";
import { PedidoFormRequest } from "../models/request/pedido-form-request";
import { PedidoFormResponse } from "../models/response/pedido-form-response";

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

  getPedidos() {
    return this.http.get<PedidoListaResponse[]>(`${this.apiurl}/all`, this.httpOptions);
  }

  postDatosEnvio(pedidoFormRequest: PedidoFormRequest) {
    return this.http.post<PedidoFormResponse>(`${this.apiurl}/datos`, pedidoFormRequest, this.httpOptions);
  }
}
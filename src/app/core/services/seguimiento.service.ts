import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { API_URL } from '../../shared/constants/urls.constant';
import { SeguimientoTrasladoDetalleResponse, SeguimientoTrasladoListaResponse, SeguimientoTrasladoPedidoListaResponse } from '../models/response/seguimiento-responses';

@Injectable({
  providedIn: 'root',
})
export class SeguimientoService {

  constructor(private http: HttpClient) { }
  private apiurl = API_URL.SEGUIMIENTO;

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json;charset=utf-8'
    })
  };

  obtenerTrasladosProceso() {
    return this.http.get<SeguimientoTrasladoListaResponse[]>(`${this.apiurl}/trasladosProceso`, this.httpOptions);
  }

  obtenerTrasladoProcesoDetalle(guiaDeRemision: String) {
    console.log(`${this.apiurl}/trasladoProcesoDetalle?codGuiaRemision=${guiaDeRemision}`);
    return this.http.get<SeguimientoTrasladoDetalleResponse>(`${this.apiurl}/trasladoProcesoDetalle?codGuiaRemision=${guiaDeRemision}`, this.httpOptions);
  }

  obtenerTrasladosProcesoPedidos(guiaDeRemision: String) {
    return this.http.get<SeguimientoTrasladoPedidoListaResponse[]>(`${this.apiurl}/trasladoProcesoPedidos?codGuiaRemision=${guiaDeRemision}`, this.httpOptions);
  }

  actualizarTrasladoProcesoPedido(idPedido: number) {
    return this.http.put<any>(`${this.apiurl}/actualizarTrasladoProcesoPedido?idPedido=${idPedido}`, this.httpOptions);
  }
}
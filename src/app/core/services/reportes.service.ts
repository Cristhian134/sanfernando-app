// import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { LoginResponse } from "../models/response/login-response";
import { API_URL } from "../../shared/constants/urls.constant";
import { ReporteOperacionResponse } from "../models/response/reporte-responses";

@Injectable({
  providedIn: 'root'
})
export class ReportesService {

  constructor(private http: HttpClient) { }
  private apiurl = API_URL.REPORTES;

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json;charset=utf-8'
    })
  };

  getReporteOperacion() {
    return this.http.get<ReporteOperacionResponse[]>(`${this.apiurl}/operacion`, this.httpOptions);
  }
}
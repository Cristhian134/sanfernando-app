import { Time } from "@angular/common";

export interface ReporteOperacionResponse {
  idOperacionTipo: number;
  nombreOperacion: string;
  tiempoTotal: Time;
  cantidad: number;
  tiempoMedio: number;
  listaOperacion: string;
  listaOperacionSplit: number[];
}
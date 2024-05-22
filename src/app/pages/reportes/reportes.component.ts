import { Component, OnInit } from '@angular/core';
import { ReportesService } from '../../core/services/reportes.service';
import { Router } from '@angular/router';
import { ReporteOperacionResponse } from '../../core/models/response/reporte-responses';
import { chartHorBar, getDataSetHorBar } from '../../shared/utils/chartUtil';
import { ChartModule } from 'primeng/chart';

@Component({
  selector: 'app-reportes',
  standalone: true,
  imports: [
    ChartModule
  ],
  templateUrl: './reportes.component.html',
  styleUrl: './reportes.component.scss'
})
export class ReportesComponent implements OnInit {

  reporteOperacion!: ReporteOperacionResponse[];
  data: any;
  options: any;

  constructor(
    private router: Router,
    private reportesService: ReportesService
  ) { }

  ngOnInit(): void {
    this.reportesService.getReporteOperacion().subscribe((response) => {
      this.reporteOperacion = response;
      this.data = this.getChartReporte().data;
      this.options = this.getChartReporte().options;
    })
  }

  getChartReporte(): chartHorBar {
    return getDataSetHorBar(
      this.reporteOperacion,
      "nombreOperacion",
      "tiempoMedio",
      "Tiempo medio de operaciones (en horas)",
      "green",
      "green"
    )
  }

}

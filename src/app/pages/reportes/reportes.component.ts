import { Component, OnInit } from '@angular/core';
import { ReportesService } from '../../core/services/reportes.service';
import { Router } from '@angular/router';
import { ReporteAlmacenStockResponse, ReporteFormatoResponse, ReporteFrecuenciaResponse, ReporteLookUpTablesResponse, ReporteOperacionResponse, ReporteReclamoTiempoResponse, ReporteTipoResponse } from '../../core/models/response/reporte-responses';
import { chartHorBar, getArrayDataUrgenciaTipo, getDataSetHorBar, getEChartUrgenciaTipo, getEchart } from '../../shared/utils/chartUtil';
import { ChartModule } from 'primeng/chart';
import { CardModule } from 'primeng/card';
import { DividerModule } from 'primeng/divider';
import { DialogModule } from 'primeng/dialog';
import { ButtonModule } from 'primeng/button';
import { PanelModule } from 'primeng/panel';
import { DropdownModule } from 'primeng/dropdown';
import { FormBuilder, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { CalendarModule } from 'primeng/calendar';
import { FloatLabelModule } from 'primeng/floatlabel';
import { TableModule } from 'primeng/table';

import * as echarts from 'echarts';
import { formatDate } from '../../shared/utils/dateUtil';
import { ReporteGenerarRequest, ReporteProgramacionRequest } from '../../core/models/request/reporte-requests';
import { CommonModule } from '@angular/common';
import { InputTextModule } from 'primeng/inputtext';

interface ReporteGenerarForm {
  idReporteTipo: number;
  fechaInicio: string;
  fechaFin: string;
  fomarto: string;
}

@Component({
  selector: 'app-reportes',
  standalone: true,
  imports: [
    ChartModule,
    CardModule,
    DividerModule,
    DialogModule,
    ButtonModule,
    PanelModule,
    DropdownModule,
    ReactiveFormsModule,
    FormsModule,
    FloatLabelModule,
    CalendarModule,
    TableModule,
    InputTextModule,
    CommonModule
  ],
  templateUrl: './reportes.component.html',
  styleUrl: './reportes.component.scss'
})
export class ReportesComponent implements OnInit {

  visibleReporteGenerar: boolean = false;
  visibleReporteProgramacion: boolean = false;
  showDialogReporteGenerar(visible: boolean = true) {
    this.visibleReporteGenerar = visible;
  }
  showDialogReporteProgramacion(visible: boolean = true) {
    this.visibleReporteProgramacion = visible;
  }

  reporteTipo?: ReporteTipoResponse[] = [];
  reporteFrecuencia?: ReporteFrecuenciaResponse[] = [];
  reporteFormato?: ReporteFormatoResponse[] = [];

  reporteGenerarForm = this.formBuilder.group({
    reporteFormatoModel: this.formBuilder.control<ReporteFormatoResponse | null>(null, Validators.required),
    reporteTipoModel: this.formBuilder.control<ReporteTipoResponse | null>(null, Validators.required),
    fechaInicio: this.formBuilder.control<Date | null>(null, Validators.required),
    fechaFin: this.formBuilder.control<Date | null>(null, Validators.required),
  })
  sendDatosReporteGenerar() {
    if (this.reporteGenerarForm.valid) {
      const formValue = this.reporteGenerarForm.value;
      const fechaInicio = formatDate(formValue.fechaInicio as Date);
      const fechaFin = formatDate(formValue.fechaFin as Date);
      const reporteGenerarRequest: ReporteGenerarRequest = {
        idRepresentante: Number(sessionStorage?.getItem("idEmpleado")),
        idReporteFormato: formValue.reporteFormatoModel?.idReporteFormato,
        idReporteTipo: formValue.reporteTipoModel?.idReporteTipo,
        fechaInicio: fechaInicio,
        fechaFin: fechaFin,
      }
      console.log(reporteGenerarRequest)
    } else {
      console.log("Llene todos los campos")
    }
  }
  reporteProgramacionForm = this.formBuilder.group({
    reporteFrecuenciaModel: this.formBuilder.control<ReporteFrecuenciaResponse | null>(null, Validators.required),
    reporteFormatoModel: this.formBuilder.control<ReporteFormatoResponse | null>(null, Validators.required),
    reporteTipoModel: this.formBuilder.control<ReporteTipoResponse | null>(null, Validators.required),
    fechaInicio: this.formBuilder.control<Date | null>(null, Validators.required),
    fechaFin: this.formBuilder.control<Date | null>(null, Validators.required),
  })
  sendDatosReporteProgramacion() {
    if (this.reporteProgramacionForm.valid) {
      const formValue = this.reporteProgramacionForm.value;
      const fechaInicio = formatDate(formValue.fechaInicio as Date);
      const fechaFin = formatDate(formValue.fechaFin as Date);
      const reporteProgramacionRequest: ReporteProgramacionRequest = {
        idRepresentante: Number(sessionStorage?.getItem("idEmpleado")),
        idReporteFormato: formValue.reporteFormatoModel?.idReporteFormato,
        idReporteFrecuencia: formValue.reporteFrecuenciaModel?.idReporteFrecuencia,
        idReporteTipo: formValue.reporteTipoModel?.idReporteTipo,
        fechaInicio: fechaInicio,
        fechaFin: fechaFin,
      }
      this.reportesService.postDatosReporteProgramacion(reporteProgramacionRequest).subscribe((response) => {
        console.log(response);
      })
      console.log(reporteProgramacionRequest)
    }
  }

  dataStockAlmacenView: boolean = false;
  products: ReporteAlmacenStockResponse[] = [];
  product!: ReporteAlmacenStockResponse;
  size = { name: 'Small', class: 'p-datatable-sm' };

  constructor(
    private router: Router,
    private reportesService: ReportesService,
    private formBuilder: FormBuilder,
  ) { }

  dataTiempoReclamoView: boolean = false;
  dataTiempoReclamo: ReporteReclamoTiempoResponse[] = [];

  ngOnInit(): void {

    this.reportesService.getLookUpTables().subscribe((response) => {
      this.reporteTipo = response.reporteTipoResponse;
      this.reporteFrecuencia = response.reporteFrecuenciaResponse;
      this.reporteFormato = response.reporteFormatoResponse;
    })

    this.reportesService.getReporteAlmacenStock().subscribe((response) => {
      this.products = response;
      this.dataStockAlmacenView = true;
    })

    this.reportesService.getReportePedidoMes().subscribe((response) => {
      this.generateChart(
        "pedidoMes",
        getEchart(response, "totalPedidos", "mes", "Pedidos por mes", "Pedidos por mes", "line", "vertical")
      )
    })
    this.reportesService.getReportePedidoTop().subscribe((response) => {

    })

    this.reportesService.getReporteReclamoUrgencia().subscribe((response) => {
      getArrayDataUrgenciaTipo(response, ["totalUrgenciaBaja", "totalUrgenciaAlta", "totalUrgenciaAlta"], "idTipoReclamo");
      this.generateChart(
        "reclamoUrgenciaTipo",
        getEChartUrgenciaTipo(response, ["totalUrgenciaBaja", "totalUrgenciaMedia", "totalUrgenciaAlta"], "idTipoReclamo", "Reclamos por mes", "Reclamos por mes")
      )
    })
    this.reportesService.getReporteReclamoTiempo().subscribe((response) => {
      response.forEach((item) => {
        this.dataTiempoReclamo.push(item)
      })
      this.dataTiempoReclamoView = true;
    })
    this.reportesService.getReporteReclamoMes().subscribe((response) => {
      // console.log(getArrayData(response, "totalReclamos", "mes"));
      this.generateChart(
        "reclamoMesTipo",
        getEchart(response, "totalReclamos", "mes", "Reclamos por mes", "Reclamos por mes", "line", "vertical")
      )
    })

    this.reportesService.getReporteOperacion().subscribe((response) => {
      this.generateChart(
        "almacenOperacionReporte",
        getEchart(response, "tiempoMedio", "nombreOperacion", "Tiempo medio por tipo de operación", "Tiempo medio por tipo de operación", "bar", "horizontal")
      )
    })
  }

  generateChart(idChart: string, option: any) {
    var chartDom = document.getElementById(idChart);
    var myChart = echarts.init(chartDom);
    option && myChart.setOption(option);
  }

  // getReporteUrgenciaChart() {
  //   var chartDom = document.getElementById('reclamoUrgenciaTipo');
  //   var myChart = echarts.init(chartDom);
  //   var option;

  //   option = {
  //     title: {
  //       text: 'Stacked Line'
  //     },
  //     tooltip: {
  //       trigger: 'axis'
  //     },
  //     legend: {
  //       data: ['Email', 'Union Ads', 'Video Ads', 'Direct', 'Search Engine']
  //     },
  //     grid: {
  //       left: '3%',
  //       right: '4%',
  //       bottom: '3%',
  //       containLabel: true
  //     },
  //     toolbox: {
  //       feature: {
  //         saveAsImage: {}
  //       }
  //     },
  //     xAxis: {
  //       type: 'category',
  //       boundaryGap: false,
  //       data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  //     },
  //     yAxis: {
  //       type: 'value'
  //     },
  //     series: [
  //       {
  //         name: 'Email',
  //         type: 'line',
  //         stack: 'Total',
  //         data: [120, 132, 101, 134, 90, 230, 210]
  //       },
  //       {
  //         name: 'Union Ads',
  //         type: 'line',
  //         stack: 'Total',
  //         data: [220, 182, 191, 234, 290, 330, 310]
  //       },
  //       {
  //         name: 'Video Ads',
  //         type: 'line',
  //         stack: 'Total',
  //         data: [150, 232, 201, 154, 190, 330, 410]
  //       },
  //       {
  //         name: 'Direct',
  //         type: 'line',
  //         stack: 'Total',
  //         data: [320, 332, 301, 334, 390, 330, 320]
  //       },
  //       {
  //         name: 'Search Engine',
  //         type: 'line',
  //         stack: 'Total',
  //         data: [820, 932, 901, 934, 1290, 1330, 1320]
  //       }
  //     ]
  //   };

  //   option && myChart.setOption(option);
  // }

}

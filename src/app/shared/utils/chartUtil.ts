import { ReporteOperacionResponse } from "../../core/models/response/reporte-responses";

interface datasetHorBar {
  label?: string;
  backgroundColor?: any;
  borderColor?: any;
  data?: [];
}

export interface chartHorBar {
  data: any;
  options: any;
}

export function getDataSetHorBar(responses: any, label: string, data: string, title: string, colorBar: string, colorBor: string) {
  const documentStyle = getComputedStyle(document.documentElement);
  const textColor = documentStyle.getPropertyValue('--text-color');
  const textColorSecondary = documentStyle.getPropertyValue('--text-color-secondary');
  const surfaceBorder = documentStyle.getPropertyValue('--surface-border');

  let datasets = []
  datasets.push({
    label: title,
    backgroundColor: documentStyle.getPropertyValue(`--${colorBar}-500`),
    borderColor: documentStyle.getPropertyValue(`--${colorBor}-500`),
    data: responses?.map((response: any) => {
      return (response as any)[data];
    })
  } as datasetHorBar)

  let labels = responses?.map((response: any) => {
    return (response as any)[label]
  })

  let options = {
    indexAxis: 'y',
    maintainAspectRatio: false,
    aspectRatio: 1.3,
    plugins: {
      legend: {
        labels: {
          color: textColor
        }
      }
    },
    scales: {
      x: {
        ticks: {
          color: textColorSecondary,
          font: {
            weight: 500
          }
        },
        grid: {
          color: surfaceBorder,
          drawBorder: false
        }
      },
      y: {
        ticks: {
          color: textColorSecondary
        },
        grid: {
          color: surfaceBorder,
          drawBorder: false
        }
      }
    }
  };

  const dataRes: chartHorBar = {
    data: {
      labels,
      datasets
    },
    options
  }
  console.log(dataRes);
  return dataRes;
}


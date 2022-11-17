/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var ctx = document.getElementById("myChart").getContext("2d");
    var myChart = new Chart(ctx, {
      type: "line",
      data: {
        labels: [
          "Enero",
          "Febrero",
          "Marzo",
          "Abril",
          "Mayo",
          "Junio",
          "Julio",
          "Agosto",
          "Septiembre",
          "Octubre",
          "Noviembre",
          "Diciembre",
        ],
        datasets: [
          {
            label: "Ventas al mes",
            data: [1],
            backgroundColor: "rgb(35, 62, 129)",
          },
          {
            label: "dinero ganado",
            data: [1,1],
            backgroundColor: "rgb(57, 54, 54)",
          },
        ],
      },
    });

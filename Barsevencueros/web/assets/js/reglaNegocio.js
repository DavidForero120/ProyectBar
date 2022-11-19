/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const generarVenta = document.getElementById('venta');
let  valorA=0.0;
let totalA= 0.0;
generarVenta.addEventListener('click', () => {
    let total = document.getElementById('total_').value;
    console.log(`VALOR TOTAL  ${total}`)
    const metodoPago = document.getElementById('metod_').value;

    if (metodoPago == 2) {
       
        valorA = total * 0.05;
        totalA = (total + valorA);
        total.innerHTML = `${totalA}`;
    }
});


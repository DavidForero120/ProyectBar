/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*VER TRABAJADOR   */
const verT = document.getElementById('v_t');
const modal1 = document.getElementById('ver_t');
verT.addEventListener('click', ()=>{
      modal1.classList.toggle('trabajador');
      modal2.classList.replace('trabajadorR','reg_t');
      modal3.classList.replace('mesaV','ver_m');
      modal4.classList.replace('mesaR', 'reg_m');
      modal5.classList.replace('productoV','ver_p');
      modal6.classList.replace('productoR','reg_p');
      modal7.classList.replace('reportV','report');
});
/*REGISTRAR TRABAJADOR*/
const regisT = document.getElementById('r_t');
const modal2 = document.getElementById('reg_t')
regisT.addEventListener('click',()=>{
      modal2.classList.toggle('trabajadorR');
      modal1.classList.replace('trabajador','ver_t');
      modal3.classList.replace('mesaV','ver_m');
      modal4.classList.replace('mesaR', 'reg_m');
      modal5.classList.replace('productoV','ver_p');
      modal6.classList.replace('productoR','reg_p');
      modal7.classList.replace('reportV','report');
});
/*VER MESAS*/
const verM = document.getElementById('v_m');
const modal3 = document.getElementById('ver_m');
verM.addEventListener('click', ()=>{
      modal3.classList.toggle('mesaV');
      modal1.classList.replace('trabajador','ver_t');
      modal2.classList.replace('trabajadorR','reg_t');
      modal4.classList.replace('mesaR', 'reg_m');
      modal5.classList.replace('productoV','ver_p');
      modal6.classList.replace('productoR','reg_p');
      modal7.classList.replace('reportV','report');
});
/*REGISTRAR MESAS*/
const regisM = document.getElementById('r_m');
const modal4 = document.getElementById('reg_m');
regisM.addEventListener('click', ()=>{
      modal4.classList.toggle('mesaR');
      modal1.classList.replace('trabajador','ver_t');
      modal2.classList.replace('trabajadorR','reg_t');
      modal3.classList.replace('mesaV','ver_m');
      modal5.classList.replace('productoV','ver_p');
      modal6.classList.replace('productoR','reg_p');
      modal7.classList.replace('reportV','report');
});
/*VER PRODUCTO*/
const verP = document.getElementById('v_p');
const modal5 = document.getElementById('ver_p');
verP.addEventListener('click',()=>{
      modal5.classList.toggle('productoV');
      modal1.classList.replace('trabajador','ver_t');
      modal2.classList.replace('trabajadorR','reg_t');
      modal3.classList.replace('mesaV','ver_m');
      modal4.classList.replace('mesaR', 'reg_m');
      modal6.classList.replace('productoR','reg_p');
      modal7.classList.replace('reportV','report');
});
/*REGISTRAR PRODUCTO*/
const regisP = document.getElementById('r_p');
const modal6 = document.getElementById('reg_p');
regisP.addEventListener('click',()=>{
      modal6.classList.toggle('productoR');
      modal1.classList.replace('trabajador','ver_t');
      modal2.classList.replace('trabajadorR','reg_t');
      modal3.classList.replace('mesaV','ver_m');
      modal4.classList.replace('mesaR', 'reg_m');
      modal5.classList.replace('productoV','ver_p');
      modal7.classList.replace('reportV','report');
});
/*REPORTE VENTAS*/
const repor = document.getElementById('reporte');
const modal7 = document.getElementById('report');
repor.addEventListener('click',()=>{
      modal7.classList.toggle('reportV');
      modal1.classList.replace('trabajador','ver_t');
      modal2.classList.replace('trabajadorR','reg_t');
      modal3.classList.replace('mesaV','ver_m');
      modal4.classList.replace('mesaR', 'reg_m');
      modal5.classList.replace('productoV','ver_p');
      modal6.classList.replace('productoR','reg_p');
})


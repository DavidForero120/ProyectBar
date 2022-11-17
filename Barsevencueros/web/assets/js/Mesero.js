/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const men = document.getElementById('menu');

men.addEventListener('click', ()=>{
    const option = document.getElementById('options');
    option.classList.toggle('active');
    console.log("click")
})

const abrir = document.getElementById('li3');
const abrir2 = document.getElementById('li4')
const modal = document.getElementById('ver_p')
const modal2 = document.getElementById('reg_p')
const ocultar = document.getElementById('vent')


abrir.addEventListener('click', ()=>{
    modal.classList.replace('ver_p','ver_p_show');
    ocultar.classList.replace('vent_show','vent')
    modal2.classList.replace('reg_p_show','reg_p')
})
abrir2.addEventListener('click' , ()=>{
    modal2.classList.replace('reg_p','reg_p_show')
    modal.classList.replace('ver_p_show','ver_p');
    ocultar.classList.replace('vent_show','vent')
})

ocultar.addEventListener('click' , ()=>{
    ocultar.classList.replace('vent','vent_show')
    modal.classList.replace('ver_p_show','ver_p');
    modal2.classList.replace('reg_p_show','reg_p')
})
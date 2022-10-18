/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
'use strick'
const icono = document.querySelector('.sesion')


const menu = document.querySelector('.contenido')

icono.addEventListener("click", ()=>{
      menu.classList.toggle("active")
})



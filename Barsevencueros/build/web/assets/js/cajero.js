/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const abrir = document.getElementById('vr');
const product = document.getElementById('ve_p');
abrir.addEventListener('click',()=>{
    product.classList.replace('ve_p','ve_p_show');
    product2.classList.replace('ve_me_show','ve_me');
    product3.classList.replace('ve_pe_show','ve_pe');
})

const abrir3 = document.getElementById('vp');
const product3 = document.getElementById('ve_pe');
abrir3.addEventListener('click',()=>{
    product3.classList.replace('ve_pe','ve_pe_show');
    product.classList.replace('ve_p_show','ve_p');
    product2.classList.replace('ve_me_show','ve_me');
})

const abrir2 = document.getElementById('vm');
const product2 = document.getElementById('ve_me');
abrir2.addEventListener('click',()=>{
    product2.classList.replace('ve_me','ve_me_show');
    product.classList.replace('ve_p_show','ve_p');
    product3.classList.replace('ve_pe_show','ve_pe');
})
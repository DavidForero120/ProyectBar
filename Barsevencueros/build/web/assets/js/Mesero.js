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
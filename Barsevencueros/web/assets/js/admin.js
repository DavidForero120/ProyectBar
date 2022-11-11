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
});

/*validacion*/
const formulario = document.getElementById('usuario');
const inputs = document.querySelectorAll('#usuario input');


const Validaciones = {
      documento: /^[0-9]{3,11}$/,
      nombre: /^[A-Za-z\s]{4,40}$/,
      apellido: /^[A-Za-z\s]{5,40}$/,
      correo: /[a-z0-9!#$%&’*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&’*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/,
      contrasena:/^[A-Za-z0-9 .]{5,20}$/,   
      mesa: /^[0-9]{1,30}$/
  }

const validar = (e)=>{
      switch (e.target.name) {
            case "password2":
                        validarP();
                  break;
            case "usuario_nombre":
                  const Nerros = document.getElementById('name_i');
                        if(Validaciones.nombre.test(e.target.value)){
                              Nerros.classList.replace('nameE','name_i');
                        }else{
                              Nerros.classList.replace('name_i','nameE');
                        }   
            break;
            case "usuario_apellido":
                  const apelli = document.getElementById('ape_e')
                  if(Validaciones.apellido.test(e.target.value)){
                        apelli.classList.replace('ape_a','ape_e');
                  }else{
                        apelli.classList.replace('ape_e','ape_a');
                  }  
            break;
            case "usuario_password":
                  const pass1 = document.getElementById('contra')
                  if(Validaciones.contrasena.test(e.target.value)){
                        pass1.classList.replace('conA','contra');
                  }else{
                        pass1.classList.replace('contra','conA');
                  }  
            break;
            case "numero":
                  const mesaN = document.getElementById('mesa_n')
                  if(Validaciones.mesa.test(e.target.value)){
                        mesaN.classList.replace('mesaA','mesa_i');
                  }else{
                        mesaN.classList.replace('mesa_i','mesaA');
                  }       
            break;
      
            default:
                  break;
      }
};
const validarP = ()=>{
      const pass = document.getElementById('password');
      const pass2 = document.getElementById('password2');
      const mensaje = document.getElementById('incorrecta');
      if(pass.value == pass2.value){
          mensaje.classList.replace('act','incorrecta');
      }else{
            mensaje.classList.replace('incorrecta','act');
      }
};
inputs.forEach((input)=>{
      input.addEventListener('keyup', validar);
      input.addEventListener('blur', validar);  
});

/*validacion mesa */
const formulario2 = document.getElementById('mesa');
const inputs2 = document.querySelectorAll('#mesa input');
const validar2 = (e)=>{
      switch (e.target.name) {
            case "numero":
                  const cardm = document.getElementById('card_mesa');
                  const mesaL = document.getElementById('mesa_i');
                  if(Validaciones.mesa.test(e.target.value)) {
                        mesaL.classList.replace('mesaA','mesa_i');
                        cardm.style.width = "22em";
                        cardm.style.height = "18em";
                  }else{
                        mesaL.classList.replace('mesa_i','mesaA');
                        cardm.style.width = "22em";
                        cardm.style.height = "23em";
                  }
            break;
      }
}

inputs2.forEach((input)=>{
      input.addEventListener('keyup', validar2);
      input.addEventListener('blur', validar2);  
});
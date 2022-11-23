/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Acceder al formulario por su id y sus campos

const form = document.getElementById('register');
const campos = document.querySelectorAll('#register input');

//Objetos con expresion regulares para validaciòn
const reglas = {

    numeros: /^[0-9]{5,10}$/,
    nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/,
    correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
}

const inputs = {
    cliente_documento: false,
    cliente_nombre: false,
    cliente_apellido: false,
    cliente_correo: false,
    cliente_nacimiento: false
}

//0. Generar eventos tipo submit sobre el formulario con funcion para validar campos 


//1. GenerR EVENTOS PARA LOS INPUTS

/*const validarcampos=(e)=>{
 console.log("Se genero un evento sobre un input");
 }*/
const validarInput = (regla, input, grupo) => {
    if (regla.test(input.value)) {
        //Si expresion regular se cumple
        //Remover clase error
        document.getElementById(`f_${grupo}`).classList.remove('error');
        //agregar clase success
        document.getElementById(`f_${grupo}`).classList.add('success');

        document.querySelector(`#f_${grupo} .msg_error`).classList.remove('msg_error_visible');

        document.querySelector(`#f_${grupo} i`).classList.add('fa-check-circle')

        document.querySelector(`#f_${grupo} i`).classList.remove('fa-times-circle')
        inputs[grupo] = true;
    } else {

        document.getElementById(`f_${grupo}`).classList.add('error');

        document.querySelector(`#f_${grupo} .msg_error`).classList.add('msg_error_visible');

        document.querySelector(`#f_${grupo} i`).classList.remove('fa-check-circle')

        document.querySelector(`#f_${grupo} i`).classList.add('fa-times-circle')
        inputs[grupo] = false;
    }
}

const validarcampos = (e) => {
    /*console.log(e.target.name);*/ //compruebe para traer el name del input
    switch (e.target.name) {
        case "cliente_documento":
            validarInput(reglas.numeros, e.target, e.target.name)
            break;
        case "cliente_nombre":
            validarInput(reglas.nombre, e.target, e.target.name);
            /*console.log('ESte es el nom')*/
            /*if (reglas.nombre.test(e.target.value)) {
             document.getElementById('f_nom').classList.remove('error');
             
             document.getElementById('f_nom').classList.add('success');
             
             document.querySelector("#f_nom .msg_error").classList.remove('msg_error_visible');
             
             document.querySelector("#f_nom i").classList.add('fa-check-circle')
             
             document.querySelector("#f_nom i").classList.remove('fa-times-circle')
             } else {
             document.getElementById('f_nom').classList.add('error'); 
             
             document.querySelector("#f_nom .msg_error").classList.add('msg_error_visible');
             
             document.querySelector("#f_nom i").classList.remove('fa-check-circle')
             
             document.querySelector("#f_nom i").classList.add('fa-times-circle')
             }*/
            break;
        case "cliente_apellido":
            validarInput(reglas.nombre, e.target, e.target.name);
            break
        case "cliente_correo":
            validarInput(reglas.correo, e.target, e.target.name)
            break
        case "cliente_nacimiento":
            const fnacimi = document.getElementById('cliente_nacimiento').value
            const saveDate = new Date();
            const year = saveDate.getFullYear();
            const naciA = parseInt(String(fnacimi).substring(0, 4));
            const edad = year - naciA;

            console.log(edad)
            if (year > 1930 && edad > 17 && edad < 100) {
                document.getElementById(`f_cliente_nacimiento`).classList.remove('error');
                //agregar clase success
                document.getElementById(`f_cliente_nacimiento`).classList.add('success');

                document.querySelector(`#f_cliente_nacimiento.msg_error`).classList.remove('msg_error_visible');

                document.querySelector(`#f_cliente_nacimiento i`).classList.add('fa-check-circle')

                document.querySelector(`#f_cliente_nacimiento i`).classList.remove('fa-times-circle')
                inputs = true;
            } else {

                document.getElementById(`f_cliente_nacimiento`).classList.add('error');

                document.querySelector(`#f_cliente_nacimiento.msg_error`).classList.add('msg_error_visible');

                document.querySelector(`#f_cliente_nacimiento i`).classList.remove('fa-check-circle')

                document.querySelector(`#f_cliente_nacimiento i`).classList.add('fa-times-circle')
                inputs= false;
            }

            break;
    }
}


campos.forEach((campo) => {
    campo.addEventListener('keyup', validarcampos);
    campo.addEventListener('blur', validarcampos)
})




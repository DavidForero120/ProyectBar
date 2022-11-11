/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*validacion*/
const formulario = document.getElementById('actualizarU');
const inputs = document.querySelectorAll('#actualizarU input');


const Validaciones = {
      nombre: /^[A-Za-z\s]{3,40}$/,
      apellido: /^[A-Za-z\s]{3,40}$/,
      correo: /[a-z0-9!#$%&’*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&’*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/,
      contrasena:/^[A-Za-z0-9 .]{5,20}$/,   
      mesa: /^[0-9]{1,30}$/
};

const comprobar ={
      nombre: false,
      apellido: false,
      correo: false,
      contrasena:false, 
      fecha: false
};

const users = (e)=>{
      switch (e.target.name) {
            case "password2":
                  validarP();
            break;
            case "usuario_nombre":
                  const nerror = document.getElementById('namea');
                  if(Validaciones.nombre.test(e.target.value)){                    
                        nerror.classList.replace('nameC','namea');
                        comprobar['nombre'] = true;
                  }else{
                        nerror.classList.replace('namea','nameC');
                        comprobar['nombre'] = false;
                  }
            break;
            case "usuario_password":
                  const passE = document.getElementById('passd');
                  if(Validaciones.contrasena.test(e.target.value)){                    
                        passE.classList.replace('passM','passd');
                        comprobar['contrasena'] = true;
                  }else{
                        passE.classList.replace('passd','passM');
                        comprobar['contrasena'] = false;
                  }
            break;
            case "usuario_apellido":
                  const perror = document.getElementById('errorM');
                  if(Validaciones.apellido.test(e.target.value)){                    
                        perror.classList.replace('error1','errorM');
                        comprobar['apellido'] = true;
                  }else{
                        perror.classList.replace('errorM','error1');
                        comprobar['apellido'] = false;
                  }
            break;

      }
};
const validarP = ()=>{
      const pass = document.getElementById('password');
      const pass2 = document.getElementById('password1');
      const mensaje = document.getElementById('act');
      if(pass.value == pass2.value){
          mensaje.classList.replace('incorrecta','act');
          comprobar['contrasena'] = true;
      }else{
            mensaje.classList.replace('act','incorrecta');
            comprobar['contrasena'] = false;
      }
};

/*formulario.addEventListener('submit',(e)=>{
      const formEr = document.getElementById('formE');
      //e= evento
      e.preventDefault();
      if(comprobar.nombre && comprobar.apellido && comprobar.contrasena ){ 
            formEr.classList.replace('formA','formE');

      }else{
            formEr.classList.replace('formE','formA');
      }
  });*/


inputs.forEach((input)=>{
      input.addEventListener('keyup', users);
      input.addEventListener('blur', users);  
});


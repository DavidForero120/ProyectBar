<%-- 
    Document   : actualizarUsuario
    Created on : 8/11/2022, 06:29:47 PM
    Author     : alrod
--%>

<%@page import="ModeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">     
        <link rel="stylesheet" href="actualizaru.css">
        <link href="assets/css/ActualizarU.css" rel="stylesheet" type="text/css"/>
        <title>Actualizar</title>
    </head>
    <body>
        <nav>
            <div class="partizq" id="partizq">
            <div class="nav_admin">
                <div class="logo_admin">
                    <img class="imagen-main" src="assets/img/logocolor.png" alt="logo" class="log_a"/>
                </div>
                <div class="but">
                <form method="post" action="Usuario">
                    <button class="btn btn-light"> <i class="fa-solid fa-right-from-bracket"></i>volver</button>
                    <input type="hidden" name="valor" value="6">
                </form>
            </div>
            </div>  
            </div>
        </nav>   
        <div class="actualizar">
            <%
                UsuarioVO usuVO = (UsuarioVO) request.getAttribute("datosConsultados");

                if (usuVO != null) {
            %>
            <h1>Actualizar trabajador</h1>
            <form action="Usuario" method="POST" id="actualizarU">
                <input type="hidden" name="id_usuario" value="<%=usuVO.getId_usuario()%>">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon3">Nombre</span>
                    <input type="text" name="usuario_nombre" placeholder="<%=usuVO.getUsuario_nombre()%>" id="nombre" class="form-control" required>
                </div>
                <div class="namea" id="namea">
                    <p><i class="fa-solid fa-circle-exclamation" id="err"></i>!!Completa el campo, solo letras¡¡</p>
                </div>  
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon3">Apellido</span>
                    <input type="text" name="usuario_apellido" placeholder="<%=usuVO.getUsuario_apellido()%>" id="apelido" class="form-control" required>
                </div>
                <div class="errorM" id="errorM">
                    <p><i class="fa-solid fa-circle-exclamation" id="err"></i>!!Debe completar este campo, solo acepta letras¡¡</p>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon3">Contraseña</span>
                    <input type="password" name="usuario_password" placeholder="<%=usuVO.getUsuario_password()%>" id="password1" class="form-control" required>
                </div>  
                <div class="passd" id="passd">
                    <p><i class="fa-solid fa-circle-exclamation" id="err"></i>!!Digite una contraseña, acepta puntos¡¡</p>
                </div> 
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon3">Confirmar contraseña</span>
                    <input type="password" name="password2"  id="password" class="form-control" required>
                </div>         
                <div class="act" id="act">
                    <p><i class="fa-solid fa-circle-exclamation" id="err"></i>!!Las contraseñas deben ser iguales¡¡</p>
                </div>      
                <label for="est">Estado:</label>
                <select name="usuario_estado" id="est" class="form-select" >
                    <option value="1" >Activo</option>
                    <option value="2" >Eliminar</option>
                </select>
                <div class="formE" id="formE">
                    <p><i class="fa-solid fa-circle-exclamation" id="err"></i>!!Completar el formulario¡¡</p>
                </div>
                <div class="opt_a">

                    <div>
                        <button class="btn btn-outline-success">Actualizar</button><br>
                        <input type="hidden"  name="valor" value="3">
                    </div>
                    <div>


                    </div>
                </div>
                <%}%>
            </form>
            <form action="Usuario" method="POST" id="cancel">
                <button class="btn btn-outline-primary">Cancelar</button>
                <input type="hidden"  name="valor" value="6">
            </form>

        </div>

        <%
            if (request.getAttribute("Error") != null) { %>
        ${Error}

        <%} else {%>
        ${Exito}        
        <%}%>
        <script src="assets/js/ActualizarU.js" type="text/javascript"></script>
    </body>
</html>
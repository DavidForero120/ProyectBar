<%-- 
    Document   : cliente
    Created on : 3/08/2022, 10:19:00 PM
    Author     : alrod
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/cliente.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

        <title>Client</title>
    </head>
    <body>


        <nav>
            <div class="partizq" id="partizq">
                <div class="logo_admin">
                    <img class="imagen-main" src="assets/img/logocolor.png" alt="logo" class="log_a"/> </div>
                <form method="post" action="Usuario" class="volver">
                    <button class="btn btn-light"><i class="fa-solid fa-right-from-bracket"></i>Volver</button>
                    <input type="hidden" name="valor" value="9">
                </form> 
            </div>
        </nav>   
        <section class="container-family" id="container-family">


            <div class="formulario-family" id="formulario-family">
                <form method="POST" action="Cliente" id="register" class="register">
                    <div class="tituloo" id="tituloo">
                        <h1>Registrar Cliente</h1>
                    </div>
                    <div class="data-documents">
                        <div class="labels" id="f_cliente_tipo">
                            <span>Tipo de documento:</span>      
                            <div id="group_input">
                                <select name="cliente_tipo" id="tipdo" class="form-select" aria-label="Default select example">
                                    <option value="1">Cedula</option>
                                    <option value="2">Cedula de Extranjeria</option>
                                    <option value="3">NIT</option>
                                </select>              
                            </div>
                        </div>

                        <div class="labels" id="f_cliente_documento">
                            <div class="input-group mb-3">
                                <span c>Numero de documento:</span>       
                                <div class="form-floating">
                                    <input type="text" name="cliente_documento" id="cliente_documento" class="cliente_documento"></i>                  
                                </div>
                                <span class="msg_error n_document">Solo puede ingresar numeros de minimo 5 y maximo 10 digitos</span>
                            </div>
                        </div>
                    </div>
                    <div class="information">
                        <div class="labels" id="f_cliente_nombre">
                            <div class="input-group mb-3">
                                <span>Nombre:</span>       
                                <div class="form-floating">
                                    <input type="text" name="cliente_nombre" id="cliente_nombre" class="cliente_nombre"></i>
                                </div>
                                <span class="msg_error">Solo puede ingresar letras y un maximo de 40 caracteres</span>
                            </div>
                        </div>

                        <div class="labels" id="f_cliente_apellido">
                            <div class="input-group mb-3">
                                <span >Apellido:</span>       
                                <div class="form-floating">
                                    <input type="text" name="cliente_apellido" id="cliente_apellido" class="cliente_apellido"></i>                              
                                </div><span class="msg_error">Solo puede ingresar letras y un maximo de 40 caracteres</span>
                            </div>
                        </div>
                    </div>
                    <div class="state-email">
                        <div class="labels" id="f_cliente_estado">
                            <div id="group_input">
                                <input type="hidden" value="1" name="cliente_estado" >
                            </div>
                        </div>
                    </div>
                    <div class="date">
                        <div class="labels" id="f_cliente_nacimiento">
                            <span>Fecha de Nacimiento</span>
                            <div id="group_input">
                                <input type="date" name="cliente_nacimiento" id="cliente_nacimiento" class="cliente_nacimiento" required max="2004-01-01">
                            </div>
                            <span class="msg_error">El correo debe de tener un "@" obligatoriamente y un "." despues</span>
                        </div>
                        <div class="labels" id="f_cliente_correo">
                            <div class="input-group mb-3">
                                <span >Correo Electronico:</span>       
                                <div class="form-floating">
                                    <input type="text" name="cliente_correo" id="cliente_correo" class="cliente_correo">                              
                                </div><span class="msg_error">El correo debe de tener un "@" obligatoriamente y un "." despues</span>
                            </div>
                        </div>
                    </div>

                    <div class="frm-no-enviado" id="frm-no-enviado">
                        <p><b>Error:</b> Hay campos incompletos o incorrectos.</p>
                    </div>

                    <div class="boton" id="boton">
                        <button class="btn-enviar btn btn-outline-dark" type="submit">Registar Cliente</button>
                        <input type="hidden" value="1" name="valor">
                    </div>

                </form>
                <div id="error">
                    <%                        if (request.getAttribute("mensajeError") != null) { %>
                    ${mensajeError}

                    <%} else {%>
                    ${mensajeExito}        
                    <%}%>
                </div>
            </div>


        </section>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <script src="assets/js/validacionCliente.js" type="text/javascript"></script>
    </body>
</html>

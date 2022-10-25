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

        <title>Client</title>
    </head>
    <body>
        <section class="container-family" id="container-family">


            <div class="formulario-family" id="formulario-family">
                <div class="tituloo" id="tituloo">
                    <h1>Registrar Cliente</h1>
                </div>
                <form method="POST" action="Cliente" id="register" class="register">

                    <div class="labels" id="f_cliente_documento">
                        <h2>Numero de documento:</h2>
                        <div id="group_input">
                            <input type="text" name="cliente_documento" id="cliente_documento" class="cliente_documento"></i><span class="msg_error">Solo puede ingresar numeros de minimo 5 y maximo 10 digitos</span>                  
                        </div>           
                    </div>


                    <div class="labels" id="f_cliente_nombre">
                        <h2>Nombre:</h2>
                        <div id="group_input">
                            <input type="text" name="cliente_nombre" id="cliente_nombre" class="cliente_nombre"></i>
                            <span class="msg_error">Solo puede ingresar letras y un maximo de 40 caracteres</span>
                        </div>
                    </div>


                    <div class="labels" id="f_cliente_apellido">
                        <h2>Apellido:</h2>
                        <div id="group_input">
                            <input type="text" name="cliente_apellido" id="cliente_apellido" class="cliente_apellido"></i>
                            <span class="msg_error">Solo puede ingresar letras y un maximo de 40 caracteres</span>
                        </div>
                    </div>


                    <div class="labels" id="f_cliente_estado">
                        <h2>Cliente Estado:</h2>
                        <div id="group_input">
                            <select name="cliente_estado" id="estad" class="fr_input">
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>
                            </select>
                        </div>
                    </div>

                    <div class="labels" id="f_cliente_correo">
                        <h2>Correo Electronico:</h2>
                        <div id="group_input">
                            <input type="text" name="cliente_correo" id="cliente_correo" class="cliente_correo">
                            <span class="msg_error">El correo debe de tener un "@" obligatoriamente y un "." despues</span>
                        </div>
                    </div>


                    <div class="labels" id="f_cliente_nacimiento">
                        <h2>Fecha de Nacimiento</h2>
                        <div id="group_input">
                            <input type="date" name="cliente_nacimiento" id="cliente_nacimiento" class="cliente_nacimiento" required>
                        </div>
                    </div>

                    <div class="labels" id="f_cliente_tipo">
                        <h2>Tipo de documento:</h2>
                        <div id="group_input">
                            <select name="cliente_tipo" id="tipdo" class="fr_input">
                                <option value="1">Cedula</option>
                                <option value="2">Cedula de Extranjeria</option>
                                <option value="3">NIT</option>
                            </select>              
                        </div>
                    </div>

                    <div class="frm-no-enviado" id="frm-no-enviado">
                        <p><b>Error:</b> Hay campos incompletos o incorrectos.</p>
                    </div>

                    <div class="boton" id="boton">
                        <button class="btn-enviar" type="submit">Registar Cliente</button>
                        <input type="hidden" value="1" name="valor">
                    </div>

                </form>
                <div id="error">
                    <%
                        if (request.getAttribute("mensajeError") != null) { %>
                    ${mensajeError}

                    <%} else {%>
                    ${mensajeExito}        
                    <%}%>
                </div>   
            </div>


        </section>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <%-- <script src="assets/js/validacionCliente.js" type="text/javascript"></script>--%>
    </body>
</html>

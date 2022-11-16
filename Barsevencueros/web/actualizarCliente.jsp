<%-- 
    Document   : actualizarCliente
    Created on : 20/09/2022, 09:19:07 PM
    Author     : Leider
--%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="Controlador.ClienteControlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/cliente.css" rel="stylesheet" type="text/css"/>
        <title>Actualizar cliente</title>
    </head>
    <body>
        <section class="container-family" id="container-family">
            <div class="formulario-family" id="formulario-family">
        
        <div class="tituloo" id="tituloo" id="register" class="register">
                    <h1>Registrar Cliente</h1>
                </div>
        <%            ClienteVO cliVO = (ClienteVO) request.getAttribute("datosConsultados");

            if (cliVO != null) {

        %>

        <form method="post" action="Cliente" id="register" class="register">
            <table>
                <input type="hidden" name="cliente_id" value="<%=cliVO.getId_cliente()%>">
                <div class="labels" id="f_cliente_documento">
                    <h2>Numero de documento:</h2>
                    <div id="group_input">
                        <input type="text" name="cliente_documento" placeholder="<%=cliVO.getNumero_documento()%>" id="cliente_documento" class="cliente_documento" value="<%=cliVO.getNumero_documento()%>"></i><span class="msg_error">Solo puede ingresar numeros de minimo 5 y maximo 10 digitos</span>                  
                    </div>           
                </div>


                <div class="labels" id="f_cliente_nombre">
                    <h2>Nombre:</h2>
                    <div id="group_input">
                        <input type="text" name="cliente_nombre" placeholder="<%= cliVO.getCliente_nombre()%>" value="<%= cliVO.getCliente_nombre()%>"  id="cliente_nombre" class="cliente_nombre" </i>
                        <span class="msg_error">Solo puede ingresar letras y un maximo de 40 caracteres</span>
                    </div>
                </div>


                <div class="labels" id="f_cliente_apellido">
                    <h2>Apellido:</h2>
                    <div id="group_input">
                        <input type="text" name="cliente_apellido" placeholder="<%=cliVO.getCliente_apellido()%>" value="<%=cliVO.getCliente_apellido()%>" id="cliente_apellido" class="cliente_apellido"></i>
                        <span class="msg_error">Solo puede ingresar letras y un maximo de 40 caracteres</span>
                    </div>
                </div>


                <div class="labels" id="f_cliente_estado">
                    <h2>Cliente Estado:</h2>
                    <div id="group_input">
                        <select name="cliente_estado" value="<%=cliVO.getCliente_estado()%>" id="estad" class="fr_input">
                            <option value="1">Activo</option>
                            <option value="2">Eliminar</option>
                        </select>
                    </div>
                </div>

                <div class="labels" id="f_cliente_correo">
                    <h2>Correo Electronico:</h2>
                    <div id="group_input">
                        <input type="text" name="cliente_correo" placeholder="<%=cliVO.getCliente_correo()%>" value="<%=cliVO.getCliente_correo()%>" id="cliente_correo" class="cliente_correo">
                        <span class="msg_error">El correo debe de tener un "@" obligatoriamente y un "." despues</span>
                    </div>
                </div>


                <div class="labels" id="f_cliente_nacimiento">
                    <h2>Fecha de Nacimiento</h2>
                    <div id="group_input">
                        <input type="date" name="cliente_nacimiento" placeholder="<%=cliVO.getFecha_nacimiento()%>" value="<%=cliVO.getFecha_nacimiento()%>"  id="cliente_nacimiento" class="cliente_nacimiento" required>
                    </div>
                </div>

                <div class="labels" id="f_cliente_tipo">
                    <h2>Tipo de documento:</h2>
                    <div id="group_input">
                        <select name="cliente_tipo" value="<%=cliVO.getTipo_documento()%>" id="tipdo" class="fr_input">
                            <option value="1">Cedula</option>
                            <option value="2">Cedula de Extranjeria</option>
                            <option value="3">NIT</option>
                        </select>              
                    </div>
                </div>

                <div class="boton" id="boton">
                    <button class="btn-enviarrrr" type="submit">Actualizar</button>
                    <input type="hidden" value="2" name="valor">
                </div>
            </table>
        </form>
        
            <div class="boton" id="boton">
                <a href="listarCliente.jsp"><button class="btn-enviarrr" >Volver</button></a>
            </div> 
 


        <%}%>

        <% if (request.getAttribute("mensaje error") != null) {%>
        $mensajeError{

        <%} else {%>
        ${mensajeError}
        <%}%>
 </div>


        </section>
 <script src="assets/js/ActualizarCli.js" type="text/javascript"></script>
    </div></center>
</body>
</html>


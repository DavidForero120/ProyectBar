<%-- 
    Document   : actualizarCliente
    Created on : 20/09/2022, 09:19:07 PM
    Author     : Leider
--%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="Controlador.ClienteControlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar cliente</title>
    </head>
    <body>
        <h1>Actualizar Cliente</h1>
        <%
            
        ClienteVO cliVO = (ClienteVO)request.getAttribute("datosConsultados");
        
        if (cliVO!=null){

        %>
        
        <form method="post" action="Cliente">
            <table>
            <input type="hidden" name="cliente_id" value="<%=cliVO.getId_cliente()%>">
            <h2>Numero de documento</h2>
            <input type="text" name="cliente_documento" value="<%=cliVO.getNumero_documento()%>">
            <h2>Nombre</h2>
            <input type="text" name="cliente_nombre" value="<%=cliVO.getCliente_nombre()%>">
            <h2>Apellido</h2>
            <input type="text" name="cliente_apellido" value="<%=cliVO.getCliente_apellido()%>">
            <h2>Cliente Estado</h2>
            <select name="cliente_estado" value="<%=cliVO.getCliente_estado()%>">
                <option value="1">Activo</option>
                <option value="2">Inactivo</option>
            </select>
            <h2>Correo Electronico</h2>
            <input type="text" name="cliente_correo" value="<%=cliVO.getCliente_correo()%>">
            <h2>Fecha de Nacimiento</h2>
            <input type="date" name="cliente_nacimiento" value="<%=cliVO.getFecha_nacimiento()%>">
            
            <h2>Tipo de documento</h2>
            <select name="cliente_tipo" value="<%=cliVO.getTipo_documento()%>">
                <option value="1">Cedula</option>
                <option value="2">Tarjeta de Identidad</option>
            </select>
            </table><br><br>
            <button class="boton-personalizado-4" >Actualizar</button>
            <input type="hidden" value="2" name="valor">
        </form><br><br>
        
        <%}%>
        
        <% if (request.getAttribute("mensaje error") != null) {%>
            $mensajeError{

            <%} else {%>
            ${mensajeError}
            <%}%>
            </div></center>
    </body>
</html>


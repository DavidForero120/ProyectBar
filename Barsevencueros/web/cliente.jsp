<%-- 
    Document   : cliente
    Created on : 3/08/2022, 10:19:00 PM
    Author     : alrod
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registrar Cliente</h1>
        
        
        <form method="POST" action="Cliente">
            <h2>Numero de documento</h2>
            <input type="text" name="cliente_documento">
            <h2>Nombre</h2>
            <input type="text" name="cliente_nombre">
            <h2>Apellido</h2>
            <input type="text" name="cliente_apellido">
            <h2>Cliente Estado</h2>
            <select name="cliente_estado">
                <option value="1">Activo</option>
                <option value="2">Inactivo</option>
            </select>
            <h2>Correo Electronico</h2>
            <input type="text" name="cliente_correo">
            <h2>Fecha de Nacimiento</h2>
            <input type="date" name="cliente_nacimiento">
            
            <h2>Tipo de documento</h2>
            <select name="cliente_tipo">
                <option value="1">Cedula</option>
                <option value="2">Tarjeta de Identidad</option>
            </select>
            
            <button>Registar Cliente</button>
            <input type="hidden" value="1" name="valor">
            
        </form>
        <%
            if (request.getAttribute("mensajeError") != null) { %>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}        
        <%}%>
        
        
    </body>
</html>

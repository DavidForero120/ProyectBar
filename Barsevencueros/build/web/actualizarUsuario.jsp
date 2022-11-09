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
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            UsuarioVO usuVO = (UsuarioVO)request.getAttribute("datosConsultados");
            
            if(usuVO != null){
        %>
        <h1>Actualizar usuario</h1>
        <form action="Usuario" method="POST">
            
            <input type="hidden" name="id_usuario" value="<%=usuVO.getId_usuario()%>">
            <label for="nombre">Nombre:</label>
                <input type="text" name="usuario_nombre" placeholder="<%=usuVO.getUsuario_nombre()%>" id="nombre">
            <label for="apelido">Apellido</label>
                <input type="text" name="usuario_apellido" placeholder="<%=usuVO.getUsuario_apellido()%>" id="apelido" >
           <label for="password">Contraseña</label>
                <input type="password" name="usuario_password" placeholder="<%=usuVO.getUsuario_password()%>" id="password" >
            <label for="est">Estado</label>
            <select name="usuario_estado" id="est">
                <option value="1" >Activo</option>
                <option value="2" >Inactivo</option>
            </select>
            <button>Actualizar</button><br>
            <input type="hidden"  name="valor" value="3">
           <%}%>
        </form>
        
           <%
            if (request.getAttribute("Error") != null) { %>
        ${Error}

        <%} else {%>
        ${Exito}        
        <%}%>
    </body>
</html>
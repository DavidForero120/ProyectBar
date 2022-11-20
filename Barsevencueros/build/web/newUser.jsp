<%-- 
    Document   : newUser
    Created on : 14/08/2022, 05:52:14 PM
    Author     : 57314
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@include file="Sesiones.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create</title>
    </head>
    <body>
        <h1>Registrar nuevo usuario</h1>
        <form action="Usuario" method="POST">
            <label for="nombre">Nombre:</label>
            <input type="text" name="usuario_nombre" id="nombre" required>
            <label for="apelido">Apellido</label>
            <input type="text" name="usuario_apellido" id="apelido" required>
           <label for="password">Contraseña</label>
           <input type="password" name="usuario_password" id="password" required>
            <label for="est">Estado</label>
            <select name="usuario_estado" id="est">
                <option value="1" >Activo</option>
                <option value="2" >Inactivo</option>
            </select>
            <label for="rol">ROL</label>
            <select name="rol" id="rol">
                <option value="1" >Administrador</option>
                <option value="2" >Cajero</option>
                <option value="3" >Mesero</option>
            </select>
            <button>Registrar</button><br>
           <input type="hidden" value="2" name="valor">
        </form>
        
           <%
            if (request.getAttribute("Error") != null) { %>
        ${Error}

        <%} else {%>
        ${Exito}        
        <%}%>
        
        
        <table class="table table-dark table-striped-column">
            <tr>
                <td>Id</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>Contraseña</td>
                <td>Estado</td>
                <td>Rol</td>
            </tr>
            <%
                UsuarioVO usuVO = new UsuarioVO();
                UsuarioDAO usuDAO = new UsuarioDAO();
                
                ArrayList<UsuarioVO> listarUsuario = usuDAO.listar();
                
                for(int i =0;i<listarUsuario.size();i++){
                    usuVO = listarUsuario.get(i);
                
            %>
            <tr>
                <td><%=usuVO.getId_usuario()%></td>
                <td><%=usuVO.getUsuario_nombre()%></td>
                <td><%=usuVO.getUsuario_apellido()%></td>
                <td><%=usuVO.getUsuario_password()%></td>
                <td><%=usuVO.getUsuario_nombre()%></td>
                <td><%=usuVO.getId_rolFK()%></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>

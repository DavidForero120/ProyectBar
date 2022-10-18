<%-- 
    Document   : registroMesa
    Created on : 18/08/2022, 07:07:46 PM
    Author     : 57314
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.MesaDAO"%>
<%@page import="ModeloVO.MesaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva mesa</title>
    </head>
    <body>
        <h3>Registrar Mesa</h3>
        <form method="POST" action="Mesa" >
            <label for="nMesa">Número de mesa:</label>
            <input type="text" name="numero" id="nMesa">
            <select name="estado">
                <option value="1">Activo</option>
                <option value="2">Inactivo</option>           
            </select>
            <button>Registar</button>
            <input type="hidden" value="1" name="valor">
        </form>
        <%
            if (request.getAttribute("mensajeError") != null) { %>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}        
        <%}%>
        <h3>Mesas Registradas</h3>
            <table class="table table-dark table-striped-column">
                <tr>
                    <td>Numero de Mesa</td>
                    <td>Estado</td>
                
                </tr>s
        <%
            MesaVO mesaVO = new MesaVO();
            MesaDAO mesaDAO = new MesaDAO();
            
            ArrayList<MesaVO> listarMesa = mesaDAO.listar();
            
            for(int i=0;i<listarMesa.size();i++){
                mesaVO = listarMesa.get(i);
        %>
        <tr>
            <td><%=mesaVO.getMesa_numero()%></td>
            <td><%=mesaVO.getMesa_estado()%></td>
        </tr>
        <%}%>
            </table>
            
        <form method="post" action="Mesa" class="table table-striped-columns">
            <table>
                <tr>
                    <th> 
                        <h5>Consultar por numero de mesa</h5>
                        <div class="input-group mb-3">
                        <input type="text" name="id" class="form-control">
                        <button class="btn btn-outline-secundarry" >Consultar</button>
                        <input type="hidden" value="3" name="valor">
                        </div>
                        
                        
                    </th>
                </tr>
            </table>        
        </form>
    </body>
</html>

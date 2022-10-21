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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva mesa</title>
        <link href="assets/css/mesa.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="container-img">
            <div class="container-main">
                <div class="title-main">
                    <h3 class="register-title">Mesa</h3>
                </div>
                <div class="main-form">
                    <div class="form-mesa">
                        <form method="POST" action="Mesa">
                            <h2 class="title-reg">Registro de Mesa</h2>
                            <label for="nMesa">Número de mesa:</label>
                            <input type="text" name="numero" id="nMesa">
                            <select name="estado">
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>           
                            </select>
                            <button class="register">Registrar</button>
                            <input type="hidden" value="1" name="valor">
                        </form>
                    </div>
                    <div class="error">
                    <%            if (request.getAttribute("mensajeError") != null) { %>
                    ${mensajeError}

                    <%} else {%>
                    ${mensajeExito}        
                    <%}%></div>
                    <div class="shows-registers">
                        <h3>Mesas Registradas</h3>
                        <table class="mesas-register">
                            <thead>
                            <tr>
                                <td class="mesa-n">Numero de Mesa</td>
                                <td class="mesa-n">Estado</td>
                            </tr>
                            </thead>
                            <%
                                MesaVO mesaVO = new MesaVO();
                                MesaDAO mesaDAO = new MesaDAO();

                                ArrayList<MesaVO> listarMesa = mesaDAO.listar();

                                for (int i = 0; i < listarMesa.size(); i++) {
                                    mesaVO = listarMesa.get(i);
                            %>
                            <tr class="change">
                                <td><%=mesaVO.getMesa_numero()%></td>
                                <td><%=mesaVO.getMesa_estado()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <div class="query-mesa">
                        <form method="post" action="Mesa" >
                            <table class="query">
                                <tr>
                                    <th> 
                                        <h2 class="number">Consultar por numero de mesa</h2>
                                        <div >
                                            <input type="text" name="id" id="query-all">
                                            <button class="query-button">Consultar</button>
                                            <input type="hidden" value="3" name="valor">
                                        </div>
                                    </th>
                                </tr>
                            </table>        
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
          <hr id="hr">
        <div id="container-img">
            <div class="container-main">
                <div class="main-form">
                    <div class="form-mesa">
                        <form method="POST" action="Mesa">
                            <h2 class="title-reg">Registro de Mesa</h2>
                            <div class="input-group mb-3">
                                <span class="input-group-text">Numero de Mesa :</span>
                                <input type="text" name="numero" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">                              
                            </div>
                            <select name="estado" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                <option value="1">Activo</option>
                                <option value="2">Inactivo</option>           
                            </select>
                            <div id="button">
                                <button class="btn btn-dark" >Registrar</button>
                            </div>
                            <input type="hidden" value="1" name="valor">
                        </form>
                    </div>
                    <div class="error">
                        <%            if (request.getAttribute("mensajeError") != null) { %>
                        ${mensajeError}

                        <%} else {%>
                        ${mensajeExito}        
                        <%}%>
                        
                    </div>
                        <hr id="hr">
                        
                    <div class="shows-registers">
                        <div id="titulo_">
                            <h3>Mesas Registradas</h3>
                        </div>
                        <div id="tabla_">
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
                    </div>
                            <hr id="hr">
                    <div class="query-mesa">
                        <form method="post" action="Mesa" >
                            <h2 class="number">Consultar por numero de mesa</h2>
                            <div class="input-group mb-3">
                                <span class="input-group-text">Consultar Mesa :</span>
                                <input name="id" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
                                <button class="query-button">Consultar</button>
                                <input type="hidden" value="3" name="valor">
                            </div>
                            <div class="error2">
                                <%            if (request.getAttribute("msError") != null) { %>
                                ${msError}

                                <%} else {%>
                                ${mensajeExito}        
                                <%}%></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

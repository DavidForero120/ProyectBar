<%-- 
    Document   : listarCliente
    Created on : 14/09/2022, 11:09:38 AM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Clientes</h1>
        <%
            if (request.getAttribute("mensajeError") != null) { %>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}        
        <%}%>
        <button> <a href="../BarSevenCueros/cliente.jsp">Registrar Clientes</a></button>
        <table class="table table-striped-columns">
            <tr>
                <td>ID</td>
                <td>Documento</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>Estado</td>
                <td>Correo</td>
                <td>Fecha Nacimiento</td>
                <td>Tipo Documento</td>
            </tr>
            <%
                    ClienteVO cliVO = new ClienteVO();
                    ClienteDAO cliDAO = new ClienteDAO();
                    
                    ArrayList<ClienteVO> listaCliente = cliDAO.listar();
                    for(int i = 0; i<listaCliente.size();i++){
                        cliVO = listaCliente.get(i);
                %>
                
                <tr>
                    <td><%=cliVO.getId_cliente()%></td>
                    <td><%=cliVO.getNumero_documento()%></td>
                    <td><%=cliVO.getCliente_nombre()%></td>
                    <td><%=cliVO.getCliente_apellido()%></td>
                    <td><%=cliVO.getCliente_estado()%></td>
                    <td><%=cliVO.getCliente_correo()%></td>
                    <td><%=cliVO.getFecha_nacimiento()%></td>
                    <td><%=cliVO.getTipo_documento()%></td>
                </tr>
                <%}%>
        </table>
        <form method="post" action="Cliente" class="table table-striped-columns">
            <table>
                <tr>
                    <th> 
                        <h5>Consultar Cliente</h5>
                        <div class="input-group mb-3">
                        <input type="text" name="cliente_id" class="form-control">
                        <button class="btn btn-outline-secundarry" >Consultar</button>
                        <input type="hidden" value="3" name="valor">
                        </div>
                        
                        
                    </th>
                </tr>
            </table>        
        </form>
    </body>
</html>

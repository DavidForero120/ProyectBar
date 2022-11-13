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
        <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/listClient.css" rel="stylesheet" type="text/css"/>
        <title>Ver clientes</title>
        
    </head>
    <body>

        <div class="clien_">
            <form action="Usuario" method="post" id="froma">
                <div class="boton" id="boton">
                    <button class="btn-enviarr">Volver</button>
                    <input type="hidden" value="5" name="valor">
                </div>
            </form>
            <hr>
            <div class="Titgene">
            <h1>Clientes</h1>
            </div>
            <hr>
            <form method="post" action="Cliente" id="consu">
                            <h2 class="number">Consultar por número Documento</h2>
                            <div class="input-group mb-3">
                                <span class="input-group-text">Número Documento:</span>
                                <input name="cliente_documento" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
                                <button type="submit" class="btn btn-outline-success">Consultar</button>
                                <input type="hidden" name="valor" value="6">
                            </div>
                            <div class="error2">
                                <%                if (request.getAttribute("mensajeError") != null) { %>
                ${mensajeError}

                <%} else {%>
                ${mensajeExito}        
                <%}%>  </div>
            </form>
            <hr>
           <div class="Titgene">
            <h1>Clientes Registrados</h1>
            </div>
            <form action="Cliente" method="post" id="froma">
                <div id="list_c">   
            <table class="table table-dark table-hover">
                
                
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">No. Documento</th>
                                        <th scope="col">Nombres</th>
                                        <th scope="col">Apellidos</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Correo</th>
                                        <th scope="col">fecha Nacimiento</th>
                                        <th scope="col">Documento</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                
                                 <%
                    ClienteVO cliVO = new ClienteVO();
                    ClienteDAO cliDAO = new ClienteDAO();

                    ArrayList<ClienteVO> listaCliente = cliDAO.listar();
                    for (int i = 0; i < listaCliente.size(); i++) {
                        cliVO = listaCliente.get(i);
                %>
                                
                                <tbody>
                                    <tr>
                                        <input type="hidden" name="valor" value="3"></td>
                                        <th scope="row"><%=cliVO.getId_cliente()%></th>
                                        <td><%=cliVO.getNumero_documento() %></td>
                                        <td><%=cliVO.getCliente_nombre()%></td>
                                        <td><%=cliVO.getCliente_apellido() %></td>
                                        <%
                                        if (cliVO.getCliente_estado().equals("1")) {
                                            String estate = "Activo";          
                                    %>
                                        <td><%=estate %></td>  
                                        <%
                                            }else if(cliVO.getCliente_estado().equals("2")){
                                            String estate = "Inactivo";
                                    %>
                                        <td><%=estate %></td>
                                        <%}%>
                                        <td><%=cliVO.getCliente_correo() %></td>
                                        <td><%=cliVO.getFecha_nacimiento() %></td>
                                        <%
                                        if (cliVO.getTipo_documento().equals("1")) {
                                            String tipdo = "Cedula de Ciudadania";          
                                    %>
                                        <td><%=tipdo %></td>
                                        <%
                                            }else if(cliVO.getTipo_documento().equals("2")){
                                            String tipdo = "Cedula de Extranjeria";
                                    %>
                                        <td><%=tipdo %></td>
                                        <%
                                            }else if(cliVO.getTipo_documento().equals("3")){
                                            String tipdo = "NIT";
                                    %>
                                        <td><%=tipdo %></td>
                                      <%}%>  
                                <div>
                                    <td><button type="submit" name="datos" value="<%=cliVO.getId_cliente()%>" class="btn btn-outline-success">Editar
                                        </button>
                                     
                                </div>
                                        
                                    </tr>          
                                </tbody>
                                
                                <%}%>
                            </table>
                    
                </div>
            </form>                     
        </div>


    </body>
</html>

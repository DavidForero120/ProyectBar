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
        <title>Ver clientes</title>
        <link href="assets/css/admin.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/cliente.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
     
        <div class="clien_">
            <form action="Usuario" method="post">
                <button class="btn btn-dark"><a href="Usuario?valor=5">Volver</a></button>
                
            </form>
            <h1>Clientes</h1>
            <div id="list_c">
                <%                if (request.getAttribute("mensajeError") != null) { %>
                ${mensajeError}

                <%} else {%>
                ${mensajeExito}        
                <%}%>


                <%
                    ClienteVO cliVO = new ClienteVO();
                    ClienteDAO cliDAO = new ClienteDAO();

                    ArrayList<ClienteVO> listaCliente = cliDAO.listar();
                    for (int i = 0; i < listaCliente.size(); i++) {
                        cliVO = listaCliente.get(i);
                %>
                <div class="cards_">
                    <form>
                        <div>  
                            <div class="card text-bg-dark mb-3" style="width: 22rem; height: 18rem !important;" >
                                <div class="card-header text-center">
                                    <input type="hidden" value="<%=cliVO.getId_cliente()%>">
                                    <h2><%=cliVO.getCliente_nombre()%> <%=cliVO.getCliente_apellido()%></h2>
                                </div>
                                <div class="card-body ">
                                    <h3>Documento: <%=cliVO.getNumero_documento()%></h3>
                                    <h3>Correo: <%=cliVO.getCliente_correo()%></h3>
                                    <h3>Nacimiento: <%=cliVO.getFecha_nacimiento()%></h3>
                                    <%
                                        if (cliVO.getCliente_estado().equals("1")) {
                                            String estate = "Activo";

                                    %>    

                                    <h3><%=estate%></h3>

                                    <%}%>
                                </div>
                                <ul class="text-end">
                                    <button class="btn btn-outline-light bu">editar</button>
                                </ul>                    
                            </div>
                        </div> 
                    </form>
                </div>

                <%}%>
            </div>
        </div>


    </body>
</html>

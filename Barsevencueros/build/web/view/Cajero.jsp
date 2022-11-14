<%--
    Document   : Cajero
    Created on : 23/07/2022, 05:07:28 PM
    Author     : David
--%>

<%@page import="ModeloDAO.PagarDAO"%>
<%@page import="ModeloVO.PagarVO"%>
<%@page import="ModeloDAO.PedidoDAO"%>
<%@page import="ModeloVO.PedidoVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.MesaDAO"%>
<%@page import="ModeloVO.MesaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@include file="../Sesiones.jsp" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/cajero.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>

        <section class="content_family" id="content_family">

            <div class="partizq" id="partizq">
                <div class="titulo">
                    <h1>Cajero</h1>
                </div>
                <div class="image" id="image">
                    <img id="im" class="im" src="assets/img/logocolor.png" alt=""/>

                </div>    
                <div class="butoon" id="butoon">
                    <button class="kik"> <a id="vr" ><i class="fa-solid fa-wine-glass"></i>Administrar Producto</a></button>
                    <button class="kik" > <a id="vp" ><i class="fa-solid fa-wine-bottle"></i>Pagar Pedido</a></button>    
                    <button class="kik"> <a id="vm" ><i class="fa-solid fa-table"></i>Administrar Mesa</a></button>
                </div>
                <form method="post" action="Sesiones" id="out_">
                    <div class="salr" id="salr">
                        <button type="submit" value="CerrarSesion" class="btn btn-outline-light" id="kik" ><i class="fa-solid fa-right-from-bracket" id="salir_"></i>SALIR</button>
                    </div>    
                </form>
            </div>


            <div class="partder" id="partder">
                <div class="ve_p" id="ve_p">
                    <h1>Consulta de Productos</h1>

                    <form method="POST" action="Producto" class="formm" id="formm">

                        <div class="cards_">
                            <%  ProductoVO prodVO = new ProductoVO();
                                ProductoDAO prodDAO = new ProductoDAO();

                                ArrayList<ProductoVO> listarProducto = prodDAO.listar();

                                for (int i = 0; i < listarProducto.size(); i++) {
                                    prodVO = listarProducto.get(i);
                            %>        
                            <div>  
                                <div class="card text-bg-dark mb-3" style="width: 18rem; height: 15rem !important;" >
                                    <div class="card-header">
                                        <input type="hidden" value="<%=prodVO.getId_producto()%>">
                                        <h3 class="titpro"><%=prodVO.getProducto_nombre()%></h3>
                                    </div>
                                    <div class="card-body" id="cardsi">
                                        <p class="card-text">Precio: <%= prodVO.getProducto_precio()%></p>                                
                                        <p class="card-text">Cantidad: <%=prodVO.getProducto_cantidad()%><p>  
                                        <p class="card-text">Estado: </p>
                                        <%
                                            if (prodVO.getProducto_estado().equals("1")) {
                                                String act = "Activo";
                                        %>                                  
                                        <p class="card-text"><%=act%></p>  
                                        <%} else if (prodVO.getProducto_estado().equals("2")) {
                                            String act = "Inactivo";
                                        %>
                                        <p class="card-text"><%=act%></p>  
                                        <%}%>
                                    </div>                  
                                </div>

                            </div>
                            <%}%>
                        </div>



                        <!--     <h3>Nombre Producto</h3>
                             <input type="text" name="prod_nombre">
     
                             <h3>Precio Producto</h3>
                             <input type="text" name="prod_precio">
     
                             <h3>Estado del producto</h3>
                             <select name="prod_estado">
                                 <option value="1">Activo</option>
                                 <option value="2">Inactivo</option>    
                             </select>
     
                             <h3>Cantidad producto</h3>
                             <input type="text" name="prod_cant">
     
                             <button>Registar</button>
                             <input type="hidden" value="1" name="valor">-->
                    </form>

                    <%
                        if (request.getAttribute("mensajeError") != null) { %>
                    ${mensajeError}

                    <%} else {%>
                    ${mensajeExito}        
                    <%}%>


                </div>


                <!--Administrar mesa-->
                <div class="ve_me" id="ve_me">

                    <h1>Consulta de las mesas</h1>
                    <form method="POST" action="Producto" class="formm" id="formm">
                        <div class="cards_">
                            <%
                                MesaVO mesaVO = new MesaVO();
                                MesaDAO mesaDAO = new MesaDAO();

                                ArrayList<MesaVO> listarMesa = mesaDAO.listar();

                                for (int i = 0; i < listarMesa.size(); i++) {
                                    mesaVO = listarMesa.get(i);
                            %>        
                            <div>  
                                <div class="card text-bg-dark mb-3" style="width: 18rem; height: 15rem !important;" >
                                    <div class="card-header">
                                        <input type="hidden" value="<%=mesaVO.getId_mesa()%>">
                                        <h3>Número mesa: <%=mesaVO.getMesa_numero()%></h3>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">Estado:</p>
                                        <%
                                            if (mesaVO.getMesa_estado().equals("1")) {
                                                String act = "Activa";
                                        %>                                  
                                        <p class="card-text"><%=act%></p>  
                                        <%} else if (mesaVO.getMesa_estado().equals("2")) {
                                            String act = "Inactivo";
                                        %>
                                        <p class="card-text"><%=act%></p>  
                                        <%}%>
                                    </div>
                                    <ul class="text-end">
                                        <input type="hidden" name="id" value="<%=mesaVO.getId_mesa()%>">
                                        <button class="btn btn-outline-light bu">Editar</button>
                                        <input type="hidden"  name="valor" value="3">
                                    </ul>                    
                                </div>

                            </div>
                            <%}%>
                        </div>
                    </form>
                </div>

                <div class="pagar" id="pagar">
                    <h1>Pagar pedidos</h1>
                    <div class="cards_p">
                        <%
                            PagarVO pagVO = new PagarVO();
                            PagarDAO pagDAO = new PagarDAO();

                            ArrayList<PagarVO> listarPedido = pagDAO.listar();
                            for (int i = 0; i < listarPedido.size(); i++) {
                                pagVO = listarPedido.get(i);
                        %>       


                        <div class="card text-bg-dark mb-3" style="width: 18rem; height: 15rem !important;" >
                            <form action="" method="post">
                                <div class="card-header">
                                    <input type="hidden" value="<%=pagVO.getId_pedido()%>">
                                    <h3 ><%=pagVO.getClienteFK()%></h3>
                                </div>
                                <div class="card-body" id="cardsi">                            
                                    <p class="card-text"><%=pagVO.getFecha()%><p>  
                                        <%
                                            if (pagVO.getPedido_estado().equals("1")) {
                                                String estate = "Por pagar";
                                        %>

                                    <p class="card-text"><%=estate%></p>
                                    <%}%>
                                    <ul class="text-end">
                                        <button class="btn btn-outline-light bu">Pagar</button>
                                        <input type="hidden"  name="valor" value="1">
                                    </ul>  
                                </div>

                            </form>
                        </div>
                        <%}%>  
                    </div>
                </div>
            </div>
        </section>
        <script src="assets/js/cajero.js" type="text/javascript"></script>
    </body>
</html>
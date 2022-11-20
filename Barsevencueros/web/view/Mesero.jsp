
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%-- 
    Document   : Mesero
    Created on : 23/07/2022, 05:07:47 PM
    Author     : David
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Sesiones.jsp" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="assets/css/ViewMesero.css" rel="stylesheet" >
        <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>

        <title>Bar 7 cueros</title>
         <link rel="icon" type="image/png" href="assets/img/logocolor.png">
    </head>
    <body>
        <section id="mesero__">
            <nav id="nav" class="navbar navbar-dark bg-dark">
                <div id="log__">
                    <img src="assets/img/logocolor.png" alt=""/>
                </div>
                <div id="hamb__">
                    <i id="menu" class="fa-solid fa-bars"></i>
                </div>
                <div id="options2" class="options2">

                    <ul> 
                        <li id="li2"><a href="cliente.jsp">Registrar cliente</a></li>
                        <li id="li2"><a href="listarCliente.jsp">Ver clientes</a></li>
                        <li id="li2"><a id="li4" style="color: white;">Registrar productos</a></li>
                        <li id="li2"><a id="li3" style="color: white;">Ver productos</a></li>
                        <li id="li2"><a id="vent" class="vent" href="Pedido?menu=NuevaVenta&accion=default" target="myFrame">Tomar pedido</a></li>
                    </ul>
                </div>

                <form method="post" action="Sesiones" id="out_">
                    <div class="salr" id="salr">
                        <button type="submit" value="CerrarSesion" class="btn btn-outline-light" id="kik" ><i class="fa-solid fa-right-from-bracket" id="salir_"></i>SALIR</button>
                    </div>    
                </form>


                <div class="ver_p" id="ver_p">
                    <div class="product_list" style="width: 100vw; height: 100vh; background-color: white; margin-top: 1%">
                        <div id="titlep">
                            <h1 style="display: flex; justify-content: center; font-family: sans-serif; margin-top: 2%" >Productos</h1>
                            <div class="error" style="    display: flex; justify-content: center; align-items: center;">
                                <div id="MError">
                                    <%                                    if (request.getAttribute("mensError") != null) { %>
                                    <div class="alert alert-success" role="alert">
                                        ${mensError}
                                    </div>


                                    <%} else {%>

                                    <div class="alert alert-success" role="alert">
                                        ${mensExito}
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <div id="cards_" style="display: flex; flex-direction: row; flex-wrap: wrap; margin-left: 9%; gap: 5%; width: 98%; ">
                            <%
                                ProductoVO prodVO = new ProductoVO();
                                ProductoDAO prodDAO = new ProductoDAO();
                                ArrayList<ProductoVO> listarProducto = prodDAO.listar();

                                for (int i = 0; i < listarProducto.size(); i++) {
                                    prodVO = listarProducto.get(i);

                            %>

                            <div class="ver_p1" id="ver_p1">
                                <div class="card text-white bg-dark mb-3 " style="width: 15rem; max-height: 18em; ">
                                    <form method="post" action="Producto">
                                        <input type="hidden" name="prod_id" value="<%=prodVO.getId_producto()%>">
                                        <div class="card-header border-light mb-3 text-center"><h3><%=prodVO.getProducto_nombre()%></h3></div>

                                        <div class="card-body">
                                            <h5 class="card-title border-light mb-3"><%=prodVO.getProducto_precio()%></h5>
                                            <h5 class="card-title border-light mb-3"><%= prodVO.getProducto_cantidad()%></h5>
                                            <%
                                                if (prodVO.getProducto_estado().equals("1")) {
                                                    String act = "Activo";
                                            %>  
                                            <p class="card-text border-light mb-3"><%=act%></p>
                                            <%}%>
                                        </div>

                                    </form>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>


                        <div class="reg_p" id="reg_p" style="width: 100vw; height: 100vh; background-color: white" >
                            <div id="title" style="display: flex; justify-content: center; margin-top: 8%; font-family: sans-serif;">
                        <h1> <i id="p_ri" class="fa-solid fa-champagne-glasses"></i> Nuevo producto</h1></div>
                        <form method="POST" action="p" id="p" style="margin: auto; margin-top: 2%; display: flex; width: 35%; flex-direction: column; justify-content: center;">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-default">Nombre producto:</span>
                            <input type="text" name="prod_nombre"  class="form-control">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-default"> Producto precio:</span>
                            <input type="text" name="prod_precio"  class="form-control">
                        </div>        
                        <input type="hidden" name="prod_estado" value="1">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-default">Cantidad producto:</span>
                            <input type="text" name="prod_cant"  class="form-control">
                        </div>
                        <button class="btn btn-outline-success">Registrar</button>
                        <input type="hidden" value="4" name="valor">
                    </form>
                    <div class="error">
                        <%
                        if (request.getAttribute("mensaError") != null) { %>
                        ${mensaError}

                        <%} else {%>
                        ${mensaExito}        
                        <%}%>     

                    </div>

                </div>       


            </nav>
            <hr id="hr">
            <div id="options" class="options">

                <ul> 
                    <li id="li"><a href="cliente.jsp">Registrar cliente</a></li>
                    <li id="li"><a href="listarCliente.jsp">Ver clientes</a></li>



                </ul>
            </div>

            <div>
                <iframe name="myFrame" style="height: 100vh; width: 100vw; border: none">

                </iframe>
            </div>

        </section>
        <script src="assets/js/Mesero.js" type="text/javascript"></script>
    </body>
</html>

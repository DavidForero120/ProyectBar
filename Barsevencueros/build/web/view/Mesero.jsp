
<%-- 
    Document   : Mesero
    Created on : 23/07/2022, 05:07:47 PM
    Author     : 57314
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

        <title>MWelcome</title>
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
                    <li id="li2"><a href="#">Ver productos</a></li>
                    <li id="li2"><a id="vent" href="Pedido?menu=NuevaVenta&accion=default" target="myFrame">Tomar pedido</a></li>

                </ul>
            </div>

            </nav>
            <hr id="hr">
            <div id="options" class="options">

                <ul> 
                    <li id="li"><a href="cliente.jsp">Registrar cliente</a></li>
                    <li id="li"><a href="listarCliente.jsp">Ver clientes</a></li>
                    <li id="li"><a href="#">Ver productos</a></li>
                    <li id="li"><a href="Pedido?menu=NuevaVenta&accion=default" target="myFrame">Tomar pedido</a></li>

                </ul>
            </div>

            <div>
                <iframe name="myFrame" style="height: 600px; width: 100vw; border: none">

                </iframe>
            </div>
        </section>
        <script src="assets/js/Mesero.js" type="text/javascript"></script>
    </body>
</html>

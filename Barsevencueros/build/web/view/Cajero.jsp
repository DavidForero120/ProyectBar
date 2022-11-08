<%-- 
    Document   : Cajero
    Created on : 23/07/2022, 05:07:28 PM
    Author     : David
--%>

<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloDAO.PedidoDAO"%>
<%@page import="ModeloVO.PedidoVO"%>
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
            <button class="kik"> <a id="vp" ><i class="fa-solid fa-wine-bottle"></i>Pagar Pedido</a></button>     
            <button class="kik"> <a id="vm" ><i class="fa-solid fa-table"></i>Administrar Mesa</a></button>
        </div>
        <div class="salr" id="salr">
            <button class="kik"> <a id="sl" href="">Cerrar Sesión</a></button>
        </div>
    </div>

        <div class="partder" id="partder">
            <div class="ve_p" id="ve_p">
                <h1>Registro de Productos</h1>
        
        <form method="POST" action="Producto" class="formm" id="formm">
                
            <h3>Nombre Producto</h3>
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
            <input type="hidden" value="1" name="valor">
        </form>
        
        <%
            if (request.getAttribute("mensajeError") != null) { %>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}        
        <%}%> 
        
        <table class="table table-striped-columns" id="tabe">
            <tr>
                <td>ID</td>
                <td>Nombre</td>
                <td>Precio</td>
                <td>Estado</td>
             
            </tr>
            <%
                ProductoVO prodVO = new ProductoVO();
                ProductoDAO prodDAO = new ProductoDAO();
                
                ArrayList<ProductoVO> listarProducto = prodDAO.listar();
                
                for(int i =0;i<listarProducto.size();i++){
                    prodVO = listarProducto.get(i);
            %>
            <tr>
                <td><!--<%=prodVO.getId_producto()%>--></td>
                <td><!--<%=prodVO.getProducto_nombre()%>--></td>
                <td><!--<%=prodVO.getProducto_precio()%>--></td>
                <td><!--<%=prodVO.getProducto_estado()%>--></td>
               
            </tr>
            <%}%> 
        </table>
            </div>
            
    </div> 


<!--Administrar mesa-->
            <div class="ve_me" id="ve_me">
                <hr id="hr">
        <div id="container-img">
            <div class="container-main">
                <div class="main-form">
                    <div class="form-mesa">
                        <form method="POST" action="Mesa" class="formmm">
                            <h2 class="title-reg">Registro de Mesa</h2>
                            <div class="input-group mb-3">
                                <span class="input-group-text" >Numero de Mesa :</span>
                                <input type="text" name="numero" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">                              
                            </div>
                            <select name="estado" id="boyo" class="form-select form-select-sm" aria-label=".form-select-sm example">
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
                        <!--<%            if (request.getAttribute("mensajeError") != null) { %>
                        ${mensajeError}

                        <%} else {%>
                        ${mensajeExito}        
                        <%}%>-->
                        
                    </div>
                        <hr id="hr">
                        
                    <div class="shows-registers">
                        <div id="titulo_">
                            <h3>Mesas Registradas</h3>
                        </div>
                        <div id="tabla_">
                            <table class="table table-striped-columns">
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
                                    <td><!--<%=mesaVO.getMesa_numero()%>--></td>
                                    <td><!--<%=mesaVO.getMesa_estado()%>--></td>
                                </tr>
                                <%}%>
                            </table>
                        </div>
                    </div>
                    <hr id="hr">
                    <div class="query-mesa">
                        <form method="post" action="Mesa" class="formmm" >
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
                                <%}%>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
            </div>


    </section>
    <script src="assets/js/cajero.js" type="text/javascript"></script>
</body>
</html>

<%-- 
    Document   : actualizarProducto
    Created on : 11/11/2022, 09:21:57 PM
    Author     : 57314
--%>

<%@page import="ModeloVO.ProductoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link href="assets/css/actualizarProducto.css" rel="stylesheet" type="text/css"/>
        <title>Actualizar</title>
        <link rel="icon" type="image/png" href="assets/img/bizbar.png">
    </head>
    <body>

        <%
            ProductoVO prodVO = (ProductoVO) request.getAttribute("datosProducto");

            if (prodVO != null) {
        %>
        <div class="nav"> <div class="log"><img src="assets/img/logocolor.png" alt=""/></div> 
            <div class="but">
                <form method="post" action="Usuario">
                    <button class="btn btn-light"> <i class="fa-solid fa-right-from-bracket"></i>Volver</button>
                    <input type="hidden" name="valor" value="6">
                </form>
            </div>

            <div class="container_">
                <div><h1>Actualizar Producto</h1></div>
                <form method="post" action="p" id="form">


                    <input type="hidden" name="prod_id" value="<%=prodVO.getId_producto()%>">
                    <div class="input-group">
                        <span class="input-group-text">Nombre producto:</span>
                        <input type="text" name="prod_nombre" value="<%=prodVO.getProducto_nombre()%>"  aria-label="First name" class="form-control" required>
                    </div>

                    <div class="input-group">
                        <span class="input-group-text">Precio producto:</span>
                        <input type="text" name="prod_precio" value="<%=prodVO.getProducto_precio()%>" aria-label="First name" class="form-control" required>
                    </div>

                    <div class="input-group">
                        <span class="input-group-text">Cantidad producto:</span>
                        <input type="text" name="prod_cant" value="<%=prodVO.getProducto_cantidad()%>" aria-label="First name" class="form-control" required>
                    </div>

                    <div class="input-group mb-3">
                        <label class="input-group-text" for="inputGroupSelect01">Estado:</label>
                        <select  name="prod_estado" class="form-select" id="inputGroupSelect01">
                            <option value="1">Activar</option>
                            <option value="2">Eliminar</option>
                        </select>
                    </div>
                    <div>
                        <button class="btn btn-outline-success" >Actualizar</button>
                        <input type="hidden" name="valor" value="2" >
                    </div>
                </form>
            </div>

            <%}%>

    </body>
</html>

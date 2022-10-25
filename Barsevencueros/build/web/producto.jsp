<%-- 
    Document   : producto
    Created on : 3/08/2022, 08:19:42 PM
    Author     : alrod
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto nuevo</title>
    </head>
    <body>
        <h1>Registro de Productos</h1>
        
        <form method="POST" action="Producto">
                
            <h3>Nombre Producto</h3>
            <input type="text" name="prod_nombre">
            
            <h3>Precio Producto</h3>
            <input type="text" name="prod_precio">
            
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
        
        <table class="table table-striped-columns">
            <tr>
                <td>ID</td>
                <td>Nombre</td>
                <td>Precio</td>
                <td>Estado</td>
                <td>Cantidad</td>
            </tr>
            <%
                ProductoVO prodVO = new ProductoVO();
                ProductoDAO prodDAO = new ProductoDAO();
                
                ArrayList<ProductoVO> listarProducto = prodDAO.listar();
                
                for(int i =0;i<listarProducto.size();i++){
                    prodVO = listarProducto.get(i);
            %>
            <tr>
                <td><%=prodVO.getId_producto()%></td>
                <td><%=prodVO.getProducto_nombre()%></td>
                <td><%=prodVO.getProducto_precio()%></td>
                <td><%=prodVO.getProducto_estado()%></td>
                <td><%=prodVO.getProducto_cantidad()%></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>

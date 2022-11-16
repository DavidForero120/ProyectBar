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
        <title>Actualizar</title>
    </head>
    <body>
        <form method="post" action="Usuario">
            <button>VOLVER</button>
            <input type="hidden" name="valor" value="6">
        </form>
        <%
            ProductoVO prodVO = (ProductoVO)request.getAttribute("datosProducto");
            
            if(prodVO!=null){
            %>
            <form method="post" action="p">
                <input type="hidden" name="prod_id" value="<%=prodVO.getId_producto()%>">
                <input type="text" name="prod_nombre" value="<%=prodVO.getProducto_nombre()%>" >
                <input type="text" name="prod_precio" value="<%=prodVO.getProducto_precio()%>" >
                <input type="text" name="prod_cant" value="<%=prodVO.getProducto_cantidad()%>" >
                <label>Estado producto:</label>
                <select name="prod_estado">
                    <option value="1">Activar</option>
                    <option value="2">Eliminar</option>
                </select>
                <div>
                    <button >Actualizar</button>
                    <input type="hidden" name="valor" value="2">
                </div>
            </form>
                 
            <%}%>
      
    </body>
</html>

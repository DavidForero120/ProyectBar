<%-- 
    Document   : pagar
    Created on : 15/11/2022, 06:24:04 PM
    Author     : alrod
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.desPedidoDAO"%>
<%@page import="ModeloVO.desPedidoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <title>Pagar</title>
    </head>
    <body>

        <%
            desPedidoVO desVO = (desPedidoVO) request.getAttribute("datosConsultados");
            if (desVO != null) {
            }%>

        <%
            String pedidoFK = desVO.getPedidoFK();
        %>
        <h1>Detalle de le venta</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Id producto</th>
                    <th scope="col">id pedido</th>
                    <th scope="col">cantidad</th>
                    <th scope="col">Sub total</th>
                    <th scope="col">Total</th>
                </tr>
            </thead>
        <%
            desPedidoDAO desDAO = new desPedidoDAO();
            ArrayList<desPedidoVO> listarPed = desDAO.listar(pedidoFK);
            for (int i = 0; i < listarPed.size(); i++) {
                desVO = listarPed.get(i);

        %>     
            <tbody>
                <tr>
                    <th><%=desVO.getId_productoFK()%></th>
                    <td><%=desVO.getPedidoFK()%></td>
                    <td><%=desVO.getCantidad_producto()%></td>
                    <td><%=desVO.getSubtotal()%></td>
                    <td><%=desVO.getSubtotal()%></td>
                </tr>
            </tbody>
             <%}%>
        </table>
       
        <form action="Usuario" method="post" id="froma">
            <div class="boton" id="boton">
                <button class="btn-enviarr">Volver</button>
                <input type="hidden" value="7" name="valor">
            </div>
        </form>

        <input type="submit" value="Factura" onclick="print()">
    </body>
</html>

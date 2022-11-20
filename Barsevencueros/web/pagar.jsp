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
         <link rel="icon" type="image/png" href="assets/img/logocolor.png">
    </head>
    <body>
        <form action="Usuario" method="post" id="froma">
            <div class="boton" id="boton">
                <button class="btn-enviarr">Volver</button>
                <input type="hidden" value="7" name="valor">
            </div>
        </form>
        <%
            desPedidoVO desVO = (desPedidoVO) request.getAttribute("datosConsultados");
            if (desVO != null) {
            }%>

        <%
            String pedidoFK = desVO.getPedidoFK();
        %>
        <h1>Detalle de le venta</h1>
        <form>
            <table class="table">
                <thead>
                    <tr>

                        <th scope="col">PRODUCTO</th>
                        <th scope="col">PRECIO</th>
                        <th scope="col">CANTIDAD</th>
                        <th scope="col">SUB TOTAL</th>                
                        <th scope="col">METODO DE PAGO</th>
                        <th scope="col">TOTAL</th>
                    </tr>
                </thead>
                <%
                    desPedidoDAO desDAO = new desPedidoDAO();
                    ArrayList<desPedidoVO> listarPed = desDAO.listar(pedidoFK);
                    for (int i = 0; i < listarPed.size(); i++) {
                        desVO = listarPed.get(i);

                %>  
                <input type="hidden" name="" value="<%=desVO.getPedidoFK()%>">
                
                <tbody>
                    <tr>                 
                        <td><%=desVO.getProducto_nombre()%></td>
                        <td><%=desVO.getProducto_precio()%></td>
                        <td><%=desVO.getCantidad_producto()%></td>
                        <td><%=desVO.getSubtotal()%></td>
                        <input type="hidden" name="" value="<%=desVO.getPedido_estado()%>">
                         <input type="hidden" name="" value="<%=desVO.getMetodo_pago()%>">
                        <%
                            if (desVO.getMetodo_pago().equals("2")) {
                                String tarjeta = "TARJETA";

                        %>                  
                        <td><%=tarjeta%></td>
                        <%} else if(desVO.getMetodo_pago().equals("1")){
                            String efectivo = "EFECTIVO";

                        %>
                        <td><%=efectivo%></td>
                        <%}%>
                        
                        <%
                        if(desVO.getMetodo_pago().equals("2")){
                            double total = desVO.getTotal();
                            double agregado = total * 0.05;
                            double pagar = (agregado + total);
                        
                        %>
                        <td><%=pagar%></td>
                        <%}else{

                        %>
                        <td><%=desVO.getTotal()%></td>
                        <%}%>
                    </tr>
                </tbody>
                <%}%>
            </table>

            <button>PAGAR</button>
        </form>

        <input type="submit" value="Factura" onclick="print()">
    </body>
</html>

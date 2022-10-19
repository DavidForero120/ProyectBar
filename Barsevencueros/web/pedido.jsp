<%-- 
    Document   : pedido
    Created on : 12/09/2022, 10:10:18 PM
    Author     : alrod
--%>

<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloDAO.desPedidoDAO"%>
<%@page import="ModeloVO.desPedidoVO"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.PedidoDAO"%>
<%@page import="ModeloVO.PedidoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Generar un pedido</h1>
        <select name="cliente">
                <option>Selecciona el Cliente</option>
                <%
                    ClienteVO cliVO = new ClienteVO();
                    ClienteDAO cliDAO = new ClienteDAO();
                    
                    ArrayList<ClienteVO> listaCliente = cliDAO.listar();
                    for(int i = 0; i<listaCliente.size();i++){
                        cliVO = listaCliente.get(i);
                    
                %>
                <option value="<%=cliVO.getId_cliente()%>"><%=cliVO.getCliente_nombre()%></option>
                <%}%>
            </select>
            <select name="producto">
                <option>Selecciona un producto</option>
                <%
                    ProductoVO prodVO = new ProductoVO();
                    ProductoDAO prodDAO = new ProductoDAO();
                    ArrayList<ProductoVO> listaProducto = prodDAO.listar();
                    
                    for(int i=0;i<listaProducto.size();i++){
                        prodVO = listaProducto.get(i);
                    
                %>
                <option value="<%=prodVO.getId_producto()%>"><%=prodVO.getProducto_nombre()%></option>
                <%}%>
            </select>
        <form action="Pedido" method="POST">
            
        </form>
        
        <form method="POST" action="">
            
            
            <table>
                <tr>
                    <td>ID producto</td>
                    <td>Producto</td>
                    <td>usuario</td>
                    <td>Cliente</td>
                    <td>Mesa</td>
                    <td>Estado</td>
                    <td>Valor Unidad</td>
                    <td>Sub total</td>
                    <td>Total</td>
                    <td>ID producto</td>
                
                </tr>
                <%
                PedidoVO pedVO = new PedidoVO();
                PedidoDAO pedDAO = new PedidoDAO();
                
                desPedidoVO desVO = new desPedidoVO();
                desPedidoDAO desDAO = new desPedidoDAO();
                ArrayList<desPedidoVO> listaPedido = desDAO.listar();
                
                for(int i=0;i<listaPedido.size();i++){
                    desVO = listaPedido.get(i);
            %>
                <tr>
                    <td><%=pedVO.getId_Pedido()%></td>
                    <td>Producto</td>
                    <td>usuario</td>
                    <td>Cliente</td>
                    <td>Mesa</td>
                    <td>Estado</td>
                    <td>Valor Unidad</td>
                    <td>Sub total</td>
                    <td>Total</td>
                    <td>ID producto</td>
                </tr>
                <%}%>
            </table>
            
        </form>
    </body>
</html>

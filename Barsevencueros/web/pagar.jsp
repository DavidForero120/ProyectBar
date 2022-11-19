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
        <title>Pagar</title>
    </head>
    <body>
    
       <!--%
            desPedidoVO desVO = (desPedidoVO)request.getAttribute("datosConsultados");
            desPedidoVO despVO = new desPedidoVO(); 
            desPedidoDAO desDAO = new desPedidoDAO();
            if(desVO!=null){
               
            }%-->
            
     <!-- ArrayList<desPedidoVO> listarDes = desDAO.listar();
                for(int i =0; i<listarDes.size(); i++){
                    despVO = listarDes.get(i);
            }
     -->
         <form method="post" action="desPedido">
                <input value="">
                <table border="1">
                    <thead>
                        <tr>
                            <th>producto id</th>
                            <th>pedido id  </th>
                            <th>cantidad producto </th>
                            <th>sub total </th>
                            <th>total</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <%
                    desPedidoVO desVO = new desPedidoVO();
                    desPedidoDAO desDAO = new desPedidoDAO();
                    ArrayList<desPedidoVO> listarp = desDAO.listar();
                    
                    for(int i =0; i< listarp.size(); i++){
                    desVO = listarp.get(i);
                    
                    %>
                    <tbody>
                        <tr>
                            <td><%=desVO.getId_productoFK()%></td>
                            <td><%=desVO.getPedidoFK()%></td>
                            <td><%=desVO.getCantidad_producto()%><!--%=desVO.getId_productoFK()%--></td>
                            <td><%=desVO.getSubtotal()%><!--%=desVO.getProducto_nombre()%--></td>
                            <td><%=desVO.getTotal()%><!--%=desVO.getCantidad_producto()%--></td>
                            <td><!--%=desVO.getSubtotal()%--></td>
                            <td><!--%=desVO.getTotal()%--></td>
                        </tr>
                         <%}%>
                    </tbody>
                                   
                </table>

                    <button >Actualizar</button>
                    <input type="hidden" name="valor" value="2">
              
            </form>
      <input type="submit" value="Imprimir" onclick="print()">
    </body>
</html>

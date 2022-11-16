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
    
       <%
            desPedidoVO desVO = (desPedidoVO)request.getAttribute("datosConsultados");
            desPedidoVO despVO = new desPedidoVO(); 
            desPedidoDAO desDAO = new desPedidoDAO();
            if(desVO!=null){
               
                
                
            %>
            <form method="post" action="desPedido">
                <input value="">
                <table border="1">
                    <thead>
                        <tr>
                            <th>usuario</th>
                            <th>usuario nombre</th>
                            <th>producto id</th>
                            <th>producto nombre</th>
                            <th>cantidad</th>
                            <th>sub total</th>
                            <th>total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td><%=desVO.getId_productoFK()%></td>
                            <td><%=desVO.getProducto_nombre()%></td>
                            <td><%=desVO.getCantidad_producto()%></td>
                            <td><%=desVO.getSubtotal()%></td>
                            <td><%=desVO.getTotal()%></td>
                        </tr>
                    </tbody>
                </table>

                    <button >Actualizar</button>
                    <input type="hidden" name="valor" value="2">
                </div>
            </form>
               
            <%}%>
     <!-- ArrayList<desPedidoVO> listarDes = desDAO.listar();
                for(int i =0; i<listarDes.size(); i++){
                    despVO = listarDes.get(i);
            }
     -->
        
        <h1>Hello World!</h1>
    </body>
</html>

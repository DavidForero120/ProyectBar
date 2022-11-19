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
            desPedidoVO desVO = (desPedidoVO)request.getAttribute("datosConsultados");
            desPedidoVO despVO = new desPedidoVO(); 
            desPedidoDAO desDAO = new desPedidoDAO();
            if(desVO!=null){
               
            %>
            <input value="<%=desVO.getPedidoFK()%>">
            
            <%}%>
     <!-- ArrayList<desPedidoVO> listarDes = desDAO.listar();
                for(int i =0; i<listarDes.size(); i++){
                    despVO = listarDes.get(i);
            }
     -->
     <form action="Usuario" method="post" id="froma">
                <div class="boton" id="boton">
                    <button class="btn-enviarr">Volver</button>
                    <input type="hidden" value="7" name="valor">
                </div>
        </form>
         
      <input type="submit" value="Imprimir" onclick="print()">
    </body>
</html>

<%-- 
    Document   : actualizarMesa
    Created on : 14/09/2022, 12:46:49 AM
    Author     : alrod
--%>

<%@page import="ModeloVO.MesaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!-- CSS only -->
        
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link href="assets/css/UpdateMesa.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar</title>
    </head>
    <body>
         <nav>
            <div class="partizq" id="partizq">
                <div class="logo_admin">
                    <img class="imagen-main" src="assets/img/logocolor.png" alt="logo" class="log_a"/> </div>
                <form method="post" action="Usuario">
                    <button class="btn btn-light"> <i class="fa-solid fa-right-from-bracket"></i>Volver</button>
                    <input type="hidden" name="valor" value="6">
                </form>
           
             
            </div>
        </nav> 
        <section class="main-mesa">
        <h1>Actualizar mesa</h1>
        
        <%
            MesaVO mesaVO = (MesaVO)request.getAttribute("datosConsultados");
            
            if(mesaVO!=null){
        %>
        <div class="reg_t" id="reg_t">
            <div class="user_r">
                    <form method="post" action="Mesa" class="form">
                        
                        <input type="hidden" name="id" value="<%=mesaVO.getId_mesa()%>">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Numero Mesa</span>
                            <input type="text" class="form-control" name="numero" placeholder="<%=mesaVO.getMesa_numero()%>" required>
                        </div>
                        
                        <div class="input-group mb-3">
                            <label class="input-group-text">Estado Mesa</label>
                            <select name="estado" class="form-select">
                                <option value="1">Activo</option>
                                <option value="2">Eliminar</option>
                            </select>
                        </div>
                        
                        <div id="button">
                            <button class="btn btn-outline-success">Actualizar</button>
                            <input type="hidden" value="2" name="valor">
                        </div>
                    </form>

                    <%}%>
            </div>
            
        </div>
        </section>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>

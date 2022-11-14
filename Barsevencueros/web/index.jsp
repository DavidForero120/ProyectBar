<%-- 
    Document   : index
    Created on : 23/07/2022, 04:55:56 PM
    Author     : 57314
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/index.css" rel="stylesheet" type="text/css"/>
        <title>Bar7Cueros</title>
        <link rel="icon" type="image/png" href="assets/img/logocolor.png">
    </head>
    <body>
        <!-- cambios -->
        <div id="grid-container" >     
            <div class="contenido">
                
                <div class="formulario" id="filter">  
                    <form action="Usuario" method="POST">
                        <h1>Iniciar sesión</h1>
                        <div id="input">
                            <div id="labe">
                                <label>Usuario:</label>
                            </div>
                            <input type="text" name="usuario_nombre" required="">
                        </div>
                        <div id="input">
                            <div id="labe">
                                <label>Contraseña:</label>
                            </div>
                            <input type="password" name="usuario_password" required="">
                        </div>
                        <div id="input">
                            <button>Ingresar</button>
                            <input type="hidden" value="1" name="valor" >
                        </div>
                    </form>
                    <div class="error">
                    <%
                        if (request.getAttribute("Error") != null) {%>
                        ${Error}
                        <%} else {%>
                        ${Exito}
                        <%}
                    %>
                    </div>
                </div>
                
            </div>
        </div>
            <script src="js/acciones.js"></script>
    </body>
</html>

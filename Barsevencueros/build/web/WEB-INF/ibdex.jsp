<%-- 
    Document   : index
    Created on : 23/07/2022, 04:55:56 PM
    Author     : 57314
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/index.css" rel="stylesheet" type="text/css"/>
        <title>Inicio</title>
    </head>
    <body>
        <div class="contenido">
            <h1>Iniciar Sesion</h1>
            <div class="formulario">
                <form action="Usuario" method="POST">
                    <div>
                        <label>Usuario:</label>
                        <input type="text" name="usuario_nombre">
                    </div>
                    <div>
                        <label>Contraseña</label>
                        <input type="text" name="usuario_password">
                    </div>
                    <div>
                        <button>Iniciar</button>
                        <input type="hidden" value="1" name="valor">
                    </div>

                </form>
            </div>
            <%
                if (request.getAttribute("Error") != null) {%>

            ${Error}

            <%} else {%>

            ${Exito}

            <%}
            %>
        </div>



    </body>
</html>

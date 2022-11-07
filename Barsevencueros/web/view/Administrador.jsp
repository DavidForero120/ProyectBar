<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/admin.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
        <title>Bar 7 cueros</title>
    </head>
    <body>
        
        <div class="container_admin">
            <div class="nav_admin">
                <div class="logo_admin">
                  <img src="assets/img/logocolor.png" alt="logo" class="log_a"/>
                </div>
                <div class="opcion_a">
                        <div class="option_"><a id="v_t"><i class="fa-solid fa-user"></i>Ver trabajadores</a></div>
                        <div class="option_"><a id="r_t"><i class="fa-solid fa-address-book"></i>Registrar trabajadores</a></div>
                        <div class="option_"><a id="v_m"><i class="fa-solid fa-table"></i>Ver mesas</a></div>
                        <div class="option_"><a id="r_m"><i class="fa-solid fa-table"></i>Agregar mesa</a></div>
                        <div class="option_"><a id="v_p"><i class="fa-solid fa-wine-glass"></i>Ver productos</a></div>
                        <div class="option_"><a id="r_p"><i class="fa-solid fa-wine-bottle"></i>Registrar productos</a></div>
                        <div class="option_"><a id="reporte"><i class="fa-solid fa-book"></i>Reporte de ventas</a></div>
                </div>
            </div>
            <div class="ver_t" id="ver_t">
                trabajador
            </div>
            <div class="reg_t" id="reg_t">
                trabajadorr
            </div>
            <div class="ver_m" id="ver_m">
                mesas
            </div>
            <div class="reg_m" id="reg_m">
                 r mesas
            </div>
            <div class="ver_p" id="ver_p">
                productos
           </div>
           <div class="reg_p" id="reg_p">
            r productos
            </div>
            <div class="report" id="report">
                reporte
            </div>
        </div>
        <script src="assets/js/admin.js" type="text/javascript"></script>
    </body>
</html>
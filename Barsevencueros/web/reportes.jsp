<%-- 
    Document   : reportes
    Created on : 16/11/2022, 05:47:32 PM
    Author     : 57314
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
         <link rel="icon" type="image/png" href="assets/img/logocolor.png">
        <link href="assets/css/grafica.css" rel="stylesheet" type="text/css"/>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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
        <div class="alert alert-danger d-flex align-items-center" role="alert">
        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
        <div class="ms">Intentalo de nuevo los primeros del mes</div>
      </div>
    <h1>Venta por mes</h1>
    <div>
        <link rel="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"type="text/css" />
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>

    <div class="container">
      <div>
        <canvas id="myChart"></canvas>
      </div>
    </div>

    </div>
    <script src="assets/js/grafica.js" type="text/javascript"></script>
    </body>
</html>

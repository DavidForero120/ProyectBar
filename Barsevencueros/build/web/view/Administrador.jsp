<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloDAO.MesaDAO"%>
<%@page import="ModeloVO.MesaVO"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/admin.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
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
                    <div class="option2_">
                        <form method="post" action="Sesiones" id="out_">
                            <button type="submit" value="CerrarSesion" class="btn btn-outline-light" ><i class="fa-solid fa-right-from-bracket" id="salir_"></i>SALIR</button>
                        </form>
                    </div>
                </div>

            </div>
            <div class="ver_t" id="ver_t">
                <h1 id="worker">Trabajadores</h1>
                <%                    if (request.getAttribute("Error") != null) { %>
                <div class="alert alert-success" role="alert">
                    ${Error}
                </div>
                <%} else {%>
                <div class="alert alert-success" role="alert">
                    ${Exito}
                </div>
                <%}%>
                <div class="cards_">

                    <%                    UsuarioVO usuVO = new UsuarioVO();
                        UsuarioDAO usuDAO = new UsuarioDAO();

                        ArrayList<UsuarioVO> listarUsuario = usuDAO.listar();

                        for (int i = 0; i < listarUsuario.size(); i++) {
                            usuVO = listarUsuario.get(i);

                    %>          
                    <div>  
                        <form method="post" action="Usuario">
                            <div class="card text-bg-dark mb-3" style="width: 18rem; height: 15rem !important;" >
                                <div class="card-header border-light mb-3">
                                    <input type="hidden" name="id_usuario" value="<%=usuVO.getId_usuario()%>">

                                    <h3><%=usuVO.getUsuario_nombre()%> <%=usuVO.getUsuario_apellido()%></h3>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">Rol:</p>
                                    <%
                                        if (usuVO.getId_rolFK().equals("1")) {
                                            String admin = "Administrador";
                                    %>                                   
                                    <p class="card-text"><%=admin%></p>   
                                    <%} else if (usuVO.getId_rolFK().equals("2")) {
                                        String caje = "Cajero";
                                    %>
                                    <p class="card-text"><%=caje%></p>  
                                    <%} else {
                                        String mese = "Mesero";
                                    %>
                                    <p class="card-text"><%=mese%></p>  
                                    <%}%>
                                </div>
                                <ul class="text-end">
                                    <button class="btn btn-outline-light bu">Editar</button>
                                    <input type="hidden" name="valor" value="4">
                                </ul>                    
                            </div>
                        </form>
                    </div> 
                    <%}%>

                </div>


            </div>
            <div class="reg_t" id="reg_t">
                <div class="user_r">
                    <h1>Registrar nuevo trabajador</h1>
                    <form action="Usuario" method="post" class="form" id="usuario">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Nombre:</span>
                            <input type="text" name="usuario_nombre" class="form-control"  >

                        </div>
                        <div id="name_i" class="name_i">
                            <p><i class="fa-solid fa-triangle-exclamation" id="err"></i>¡¡El campo solo acepta letras, minimo 4 letras!! </p>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Apellido:</span>
                            <input type="text" name="usuario_apellido" class="form-control" >
                        </div>
                        <div id="ape_e" class="ape_e">
                            <p><i class="fa-solid fa-triangle-exclamation" id="err"></i>¡¡El campo solo acepta letras, minimo 5 letras!!</p>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Contraseña:</span>
                            <input type="password" name="usuario_password" class="form-control" id="password">
                        </div>
                        <div id="contra" class="contra">
                            <p><i class="fa-solid fa-triangle-exclamation" id="err"></i>¡¡Minimo 5 caracteres y puede contener puntos!!</p>
                        </div>
                        <input type="hidden" name="usuario_estado" value="1">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Confirmar contraseña:</span>
                            <input type="password" name="password2"  class="form-control" id="password2" aria-describedby="basic-addon3">
                        </div>

                        <div id="incorrecta" class="incorrecta">
                            <p><i class="fa-solid fa-triangle-exclamation" id="err"></i>¡¡Las contraseñas deben ser iguales!!</p>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="inputGroupSelect01">Elegir tipo de trabajador:</label>
                            <select name="rol" class="form-select" id="inputGroupSelect01">
                                <option value="1" >Administrador</option>
                                <option value="2" >Cajero</option>
                                <option value="3" >Mesero</option>
                            </select>
                        </div>

                        <div id="button">
                            <button class="btn btn-outline-success">Registrar</button><br>
                            <input type="hidden" value="2" name="valor">
                        </div>

                    </form>
                    <div id="MError">
                        <%
                            if (request.getAttribute("Error") != null) { %>
                        <div class="alert alert-success" role="alert">
                            ${Error}
                        </div>


                        <%} else {%>

                        <div class="alert alert-success" role="alert">
                            ${Exito}
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="ver_m" id="ver_m">
                <h1 id="worker">Mesas</h1>
                <div id="MError">
                    <%
                            if (request.getAttribute("menssegeError") != null) { %>
                    <div class="alert alert-success" role="alert">
                        ${menssegeError}
                    </div>


                    <%} else {%>

                    <div class="alert alert-success" role="alert">
                        ${menssegeExito}
                    </div>
                    <%}%>
                </div>
                <form method="post" action="Mesa" >


                    <div class="cards_">
                        <%
                            MesaVO mesaVO = new MesaVO();
                            MesaDAO mesaDAO = new MesaDAO();

                            ArrayList<MesaVO> listarMesa = mesaDAO.listar();

                            for (int i = 0; i < listarMesa.size(); i++) {
                                mesaVO = listarMesa.get(i);
                        %>         
                        <div>  
                            <div class="card text-bg-dark mb-3" style="width: 18rem; height: 15rem !important;" >
                                <div class="card-header border-light mb-3" >
                                    <input type="hidden" value="<%=mesaVO.getId_mesa()%>">
                                    <h3>Número mesa: <%=mesaVO.getMesa_numero()%></h3>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">Estado:</p>
                                    <%
                                        if (mesaVO.getMesa_estado().equals("1")) {
                                            String act = "Activa";
                                    %>                                   
                                    <p class="card-text"><%=act%></p>   
                                    <%} else if (mesaVO.getMesa_estado().equals("2")) {
                                        String act = "Inactivo";
                                    %>
                                    <p class="card-text"><%=act%></p>  
                                    <%}%>
                                </div>
                                <ul class="text-end">
                                    <input type="hidden" name="id" value="<%=mesaVO.getId_mesa()%>">
                                    <button class="btn btn-outline-light bu">Editar</button>
                                    <input type="hidden"  name="valor" value="3">
                                </ul>                    
                            </div>

                        </div> 
                        <%}%>
                    </div>
                </form>


            </div>
            <div class="reg_m" id="reg_m">

                <form method="POST" action="Mesa" id="mesa" >
                    <div class="me">  
                        <div class="card text-bg-dark mb-3" style="width: 20rem; height: 18rem !important;" id="card_mesa" >
                            <div class="card-header text-center border-light mb-3">
                                <h1>Nueva mesa</h1>
                            </div>
                            <div class="card-header text-left ">             
                                <label id="num_">Numero de Mesa:</label>
                                <input type="text" name="numero" class="form-control" id="mesa_n" >                  
                                <div id="mesa_i" class="mesa_i">
                                    <p>¡solo digitar numeros, debe contener minimo un número!</p>
                                </div>
                            </div>
                            <input type="hidden" name="estado" value="1"> 
                            <div class="text-end" id="end_">

                                <button class="btn btn-outline-light bu" >Registrar</button>
                                <input type="hidden" value="1" name="valor">

                            </div>                    
                        </div>

                    </div>

                </form>
                <div class="error">
                    <%            if (request.getAttribute("mensajeError") != null) { %>
                    ${mensajeError}

                    <%} else {%>
                    ${mensajeExito}        
                    <%}%>     

                </div>


            </div>
            <div class="ver_p" id="ver_p">
                <div class="product_list">
                    <div id="titlep">
                        <h1>Productos</h1>
                    </div>
                    <div id="cards_">
                        <%
                        ProductoVO prodVO = new ProductoVO();
                        ProductoDAO prodDAO = new ProductoDAO();
                        ArrayList<ProductoVO> listarProducto = prodDAO.listar();

                        for (int i = 0; i < listarProducto.size(); i++) {
                            prodVO = listarProducto.get(i);
                            
                            %>
                       
                    <div class="ver_p1" id="ver_p1">
                        <div class="card text-white bg-dark mb-3 " style="width: 15rem; max-height: 18em; ">
                            <form method="post" action="Producto">
                            <input type="hidden" name="prod_id" value="<%=prodVO.getId_producto()%>">
                            <div class="card-header border-light mb-3 text-center"><h3><%=prodVO.getProducto_nombre()%></h3></div>
                            <div class="card-body">
                                <h5 class="card-title border-light mb-3"><%=prodVO.getProducto_precio()%></h5>
                                <%
                                if(prodVO.getProducto_estado().equals("1")){
                                    String act = "Activo";
                                %>  
                                <p class="card-text border-light mb-3"><%=act%></p>
                                 <%}%>
                            </div>
                            <ul class="text-center">

                                <button class="btn btn-outline-light ">Editar</button>
                                <input type="hidden" name="valor" value="3">

                            </ul>  
                            </form>
                        </div>
                    </div>
                           <%}%>
                    </div>
                </div>
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
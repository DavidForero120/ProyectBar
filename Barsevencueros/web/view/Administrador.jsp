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
                
                <form method="post" action="Usuario">
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
                    <div class="cards_">
                        <%                    UsuarioVO usuVO = new UsuarioVO();
                            UsuarioDAO usuDAO = new UsuarioDAO();

                            ArrayList<UsuarioVO> listarUsuario = usuDAO.listar();

                            for (int i = 0; i < listarUsuario.size(); i++) {
                                usuVO = listarUsuario.get(i);

                        %>          
                        <div>  
                            <div class="card text-bg-dark mb-3" style="width: 18rem; height: 15rem !important;" >
                                <div class="card-header">
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

                        </div> 
                        <%}%>
                    </div>
                    
                </form>
            </div>
            <div class="reg_t" id="reg_t">
                <div class="user_r">
                    <h1>Registrar nuevo usuario</h1>
                    <form action="Usuario" method="post" class="form" id="usuario">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Nombre:</span>
                            <input type="text" name="usuario_nombre" class="form-control"  >
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Apellido:</span>
                            <input type="text" name="usuario_apellido" class="form-control" >
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Contraseña:</span>
                            <input type="password" name="usuario_password" class="form-control" id="password">
                        </div>
                        <input type="hidden" name="usuario_estado" value="1">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Confirmar contraseña:</span>
                            <input type="password" name="password2"  class="form-control" id="password2" aria-describedby="basic-addon3">
                        </div>

                        <div id="incorrecta" class="incorrecta">
                            <p><i class="fa-solid fa-triangle-exclamation" id="err"></i> Las contraseñas deben ser iguales</p>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="inputGroupSelect01">Rol:</label>
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
                <form method="post" action="Mesa">
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
                                <div class="card-header">
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
                
                <form method="POST" action="Mesa">
                    <div>  
                        <div class="card text-bg-dark mb-3" style="width: 20rem; height: 18rem !important;" >
                            <div class="card-header text-center">
                                <h1>Nueva mesa</h1>
                                <label id="num_">Numero de Mesa: </label>
                                <input type="text" name="numero" class="form-control" >    
                            </div>
                            <div class="card-body">
                                <select name="estado" class="form-select form-select-sm" >
                                    <option value="1">Activo</option>
                                    <option value="2">Inactivo</option>           
                                </select>
                            </div>
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
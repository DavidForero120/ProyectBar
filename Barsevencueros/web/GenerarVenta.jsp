<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.MetodoPagoDAO"%>
<%@page import="ModeloVO.MetodoPagoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.MesaDAO"%>
<%@page import="ModeloVO.MesaVO"%>
<%@ taglib prefix="pedVO" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="assets/css/Pedido.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="d-flex">
            <div class="col-sm-5">
                <div class="card">
                    <div class="card-body"> 
                        <form action="Pedido?menu=NuevaVenta" method="POST">
                            <!--Cliente-->
                            <div class="form-group">
                                <label>Datos del Cliente</label>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">

                                    <input type="text" name="cliente_documento" value="${cliente.getNumero_documento()}" class="form-control" placeholder="Documento Cliente">
                                    <button>Consultar</button>
                                    <input type="hidden" name="accion" value="RegistroCliente" >
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" value="${cliente.getCliente_nombre()} ${cliente.getCliente_apellido()}" class="form-control" disabled="disabled">

                                </div>
                            </div>

                            <hr id="hr">
                            <!--producto-->
                            <div class="form-group">
                                <label>Datos Producto</label>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="id_producto" value="${pr.getId_producto()}" class="form-control" placeholder="Codigo Producto">
                                    <button>Consultar</button>
                                    <input type="hidden" name="accion" value="RegistrarProducto">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="nombreProducto" value="${pr.getProducto_nombre()}" class="form-control" disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <label class="input-group-text">Valor unitario</label>
                                    <input type="text" id="pre_" name="precioProd" value="$${pr.getProducto_precio()}" class="form-control" disabled="disabled">

                                </div>
                            </div>                       
                        </form>
                        <!--ID-CLIENTE -->


                        <form action="Pedido?menu=NuevaVenta" method="POST">                  
                            <div class="input-group flex-nowrap" id="can__">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="addon-wrapping">Cantidad producto</span>
                                </div>
                                <input id="cantidad" type="number" name="cantidad" value="1" class="form-control">
                            </div> 




                            <!-- MESA-->
                            <hr id="hr">
                            <label >Seleccione una mesa: </label>
                            



                            <!-- METODO DE PAGO-->
                            <hr id="hr">
                            <label>Metodo de pago:</label>
                            
                            <% 
                            RolVO rolVO = new RolVO();
                            RolDAO rolDAO = new RolDAO();
                            ArrayList<RolVO> listaRoles = rolDAO.listar(usuario);

                            for (int i = 0; i < listaRoles.size(); i++) 
                            {
                                rolVO = listaRoles.get(i);
                                
                            }
                        %> 
                            <hr id="hr">
                            <div class="form-group" id="agr">
                                <input id="agP" type="submit" name="accion" value="AgregarQ" class="btn btn-success"> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="card">
                    <div class="card-body">
                        <br>
                        <table class="table table-hover" >
                            form
                            <thead>                           
                                <tr>
                                    <th>Nro</th>
                                    <th>id_producto</th>
                                    <th>nombre_producto</th>
                                    <th>Cantidad</th>
                                    <th>Precio</th>
                                    <th>Subtotal</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <pedVO:forEach var="list" items="${lista}">
                                    <tr>
                                        <td>${list.getItem()}</td>
                                        <td>${list.getId_producto()}</td>
                                        <td>${list.getNombre_Producto()}</td>
                                        <td>${list.getCantidad_producto()}</td>
                                        <td>${list.getPrecio()}</td>
                                        <td>${list.getSubtotal()}</td>
                                        <td><button class="btn btn-success" id="agre__">Agregar</button><button class="btn btn-danger">Eliminar</button></td>
                                    </tr>
                                </pedVO:forEach>


                            </tbody>
                        </table>

                    </div
                    
                    <div class="input-group" id="tot_">
                        <label  class="input-group-text">Total a pagar:</label>
                        <input class="form-control" name="total" type="text"  value="${totalPaga}" disabled="disabled">
                    </div>
                    
                    <div class="card-footer d-flex">
                        <div class="col-sm-6">
                            <form method="POST" action="Pedido?menu=NuevaVenta">
                                <input type="hidden" name="id_usuario" value="<%=rolVO.getId_rol()%>">
                                <input type="hidden" name="idCliente" value="${cliente.getId_cliente()}">
                                <select id="mesa_" lass="form-control form-control-lg" name="metodoPago">
                                <%
                                    MetodoPagoVO MetodoPagoVO = new MetodoPagoVO();
                                    MetodoPagoDAO MetodoPagoDAO = new MetodoPagoDAO();

                                    ArrayList<MetodoPagoVO> listarMetodoPago = MetodoPagoDAO.listar();
                                    for (int i = 0; i < listarMetodoPago.size(); i++) {
                                        MetodoPagoVO = listarMetodoPago.get(i);
                                        if (MetodoPagoVO.getMetodo() == 1) {
                                            String date = "Efectivo";
                                %>
                                <option value="<%=MetodoPagoVO.getId_metodoPago()%>"><%=date%></option>
                                <%} else {
                                    String date1 = "Tarjeta";
                                %>
                                <option value="<%=MetodoPagoVO.getId_metodoPago()%>"><%=date1%></option>
                                <%}
                                    }%>
                            </select>
                            <select id="mesa_" lass="form-control form-control-lg" name="mesaFK">
                                <%
                                    MesaVO mesaVO = new MesaVO();
                                    MesaDAO mesaDAO = new MesaDAO();

                                    ArrayList<MesaVO> listarMesa = mesaDAO.listar();

                                    for (int i = 0; i < listarMesa.size(); i++) {
                                        mesaVO = listarMesa.get(i);
                                %>
                                <option value="<%=mesaVO.getId_mesa()%>"><%=mesaVO.getMesa_numero()%></option>
                                <%}%>
                            </select >
                                <button class="btn btn-success">Generar</button>
                                <input type="hidden"  name="accion" value="GenerarPedido">
                            </form>
                            <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
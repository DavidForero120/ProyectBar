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
        <title>JSP Page</title>
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
                                    <input type="text" name="precioProd" value="$${pr.getProducto_precio()}" class="form-control" disabled="disabled">

                                </div>
                                
                                <div class="col-sm-3 d-flex">
                                    <input type="text" name="stock" value="${pr.getProducto_cantidad()}" disabled="disabled">
                                </div>
                            </div>

                        </form>
                        <form action="Pedido?menu=NuevaVenta" method="POST">
                            <div class="col-sm-2 d-flex">
                                    <input type="number" name="cantidad" value="1" class="form-control">
                                </div>
                            <div class="form-group">
                                <input type="submit" name="accion" value="AgregarQ"> 
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
                            <thead>                           
                                <tr>
                                    <th>Nro</th>
                                    <th>id_producto</th>
                                    <th>nombre_producto</th>
                                    <th>Cantidad</th>
                                    <th>Precio</th>
                                    <th>Subtotal</th>
                                    <th>Total a Pagar</th>
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
                                    </tr>
                                </pedVO:forEach>
                                    <tr>
                            <input type="number" value="${totalPagar}" disabled="disabled">
                                    </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="card-footer d-flex">
                        <div class="col-sm-6">
                            <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta" class="btn btn-success">Generar Pedido</a>
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

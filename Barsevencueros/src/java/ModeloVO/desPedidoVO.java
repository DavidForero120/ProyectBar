/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;


/**
 *
 * @author Aprendiz
 */
public class desPedidoVO {
    private String id_productoFK, pedidoFK, subtotal, producto_nombre,producto_precio, pedido_estado, metodo_pago, id_usuarioFK, clienteFK, mesaFK, fecha;
    private int cantidad_producto;
    private double total;

    public desPedidoVO(String id_productoFK, String pedidoFK,int cantidad_producto,String subtotal, double total) {
        this.id_productoFK = id_productoFK;
        this.pedidoFK = pedidoFK;
        this.cantidad_producto = cantidad_producto;
        this.subtotal = subtotal;
        this.total = total;

    }
    public desPedidoVO(String pedidoFK, String id_productoFK, String producto_nombre,String producto_precio, int cantidad_producto, String subtotal, double total, String pedido_estado, String metodo_pago, String id_usuarioFK,String clienteFK, String mesaFK, String fecha ){
        this.pedidoFK = pedidoFK;
        this.id_productoFK = id_productoFK;
        this.producto_nombre = producto_nombre;
        this.producto_precio = producto_precio;
        this.cantidad_producto = cantidad_producto;
        this.subtotal = subtotal;
        this.total = total;
        this.pedido_estado = pedido_estado;
        this.metodo_pago = metodo_pago;
        this.id_usuarioFK = id_usuarioFK;
        this.clienteFK = clienteFK;
        this.mesaFK = mesaFK;
        this.fecha = fecha;
    }
    public desPedidoVO(String pedidoFK){
        this.pedidoFK = pedidoFK;
        
    }
    

    public desPedidoVO() {
    }

    public String getId_productoFK() {
        return id_productoFK;
    }

    public void setId_productoFK(String id_productoFK) {
        this.id_productoFK = id_productoFK;
    }

    public String getPedidoFK() {
        return pedidoFK;
    }

    public void setPedidoFK(String pedidoFK) {
        this.pedidoFK = pedidoFK;
    }

    public String getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = subtotal;
    }

    public int getCantidad_producto() {
        return cantidad_producto;
    }

    public void setCantidad_producto(int cantidad_producto) {
        this.cantidad_producto = cantidad_producto;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getProducto_nombre() {
        return producto_nombre;
    }

    public void setProducto_nombre(String producto_nombre) {
        this.producto_nombre = producto_nombre;
    }

    public String getPedido_estado() {
        return pedido_estado;
    }

    public void setPedido_estado(String pedido_estado) {
        this.pedido_estado = pedido_estado;
    }

    public String getMetodo_pago() {
        return metodo_pago;
    }

    public void setMetodo_pago(String metodo_pago) {
        this.metodo_pago = metodo_pago;
    }

    public String getProducto_precio() {
        return producto_precio;
    }

    public void setProducto_precio(String producto_precio) {
        this.producto_precio = producto_precio;
    }

    public String getId_usuarioFK() {
        return id_usuarioFK;
    }

    public void setId_usuarioFK(String id_usuarioFK) {
        this.id_usuarioFK = id_usuarioFK;
    }

    public String getClienteFK() {
        return clienteFK;
    }

    public void setClienteFK(String clienteFK) {
        this.clienteFK = clienteFK;
    }

    public String getMesaFK() {
        return mesaFK;
    }

    public void setMesaFK(String mesaFK) {
        this.mesaFK = mesaFK;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
}

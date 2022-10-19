/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author Daniel
 */
public class PedidoVO {

    String id_desPedido, id_producto, id_Cliente, nombre_Producto, estado, fecha, id_usuarioFK, mesaFK;

    int item, cantidad_producto, metodo_pago, id_Pedido;
    double total, subtotal, precio;

    public PedidoVO(String id_desPedido, String id_producto, String id_Cliente, String nombre_Producto, String estado, String fecha, String id_usuarioFK, String mesaFK, int id_Pedido, int item, int cantidad_producto, int metodo_pago, double total, double subtotal, double precio) {
        
        this.id_Pedido = id_Pedido;
        this.id_desPedido = id_desPedido;
        this.id_producto = id_producto;
        this.id_Cliente = id_Cliente;
        this.nombre_Producto = nombre_Producto;
        this.estado = estado;
        this.fecha = fecha;
        this.id_usuarioFK = id_usuarioFK;
        this.mesaFK = mesaFK;
        this.item = item;
        this.cantidad_producto = cantidad_producto;
        this.metodo_pago = metodo_pago;
        this.total = total;
        this.subtotal = subtotal;
        this.precio = precio;
    }

    public PedidoVO() {
    }

    public int getId_Pedido() {
        return id_Pedido;
    }

    public void setId_Pedido(int id_Pedido) {
        this.id_Pedido = id_Pedido;
    }


    public String getId_desPedido() {
        return id_desPedido;
    }

    public void setId_desPedido(String id_desPedido) {
        this.id_desPedido = id_desPedido;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getId_Cliente() {
        return id_Cliente;
    }

    public void setId_Cliente(String id_Cliente) {
        this.id_Cliente = id_Cliente;
    }

    public String getNombre_Producto() {
        return nombre_Producto;
    }

    public void setNombre_Producto(String nombre_Producto) {
        this.nombre_Producto = nombre_Producto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidad_producto() {
        return cantidad_producto;
    }

    public void setCantidad_producto(int cantidad_producto) {
        this.cantidad_producto = cantidad_producto;
    }

    public String getId_usuarioFK() {
        return id_usuarioFK;
    }

    public void setId_usuarioFK(String id_usuarioFK) {
        this.id_usuarioFK = id_usuarioFK;
    }

    public String getMesaFK() {
        return mesaFK;
    }

    public void setMesaFK(String mesaFK) {
        this.mesaFK = mesaFK;
    }

    public int getMetodo_pago() {
        return metodo_pago;
    }

    public void setMetodo_pago(int metodo_pago) {
        this.metodo_pago = metodo_pago;
    }

}

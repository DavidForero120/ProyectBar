/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

import java.util.logging.Logger;

/**
 *
 * @author Aprendiz
 */
public class desPedidoVO {
    private String id_productoFK, pedidoFK, subtotal, producto_nombre;
    private int cantidad_producto=0;
    private double total;

    public desPedidoVO(String id_productoFK, String pedidoFK, String subtotal, String producto_nombre, int cantidad_producto, double total) {
        this.id_productoFK = id_productoFK;
        this.pedidoFK = pedidoFK;
        this.subtotal = subtotal;
        this.cantidad_producto = cantidad_producto;
        this.total = total;
        this.producto_nombre = producto_nombre;
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

    
   
    
}

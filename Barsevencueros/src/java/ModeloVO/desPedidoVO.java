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
    private String id_productoFK, pedidoFK, subtotal;
    private int cantidad_producto;
    private double total;

    public desPedidoVO(String id_productoFK, String pedidoFK,int cantidad_producto,String subtotal, double total) {
        this.id_productoFK = id_productoFK;
        this.pedidoFK = pedidoFK;
        this.cantidad_producto = cantidad_producto;
        this.subtotal = subtotal;
        this.total = total;
  
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
    
}

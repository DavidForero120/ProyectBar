/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author David
 */
public class ProductoVO {
    private String id_producto, producto_nombre, producto_estado;
    private Double producto_precio;
    private int producto_cantidad;

    public ProductoVO(String id_producto, String producto_nombre, Double producto_precio, String producto_estado, int producto_cantidad) {
        this.id_producto = id_producto;
        this.producto_nombre = producto_nombre;
        this.producto_estado = producto_estado;
        this.producto_precio = producto_precio;
        this.producto_cantidad = producto_cantidad;
    }

    public Double getProducto_precio() {
        return producto_precio;
    }

    public void setProducto_precio(Double producto_precio) {
        this.producto_precio = producto_precio;
    }

    public int getProducto_cantidad() {
        return producto_cantidad;
    }

    public void setProducto_cantidad(int producto_cantidad) {
        this.producto_cantidad = producto_cantidad;
    }

    public ProductoVO() {
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getProducto_nombre() {
        return producto_nombre;
    }

    public void setProducto_nombre(String producto_nombre) {
        this.producto_nombre = producto_nombre;
    }

    public String getProducto_estado() {
        return producto_estado;
    }

    public void setProducto_estado(String producto_estado) {
        this.producto_estado = producto_estado;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author 57314
 */
public class productosVO {
     private String id_producto, producto_nombre, producto_estado,producto_precio,producto_cantidad;

    public productosVO(String id_producto, String producto_nombre, String producto_estado, String producto_precio, String producto_cantidad) {
        this.id_producto = id_producto;
        this.producto_nombre = producto_nombre;
        this.producto_estado = producto_estado;
        this.producto_precio = producto_precio;
        this.producto_cantidad = producto_cantidad;
    }

    public productosVO() {
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

    public String getProducto_precio() {
        return producto_precio;
    }

    public void setProducto_precio(String producto_precio) {
        this.producto_precio = producto_precio;
    }

    public String getProducto_cantidad() {
        return producto_cantidad;
    }

    public void setProducto_cantidad(String producto_cantidad) {
        this.producto_cantidad = producto_cantidad;
    }
     
}

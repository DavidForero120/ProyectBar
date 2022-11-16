/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.productosVO;
import Util.ConexionBd;
import Util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author David
 */
public class productosDAO extends ConexionBd implements Crud  {
     private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;

    private String id_producto = "", producto_nombre = "", producto_estado = "",producto_precio="", producto_cantidad="";
   
    public productosDAO(productosVO produVO){
        super();
        try {
            conexion = this.obtenerConexion();
            id_producto = produVO.getId_producto();
            producto_nombre = produVO.getProducto_nombre();
            producto_precio = produVO.getProducto_precio();
            producto_estado = produVO.getProducto_estado();
            producto_cantidad = produVO.getProducto_cantidad();
        } catch (Exception e) {
            Logger.getLogger(productosDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    @Override
    public boolean agregarRegistro() {
         try {
            
            sql="INSERT INTO producto (id_producto, producto_nombre, producto_precio, producto_estado, producto_cantidad) VALUES (?, ?, ?, ?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id_producto);
            puente.setString(2, producto_nombre);
            puente.setString(3,producto_precio);
            puente.setString(4,producto_estado);
            puente.setString(5,producto_cantidad);
            puente.executeUpdate();
            operacion = true;      
            
        } catch (SQLException e) {
            Logger.getLogger(productosDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(productosDAO.class.getName()).log(Level.SEVERE, null, e);
            }
    }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
       try {
            conexion = this.obtenerConexion();
            sql = "update producto set producto_nombre=?, producto_precio=?, producto_estado=?, producto_cantidad=? where id_producto=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, producto_nombre);
            puente.setString(2, producto_precio);
            puente.setString(3, producto_estado);
            puente.setString(4, producto_cantidad);
            puente.setString(5, id_producto);
            puente.executeUpdate();
            operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(productosDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
                try {
                    this.deneterConexion();
                } catch (SQLException e) {
                    Logger.getLogger(productosDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
            return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

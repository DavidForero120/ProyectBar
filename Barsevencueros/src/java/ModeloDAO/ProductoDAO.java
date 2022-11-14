/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.ClienteVO;
import ModeloVO.ProductoVO;
import Util.ConexionBd;
import Util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author David
 */
public class ProductoDAO extends ConexionBd implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;

    private String id_producto = "", producto_nombre = "", producto_estado = "";
    private Double producto_precio;
    private int producto_cantidad;

    public ProductoDAO(ProductoVO prodVO) {

        super();
        try {
            
            conexion = this.obtenerConexion();
            id_producto = prodVO.getId_producto();
            producto_nombre = prodVO.getProducto_nombre();
            producto_precio = prodVO.getProducto_precio();
            producto_estado = prodVO.getProducto_estado();
            producto_cantidad = prodVO.getProducto_cantidad();
            
        } catch (Exception e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ProductoDAO() {
    }

    @Override
    public boolean agregarRegistro() {
       try {
            
            sql="CALL Registrar_Producto(?, ?, ?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, producto_nombre);
            puente.setDouble(2,producto_precio);
            puente.setString(3,producto_estado);
            puente.setInt(4,producto_cantidad);
            puente.executeUpdate();
            operacion = true;      
            
        } catch (SQLException e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
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
            puente.setDouble(2, producto_precio);
            puente.setString(3, producto_estado);
            puente.setInt(4, producto_cantidad);
            puente.setString(5, id_producto);
            puente.executeUpdate();
            operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
                try {
                    this.deneterConexion();
                } catch (SQLException e) {
                    Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
            return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<ProductoVO> listar(){
        ArrayList<ProductoVO> listaProducto = new ArrayList<>();
        
        try {
            conexion = this.obtenerConexion();
            sql="select * from producto where producto_estado=1";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {                    
                    ProductoVO prodVO = new ProductoVO(mensajero.getString(1), mensajero.getString(2),
                            mensajero.getDouble(3),mensajero.getString(4),mensajero.getInt(5));
                    listaProducto.add(prodVO);
                }
        } catch (SQLException e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaProducto;
    }
     public ProductoVO consultarProducto(String id_producto) {
        ProductoVO prodVO = null;
        try {
            conexion = this.obtenerConexion();
            sql = "select * from producto where id_producto=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id_producto);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

               prodVO  = new ProductoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getDouble(3), mensajero.getString(4), mensajero.getInt(5));
            }

        } catch (SQLException e) {
            Logger.getLogger(MesaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(MesaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return prodVO;
    }
    
        public ProductoVO buscarQ(String id_producto)
        {
        
        ProductoVO prodVO = new ProductoVO();
        try {
            conexion = this.obtenerConexion();
            sql ="select * from producto where id_producto=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id_producto);
            mensajero = puente.executeQuery();
            while (mensajero.next()) 
            {
                prodVO.setId_producto(mensajero.getString(1));
                prodVO.setProducto_nombre(mensajero.getString(2));
                prodVO.setProducto_precio(mensajero.getDouble(3));
                prodVO.setProducto_estado(mensajero.getString(4));
                prodVO.setProducto_cantidad(mensajero.getInt(5));
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return prodVO;
    }
}

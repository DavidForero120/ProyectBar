/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.PedidoVO;
import ModeloVO.desPedidoVO;
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
 * @author Aprendiz
 */
public class desPedidoDAO extends ConexionBd implements Crud{
    
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;

    private String id_productoFK="", pedidoFK="", subtotal="",producto_nombre="";
    private int cantidad_producto ;
    private double  total;

    public desPedidoDAO(desPedidoVO desVO) {
        
        
        super();
        try {
            conexion = this.obtenerConexion();
            
            id_productoFK = desVO.getId_productoFK();
            pedidoFK = desVO.getPedidoFK();
            cantidad_producto = desVO.getCantidad_producto();
            total = desVO.getTotal();
            
            
        } catch (Exception e) {
            Logger.getLogger(desPedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
    }

    public desPedidoDAO() {
    }
    
    
    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<desPedidoVO> listar(){
        ArrayList<desPedidoVO> listaPedido = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
                sql="select * from des_pedido where pedidoFK = 3";
                puente = conexion.prepareStatement(sql);
                mensajero = puente.executeQuery();
                while (mensajero.next()) {
           desPedidoVO  desVO = new desPedidoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),mensajero.getString(4), mensajero.getInt(5), mensajero.getDouble(6));
           listaPedido.add(desVO);
            }
        } catch (SQLException e) {
            Logger.getLogger(desPedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(desPedidoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        
        return listaPedido;
    
    }
    public desPedidoVO consultarDes(String pedidoFK) {
        desPedidoVO desVO = null;
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT pedido.id_usuarioFK, usuario.usuario_nombre, des_pedido.id_productoFK,producto.producto_nombre, des_pedido.cantidad_producto, des_pedido.sub_total, des_pedido.total FROM `pedido` INNER JOIN usuario ON pedido.id_usuarioFK = usuario.id_usuario INNER JOIN des_pedido ON des_pedido.pedidoFK = pedido.id_pedido INNER JOIN producto ON des_pedido.id_productoFK = producto.id_producto WHERE des_pedido.pedidoFK = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, pedidoFK);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
            desVO = new desPedidoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3),mensajero.getString(4), mensajero.getInt(5), mensajero.getDouble(6));
            }

        } catch (SQLException e) {
            Logger.getLogger(desPedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(desPedidoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return desVO;
    }
    
}

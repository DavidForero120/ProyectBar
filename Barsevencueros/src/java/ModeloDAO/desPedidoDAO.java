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

    private String id_productoFK="", pedidoFK="", subtotal="",  producto_nombre="", producto,precio="",pedido_estado="", Metodo_pago="",id_usuarioFK="", clienteFK="", mesaFK="", fecha="" , id_pedido="";
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
        try {
            sql = "update pedido set  pedido_estado=2 where id_pedido = ?";
            puente = conexion.prepareStatement(sql);
            
            puente.setString(1, pedidoFK);
            
            puente.executeUpdate();
            operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(PagarDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
                try {
                    this.deneterConexion();
                } catch (Exception e) {
                    Logger.getLogger(PagarDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
            return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<desPedidoVO> listar(String pedidoFK){
        ArrayList<desPedidoVO> listaPedido = new ArrayList<>();
        try {
            conexion = this.obtenerConexion();
                sql="SELECT des_pedido.pedidoFK,"
                        + " des_pedido.id_productoFK, "
                        + "producto.producto_nombre, "
                        + "producto.producto_precio, "
                        + "des_pedido.cantidad_producto,"
                        + " des_pedido.sub_total, "
                        + "des_pedido.total,"
                        + " pedido.pedido_estado, "
                        + "pedido.Metodo_pago, "
                        + "pedido.id_usuarioFK, "
                        + "pedido.clienteFK, "
                        + "pedido.mesaFK,pedido.fecha "
                        + "FROM des_pedido "
                        + "INNER JOIN producto on des_pedido.id_productoFK = producto.id_producto INNER JOIN pedido ON des_pedido.pedidoFK = pedido.id_pedido WHERE des_pedido.pedidoFK = ?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, pedidoFK);
                mensajero = puente.executeQuery();
                while (mensajero.next()) {
           desPedidoVO  desVO = new desPedidoVO(
                   mensajero.getString(1), 
                   mensajero.getString(2), 
                   mensajero.getString(3), 
                   mensajero.getString(4), 
                   mensajero.getInt(5), 
                   mensajero.getString(6),
                   mensajero.getDouble(7), 
                   mensajero.getString(8), 
                   mensajero.getString(9),
                   mensajero.getString(10), 
                   mensajero.getString(11), 
                   mensajero.getString(12), 
                   mensajero.getString(13));
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
    
    
     public desPedidoVO consultartarPago(String pedidoFK){
         desPedidoVO desVO = null; 
         try {
             conexion = this.obtenerConexion();
             sql="select * from des_pedido where pedidoFK=?";
             puente = conexion.prepareStatement(sql);
             puente.setString(1, pedidoFK);
             mensajero = puente.executeQuery();
                while (mensajero.next()) {                    
                    desVO = new desPedidoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getInt(3), mensajero.getString(4), mensajero.getDouble(5));                
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
         return desVO;
         
     }
    
    
    
    
}

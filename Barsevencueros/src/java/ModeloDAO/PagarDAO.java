package ModeloDAO;

import ModeloVO.PagarVO;
import ModeloVO.desPedidoVO;
import Util.ConexionBd;
import Util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author alrod
 */
public class PagarDAO extends ConexionBd implements Crud{
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;

    private String id_pedido="", id_usuarioFK="", clienteFK="", mesaFK="",pedido_estado="", Metodo_pago="", fecha="",cliente_nombre="",cliente_apellido="";
    
    PagarVO pagVO = new PagarVO();
    public PagarDAO(){
    }
    public PagarDAO(PagarVO pagVO){
        super();
        try {
            conexion = this.deneterConexion();
            id_pedido = pagVO.getId_pedido();
            id_usuarioFK = pagVO.getId_usuarioFK();
            clienteFK = pagVO.getClienteFK();
            mesaFK = pagVO.getMesaFK();
            pedido_estado = pagVO.getPedido_estado();
            Metodo_pago = pagVO.getMetodo_pago();
            fecha =pagVO.getFecha();
            cliente_nombre= pagVO.getCliente_nombre();
            cliente_apellido = pagVO.getCliente_apellido();
        } catch (Exception e) {
             Logger.getLogger(desPedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
        public ArrayList<PagarVO> listar(){
       ArrayList<PagarVO> listarPedido = new ArrayList<>();
       
       try {
           
           conexion = this.obtenerConexion();
           sql="select pedido.id_pedido, pedido.id_usuarioFK, pedido.clienteFK, pedido.mesaFK, pedido.pedido_estado, pedido.Metodo_pago, pedido.fecha ,cliente.cliente_nombre, cliente.cliente_apellido, Metodo_pago.Metodo from pedido INNER JOIN cliente ON pedido.clienteFK = cliente.id_cliente INNER JOIN Metodo_pago ON pedido.Metodo_pago = Metodo_pago.id_metodoPago WHERE pedido.pedido_estado = 1;;";
           puente = conexion.prepareStatement(sql);
           mensajero = puente.executeQuery();
           while (mensajero.next()) {                    
                    PagarVO pagVO = new PagarVO(               
                            mensajero.getString(1), 
                            mensajero.getString(2), 
                            mensajero.getString(3), 
                            mensajero.getString(4), 
                            mensajero.getString(5), 
                            mensajero.getString(6),
                            mensajero.getString(7),
                            mensajero.getString(8),
                             mensajero.getString(9)
                            
                    );
                        listarPedido.add(pagVO);
                }
           
       } catch (SQLException e) {
           Logger.getLogger(PagarDAO.class.getName()).log(Level.SEVERE, null, e);
       }finally {
            try {
                this.deneterConexion();
            } catch (SQLException ex) {
                Logger.getLogger(PagarDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
       return listarPedido;
   }
    public ArrayList<PagarVO> listar2(){
       ArrayList<PagarVO> listarPedido = new ArrayList<>();
       
       try {
           conexion = this.obtenerConexion();
           sql="select * from pedido where month(fecha) = month(now()) and pedido_estado =2";
           puente = conexion.prepareStatement(sql);
           mensajero = puente.executeQuery();
           while (mensajero.next()) {                    
                    PagarVO pagVO = new PagarVO(               
                            mensajero.getString(1), 
                            mensajero.getString(2), 
                            mensajero.getString(3), 
                            mensajero.getString(4), 
                            mensajero.getString(5), 
                            mensajero.getString(6),
                            mensajero.getString(7)
                            
                    );
                        listarPedido.add(pagVO);
                }
           
       } catch (SQLException e) {
           Logger.getLogger(PagarDAO.class.getName()).log(Level.SEVERE, null, e);
       }finally {
            try {
                this.deneterConexion();
            } catch (SQLException ex) {
                Logger.getLogger(PagarDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
       return listarPedido;
   }     
        
    
    
    @Override
    public boolean agregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
        
        try {
            sql = "update pedido set id_usuarioFK=?, clienteFK=?, mesaFK=?, pedido_estado=?, Metodo_pago=?, fecha=? where id_pedido = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, id_usuarioFK);
            puente.setString(2, clienteFK);
            puente.setString(3, mesaFK);
            puente.setString(4, pedido_estado);
            puente.setString(5, Metodo_pago);
            puente.setString(6, fecha);
            puente.setString(7, id_pedido);
            
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
     
     
     public boolean actualizarEstado(){
         try {
            sql = "update pedido set id_usuarioFK=?, clienteFK=?, mesaFK=?, pedido_estado=?, Metodo_pago=?, fecha=? where id_pedido = ?";
            /*puente = conexion.prepareStatement(sql);*/
            puente.setString(1, id_usuarioFK);
            puente.setString(2, clienteFK);
            puente.setString(3, mesaFK);
            puente.setString(4, pedido_estado);
            puente.setString(5, Metodo_pago);
            puente.setString(6, fecha);
            puente.setString(7, id_pedido);
            
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
    
}
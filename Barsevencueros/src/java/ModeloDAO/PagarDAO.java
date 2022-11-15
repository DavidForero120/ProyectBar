/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.PagarVO;
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

    private String id_pedido="", id_usuarioFK="", clienteFK="", mesaFK="",pedido_estado="", Metodo_pago="", fecha="";
    
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
        } catch (Exception e) {
             Logger.getLogger(desPedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
        public ArrayList<PagarVO> listar(){
       ArrayList<PagarVO> listarPedido = new ArrayList<>();
       
       try {
           conexion = this.obtenerConexion();
           sql="select pedido.id_pedido, pedido.id_usuarioFK, pedido.clienteFK, pedido.mesaFK, pedido.pedido_estado, pedido.Metodo_pago, pedido.fecha, usuario.usuario_nombre, usuario.usuario_apellido, cliente.cliente_nombre, cliente.cliente_apellido, Metodo_pago.Metodo from pedido INNER JOIN usuario ON pedido.id_usuarioFK = usuario.id_usuario INNER JOIN cliente ON pedido.clienteFK = cliente.id_cliente INNER JOIN Metodo_pago ON pedido.Metodo_pago = Metodo_pago.id_metodoPago WHERE pedido.pedido_estado = 1;";
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
           Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
       }finally {
            try {
                this.deneterConexion();
            } catch (SQLException ex) {
                Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

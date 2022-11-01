/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.PedidoVO;
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
public class PedidoDAO extends ConexionBd implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;

    private String id_usuarioFK = "", clienteFK = "", mesaFK = "", fecha = "", pedido_estado = "", id_producto="";
    private Double sub_total, precio, total;
    private Integer metodo_pago, cantidad_producto, id_pedido, r = 0;

    PedidoVO pedVO = new PedidoVO();

    public PedidoDAO(PedidoVO pedVO) {

        super();
        try {
            conexion = this.obtenerConexion();

            id_pedido = pedVO.getId_Pedido();
            id_usuarioFK = pedVO.getId_usuarioFK();
            clienteFK = pedVO.getId_Cliente();
            mesaFK = pedVO.getMesaFK();
            metodo_pago = pedVO.getMetodo_pago();
            fecha = pedVO.getFecha();
            pedido_estado = pedVO.getEstado();
            sub_total = pedVO.getSubtotal();
            precio = pedVO.getPrecio();
            total = pedVO.getTotal();
            cantidad_producto = pedVO.getCantidad_producto();

        } catch (Exception e) {
            Logger.getLogger(desPedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public PedidoDAO() {
    }

    @Override
    public boolean agregarRegistro() {///Agregar Pedido
        try {
            conexion = this.obtenerConexion();
            sql = "INSERT INTO pedido (id_usuarioFK, clienteFK, mesaFK, sub_total, pedido_estado, Metodo_pago, fecha) VALUES (?, ?, ?, ?, ?, ?, NOW());";
            puente = conexion.prepareStatement(sql);
            puente.setInt(1, pedVO.getId_Pedido());
            puente.setString(2, pedVO.getId_usuarioFK());
            puente.setString(3, pedVO.getId_Cliente());
            puente.setString(4, pedVO.getMesaFK());
            puente.setDouble(5, pedVO.getSubtotal());
            puente.setString(6, pedVO.getEstado());
            puente.setInt(7, pedVO.getMetodo_pago());
            puente.setString(8, pedVO.getFecha());
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return operacion;
    }

    public int idPedido() {
        int idPedido = 0;
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT MAX(id_pedido) FROM PEDIDO";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                idPedido = mensajero.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return idPedido;
    }

    public int guardarVenta(PedidoVO pedVO) {
        try {
            conexion = this.obtenerConexion();
            sql = "INSERT INTO pedido (id_usuarioFK, clienteFK, mesaFK, sub_total, pedido_estado, Metodo_pago, fecha) VALUES (?, ?, ?, ?, ?, ?, NOW());";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, pedVO.getId_usuarioFK());
            puente.setString(2, pedVO.getId_Cliente());
            puente.setString(3, pedVO.getMesaFK());
            puente.setDouble(4, pedVO.getSubtotal());
            puente.setString(5, pedVO.getEstado());
            puente.setInt(6, pedVO.getMetodo_pago());
            puente.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return r;
    }

    public int Agregardespedido(PedidoVO pedVO) {
        try {
            conexion = this.obtenerConexion();
            sql = "INSERT INTO des_pedido (id_productoFK, pedidoFK, cantidad_producto, total) VALUES (?, ?, ?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, pedVO.getId_producto());
            puente.setInt(2, pedVO.getId_Pedido());
            puente.setInt(3, pedVO.getCantidad_producto());
            puente.setDouble(4, pedVO.getSubtotal());
            puente.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return r;
    }

    @Override
    public boolean actualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean eliminarRegister(String Id_producto) {
        
        try {
            conexion = this.obtenerConexion();
            sql = "delete from pedido where id_producto=?";            
            puente.setString(1, pedVO.getId_producto());
            puente = conexion.prepareStatement(sql);
            puente.executeUpdate();
            operacion = true;
         } catch (SQLException e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException ex) {
                Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

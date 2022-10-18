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

public class PedidoDAO extends ConexionBd {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;

    private String id_pedido = "", id_usuarioFK = "",clienteFK = "",mesaFK="",fecha="", pedido_estado = "";
    private Double sub_total, precio, total;
    private int metodo_pago, cantidad_producto;
    
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
   

}


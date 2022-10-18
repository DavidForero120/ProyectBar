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

    private String id_productoFK="", pedidoFK="", total="";
    private int cantidad_producto ;

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
                sql =  "Call listarPedidos";
                puente = conexion.prepareStatement(sql);
                mensajero = puente.executeQuery();
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
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.MetodoPagoVO;
import Util.ConexionBd;
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
public class MetodoPagoDAO extends ConexionBd{
    
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    
    Integer id_metodoPago, metodo;
    
    MetodoPagoVO metVO = new MetodoPagoVO();
    
    public MetodoPagoDAO(MetodoPagoVO metVO){
        super();
        try {
            conexion = this.deneterConexion();
            
            id_metodoPago = metVO.getId_metodoPago();
            metodo = metVO.getMetodo();
           
            
        } catch (Exception e) {
             Logger.getLogger(desPedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    public ArrayList<MetodoPagoVO> listar(){
        ArrayList<MetodoPagoVO> listarMetodoPago = new ArrayList<>();
            
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT * FROM metodo_pago";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {                    
                    MetodoPagoVO metVO = new MetodoPagoVO(mensajero.getInt(1), mensajero.getInt(2));
                    listarMetodoPago.add(metVO);
                }
        } catch (SQLException e) {
            Logger.getLogger(MesaDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            try {
                this.deneterConexion();
            } catch (Exception e) {
                Logger.getLogger(MesaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listarMetodoPago;
    }

    public MetodoPagoDAO() {
    }
    
}

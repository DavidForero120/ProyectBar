/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.MesaVO;
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
 * @author alrod
 */
public class MesaDAO extends ConexionBd implements Crud{

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    private boolean operacion = false;
    private String sql;

    private String id_mesa = "", mesa_numero = "", mesa_estado = "";

    public MesaDAO() {

    }

    public MesaDAO(MesaVO mesaVO) {
        super();

        try {
            conexion = this.obtenerConexion();

            id_mesa = mesaVO.getId_mesa();
            mesa_numero = mesaVO.getMesa_numero();
            mesa_estado = mesaVO.getMesa_estado();
        } catch (Exception e) {
            Logger.getLogger(MesaDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    
    public boolean agregarRegistro() {
        
        try {
            sql = "Call RegistroMesa(?,?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, mesa_numero);
            puente.setString(2, mesa_estado);
            puente.executeUpdate();
            operacion = true;
            
        } catch (SQLException e) {
            Logger.getLogger(MesaDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            try {
                this.deneterConexion();
            } catch (Exception e) {
                Logger.getLogger(MesaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
        
    }

    @Override
    public boolean actualizarRegistro() {
            try {
            sql = "update mesa set mesa_numero=?, mesa_estado=? where id_mesa=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, mesa_numero);
            puente.setString(2, mesa_estado);
            puente.executeUpdate();
            operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(MesaDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
                try {
                    this.deneterConexion();
                } catch (Exception e) {
                    Logger.getLogger(MesaDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
            return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<MesaVO> listar(){
        ArrayList<MesaVO> listarMesa = new ArrayList<>();
            
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT * FROM mesa";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {                    
                    MesaVO mesaVO = new MesaVO(mensajero.getString(1), mensajero.getString(2),
                            mensajero.getString(3));
                    listarMesa.add(mesaVO);
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
        return listarMesa;
    }
    public MesaVO consultarMesa(String mesa) {
        MesaVO mesaVO = null;
        try {
            conexion = this.obtenerConexion();
            sql = "select * from mesa where id_mesa=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, mesa);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                mesaVO = new MesaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3));
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
        return mesaVO;
    }
}
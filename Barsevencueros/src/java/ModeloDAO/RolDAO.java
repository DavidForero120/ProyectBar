/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.RolVO;
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
 * David
 */
public class RolDAO extends ConexionBd{
    //1. Declarar variables
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;

    private boolean operacion = false;
    private String sql;
    private String id_rol = "", tipo_rol = "";
   
    public RolDAO(){
   
    }

    public RolDAO(RolVO rolVO) {
        super();

        try {
            conexion = this.obtenerConexion();

            id_rol = rolVO.getId_rol();
            tipo_rol = rolVO.getTipo_rol();
           
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }public ArrayList<RolVO> listarUsuario (String usuario_nombre){
        ArrayList<RolVO> listaUsuario = new ArrayList<>();
            try {
                conexion = this.obtenerConexion();
                sql =  "Call ListaRol(?)";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, usuario_nombre);
                mensajero = puente.executeQuery();
                while (mensajero.next()) {                    
                    RolVO rolVO = new RolVO(mensajero.getString(1), mensajero.getString(2));
                    listaUsuario.add(rolVO);
                }
            } catch (SQLException e) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            finally{
                try {
                    this.deneterConexion();
                } catch (SQLException e) {
                    Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }return listaUsuario;
    }
    
    public ArrayList<RolVO> listar (String usuario_nombre){
        ArrayList<RolVO> listaRol = new ArrayList<>();
            try {
                conexion = this.obtenerConexion();
                sql =  "SELECT usuario.usuario_nombre, rol.tipo_rol FROM rol INNER JOIN usuario ON usuario.id_rolFK = rol.id_rol WHERE usuario.usuario_nombre=?";
                puente = conexion.prepareStatement(sql);
                puente.setString(1, usuario_nombre);
                mensajero = puente.executeQuery();
                while (mensajero.next()) {                    
                    RolVO rolVO = new RolVO(mensajero.getString(1), mensajero.getString(2));
                    listaRol.add(rolVO);
                }
            } catch (SQLException e) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            finally{
                try {
                    this.deneterConexion();
                } catch (SQLException e) {
                    Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }return listaRol;
    }
   
}

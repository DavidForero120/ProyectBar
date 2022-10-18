/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.ClienteVO;
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
 * @author 57314
 */
public class ClienteDAO extends ConexionBd implements Crud{
    
     private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    
    private String id_cliente="", numero_documento="", cliente_nombre="", cliente_apellido="", cliente_estado="", cliente_correo="", fecha_nacimiento="", tipo_documento="";

    public ClienteDAO() {
    }
     
    
    
    
    public ClienteDAO(ClienteVO clientVO){
        super();
        try {
  
        conexion = this.obtenerConexion();
        id_cliente = clientVO.getId_cliente();
        numero_documento= clientVO.getNumero_documento();
        cliente_nombre = clientVO.getCliente_nombre();
        cliente_apellido = clientVO.getCliente_apellido();
        cliente_estado = clientVO.getCliente_estado();
        cliente_correo = clientVO.getCliente_correo();
        fecha_nacimiento = clientVO.getFecha_nacimiento();
        tipo_documento = clientVO.getTipo_documento();
        
        } catch (Exception e) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
                
     
    }
    
    //*********Operaciones CRUD*************//
    

    @Override
    public boolean agregarRegistro() {
         try {
            
            sql="CALL Registrar_Cliente(?, ?, ?, ?, ?, ?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, numero_documento);
            puente.setString(2, cliente_nombre);
            puente.setString(3, cliente_apellido);
            puente.setString(4, cliente_estado);
            puente.setString(5, cliente_correo);
            puente.setString(6, fecha_nacimiento);
            puente.setString(7, tipo_documento);
            
            
            puente.executeUpdate();
            operacion = true;        
        } catch (SQLException e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
    }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update cliente set numero_documento=?, cliente_nombre=?, cliente_apellido=?, cliente_estado=?, cliente_correo=?, fecha_nacimiento=?, tipo_documento=? where id_cliente=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, numero_documento);
            puente.setString(2, cliente_nombre);
            puente.setString(3, cliente_apellido);
            puente.setString(4, cliente_estado);
            puente.setString(5, cliente_correo);
            puente.setString(6, fecha_nacimiento);
            puente.setString(7, tipo_documento);
            puente.setString(8, id_cliente);

            puente.executeUpdate();
            operacion = true;
        } catch (SQLException e) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
        }finally{
                try {
                    this.deneterConexion();
                } catch (Exception e) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
            return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ArrayList<ClienteVO> listar(){
        ArrayList<ClienteVO> listaCliente = new ArrayList<>();
            try {
                conexion = this.obtenerConexion();
                sql =  "Call ListarCliente()";
                puente = conexion.prepareStatement(sql);
                mensajero = puente.executeQuery();
                while (mensajero.next()) {                    
                    ClienteVO cliVO = new ClienteVO(mensajero.getString(1), mensajero.getString(2),mensajero.getString(3),mensajero.getString(4),mensajero.getString(5),
                            mensajero.getString(6),mensajero.getString(7),mensajero.getString(8));
                    listaCliente.add(cliVO);
                }
            } catch (SQLException e) {
                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            finally{
                try {
                    this.deneterConexion();
                } catch (SQLException e) {
                    Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }return listaCliente;
    }
    public ClienteVO consultarCliente(String Cliente) {
        ClienteVO cliVO = null;
        try {
            conexion = this.obtenerConexion();
            sql = "select * from Cliente where id_cliente=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Cliente);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

            cliVO = new ClienteVO(mensajero.getString(1), mensajero.getString(2),mensajero.getString(3),mensajero.getString(4),mensajero.getString(5),
             mensajero.getString(6),mensajero.getString(7),mensajero.getString(8));
 
            }

        } catch (SQLException e) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.deneterConexion();
            } catch (SQLException e) {
                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return cliVO;
    }
    
    public ClienteVO buscar(String documento){
        
        ClienteVO cliVO = new ClienteVO();
        try {
            conexion = this.obtenerConexion();
            sql ="select * from cliente where numero_documento=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, documento);
            mensajero = puente.executeQuery();
            while (mensajero.next()) 
            {
                cliVO.setId_cliente(mensajero.getString(1));
                cliVO.setNumero_documento(mensajero.getString(2));
                cliVO.setCliente_nombre(mensajero.getString(3));
                cliVO.setCliente_apellido(mensajero.getString(4));
                cliVO.setCliente_estado(mensajero.getString(5));
                cliVO.setCliente_correo(mensajero.getString(6));
                cliVO.setFecha_nacimiento(mensajero.getString(7));
                cliVO.setTipo_documento(mensajero.getString(8));
            }
        } 
        catch (SQLException e) 
        {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return cliVO;
    }
}

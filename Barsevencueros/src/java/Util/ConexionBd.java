/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * David
 */
public class ConexionBd {
    private String driver, user, password, dataBase,urlBd;
    
   private Connection conexion;
   
   
   public ConexionBd(){
       driver="com.mysql.jdbc.Driver";
       user="root";
       password="";
       dataBase="bar7cueros";
       urlBd = "jdbc:mysql://localhost:3306/"+dataBase;
               
               try {
            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(urlBd, user, password);
            System.out.println("Conexion exitosa");
        } catch (Exception e) {
            System.out.println("No pudo conectarse"+e.toString());
        }
        
    }
    public Connection obtenerConexion(){
        return conexion;
    }
    public Connection deneterConexion() throws SQLException{
        conexion.close();
        conexion=null;
        return conexion;
    }
    public static void main(String[] args) {
        new ConexionBd();
        
    }
     
}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * David
 */
public class UsuarioVO {
     private String id_usuario, usuario_nombre, usuario_apellido, usuario_password, usuario_estado, id_rolFK;

    public UsuarioVO(String id_usuario, String usuario_nombre, String usuario_apellido, String usuario_password, String usuario_estado, String id_rolFK) {
        this.id_usuario = id_usuario;
        this.usuario_nombre = usuario_nombre;
        this.usuario_apellido = usuario_apellido;
        this.usuario_password = usuario_password;
        this.usuario_estado = usuario_estado;
        this.id_rolFK = id_rolFK;
    }

    public UsuarioVO() {
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsuario_nombre() {
        return usuario_nombre;
    }

    public void setUsuario_nombre(String usuario_nombre) {
        this.usuario_nombre = usuario_nombre;
    }

    public String getUsuario_apellido() {
        return usuario_apellido;
    }

    public void setUsuario_apellido(String usuario_apellido) {
        this.usuario_apellido = usuario_apellido;
    }

    public String getUsuario_password() {
        return usuario_password;
    }

    public void setUsuario_password(String usuario_password) {
        this.usuario_password = usuario_password;
    }

    public String getUsuario_estado() {
        return usuario_estado;
    }

    public void setUsuario_estado(String usuario_estado) {
        this.usuario_estado = usuario_estado;
    }

    public String getId_rolFK() {
        return id_rolFK;
    }

    public void setId_rolFK(String id_rolFK) {
        this.id_rolFK = id_rolFK;
    }


    
    
    

    
    

   
}

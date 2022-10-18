/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author 57314
 */
public class ClienteVO {
    private String id_cliente, numero_documento, cliente_nombre, cliente_apellido, cliente_estado, cliente_correo, fecha_nacimiento, tipo_documento;

    public ClienteVO(String id_cliente, String numero_documento, String cliente_nombre, String cliente_apellido, String cliente_estado, String cliente_correo, String fecha_nacimiento, String tipo_documento) {
        this.id_cliente = id_cliente;
        this.numero_documento = numero_documento;
        this.cliente_nombre = cliente_nombre;
        this.cliente_apellido = cliente_apellido;
        this.cliente_estado = cliente_estado;
        this.cliente_correo = cliente_correo;
        this.fecha_nacimiento = fecha_nacimiento;
        this.tipo_documento = tipo_documento;
    }

    public ClienteVO() {
    }

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNumero_documento() {
        return numero_documento;
    }

    public void setNumero_documento(String numero_documento) {
        this.numero_documento = numero_documento;
    }

    public String getCliente_nombre() {
        return cliente_nombre;
    }

    public void setCliente_nombre(String cliente_nombre) {
        this.cliente_nombre = cliente_nombre;
    }

    public String getCliente_apellido() {
        return cliente_apellido;
    }

    public void setCliente_apellido(String cliente_apellido) {
        this.cliente_apellido = cliente_apellido;
    }

    public String getCliente_estado() {
        return cliente_estado;
    }

    public void setCliente_estado(String cliente_estado) {
        this.cliente_estado = cliente_estado;
    }

    public String getCliente_correo() {
        return cliente_correo;
    }

    public void setCliente_correo(String cliente_correo) {
        this.cliente_correo = cliente_correo;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }
    
}

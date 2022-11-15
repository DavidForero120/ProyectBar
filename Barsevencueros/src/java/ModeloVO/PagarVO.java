/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author alrod
 */
public class PagarVO {
    private String id_pedido, id_usuarioFK, clienteFK, mesaFK,pedido_estado, Metodo_pago, fecha;

    public PagarVO(String id_pedido, String id_usuarioFK, String clienteFK, String mesaFK, String pedido_estado, String Metodo_pago,String fecha) {
        this.id_pedido = id_pedido;
        this.id_usuarioFK = id_usuarioFK;
        this.clienteFK = clienteFK;
        this.mesaFK = mesaFK;
        this.pedido_estado = pedido_estado;
        this.Metodo_pago = Metodo_pago;
        this.fecha = fecha;
    }

    

    public PagarVO() {
    }

    public String getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(String id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getId_usuarioFK() {
        return id_usuarioFK;
    }

    public void setId_usuarioFK(String id_usuarioFK) {
        this.id_usuarioFK = id_usuarioFK;
    }

    public String getClienteFK() {
        return clienteFK;
    }

    public void setClienteFK(String clienteFK) {
        this.clienteFK = clienteFK;
    }

    public String getMesaFK() {
        return mesaFK;
    }

    public void setMesaFK(String mesaFK) {
        this.mesaFK = mesaFK;
    }

    public String getPedido_estado() {
        return pedido_estado;
    }

    public void setPedido_estado(String pedido_estado) {
        this.pedido_estado = pedido_estado;
    }

    public String getMetodo_pago() {
        return Metodo_pago;
    }

    public void setMetodo_pago(String Metodo_pago) {
        this.Metodo_pago = Metodo_pago;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
}

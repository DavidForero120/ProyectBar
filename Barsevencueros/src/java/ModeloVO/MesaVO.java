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
public class MesaVO {
    
    private String id_mesa, mesa_numero, mesa_estado;

    public MesaVO() {
    }

    public MesaVO(String id_mesa, String mesa_numero, String mesa_estado) {
        this.id_mesa = id_mesa;
        this.mesa_numero = mesa_numero;
        this.mesa_estado = mesa_estado;
    }

    public String getId_mesa() {
        return id_mesa;
    }

    public void setId_mesa(String id_mesa) {
        this.id_mesa = id_mesa;
    }

    public String getMesa_numero() {
        return mesa_numero;
    }

    public void setMesa_numero(String mesa_numero) {
        this.mesa_numero = mesa_numero;
    }

    public String getMesa_estado() {
        return mesa_estado;
    }

    public void setMesa_estado(String mesa_estado) {
        this.mesa_estado = mesa_estado;
    }
    
    
    
}
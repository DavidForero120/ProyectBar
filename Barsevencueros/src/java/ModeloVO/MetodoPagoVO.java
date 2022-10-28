/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author David
 */
public class MetodoPagoVO {
    private int id_metodoPago, metodo;

    public MetodoPagoVO(int id_metodoPago, int metodo) {
        this.id_metodoPago = id_metodoPago;
        this.metodo = metodo;
    }

    public MetodoPagoVO() {
    }

    public int getId_metodoPago() {
        return id_metodoPago;
    }

    public void setId_metodoPago(int id_metodoPago) {
        this.id_metodoPago = id_metodoPago;
    }

    public int getMetodo() {
        return metodo;
    }

    public void setMetodo(int metodo) {
        this.metodo = metodo;
    }
    
}

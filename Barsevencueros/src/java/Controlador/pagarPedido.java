/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.PagarDAO;
import ModeloDAO.PedidoDAO;
import ModeloDAO.desPedidoDAO;
import ModeloVO.PagarVO;
import ModeloVO.PedidoVO;
import ModeloVO.desPedidoVO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 57314
 */
@WebServlet(name = "pagarPedido", urlPatterns = {"/pagarPedido"})
public class pagarPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pedidoFK = request.getParameter("pedido");
        String id_usuarioFK  = request.getParameter("usuario");
        String clienteFK = request.getParameter("cliente");
        String mesaFK = request.getParameter("mesa");
        String pedido_estado = request.getParameter("estado");
        String Metodo_pago = request.getParameter("metodo");
        String fecha = request.getParameter("fecha");
       
        int valor = Integer.parseInt(request.getParameter("valor"));

        desPedidoVO pedVO = new desPedidoVO(pedidoFK);
        desPedidoDAO pedDAO = new desPedidoDAO(pedVO);
        
        switch(valor){
            
            case 1:
                 if(pedDAO.actualizarRegistro()){
                    request.getRequestDispatcher("view/Cajero.jsp").forward(request, response);
                    request.setAttribute("mensajeExito", "El pedido se pago");
                }else{
                    request.setAttribute("mensajeError", "El pedido no se pudo pagar");
                    request.getRequestDispatcher("view/Cajero.jsp").forward(request, response);
                }
                break;
            case 2:
                
            break;
            
            case 3:
               
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

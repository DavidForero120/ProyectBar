/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.PagarDAO;
import ModeloDAO.PedidoDAO;
import ModeloVO.PagarVO;
import ModeloVO.PedidoVO;
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
        String id_pedido = request.getParameter("pedido");
        String id_usuarioFK  = request.getParameter("");
        String clienteFK = request.getParameter("");
        String mesaFK = request.getParameter("");
        String pedido_estado = request.getParameter("estado");
        String Metodo_pago = request.getParameter("");
        String fecha = request.getParameter("");
        String cliente_nombre = request.getParameter("");
        String cliente_apellido = request.getParameter("");
        int valor = Integer.parseInt(request.getParameter("valor"));

        PagarVO pedVO = new PagarVO(id_pedido, id_usuarioFK, clienteFK, mesaFK, pedido_estado, Metodo_pago, fecha, cliente_nombre, cliente_apellido);
        PagarDAO pedDAO = new PagarDAO(pedVO);
        
        switch(valor){
            
            case 1:
                
                
                break;
            case 2:
                if(pedDAO.actualizarRegistro2(id_pedido)){
                    request.getRequestDispatcher("pagar.jsp").forward(request, response);
                }else{
                    request.setAttribute("mensajeError", "El pedido no se pudo pagar");
                    request.getRequestDispatcher("view/Mesero.jsp").forward(request, response); 
                }
            break;
            
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

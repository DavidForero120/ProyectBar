    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.PagarDAO;
import ModeloDAO.desPedidoDAO;
import ModeloVO.PagarVO;
import ModeloVO.desPedidoVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aprendiz
 */
@WebServlet(name = "desPedidoController", urlPatterns = {"/desPedido"})
public class desPedidoController extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pedidoFK = request.getParameter("pedido");    
        String id_productoFK = request.getParameter("producto");
        String subtotal = request.getParameter("subtotal");
        String producto_nombre = request.getParameter("nombrep");
        double total = 0;
        int valor = Integer.parseInt(request.getParameter("valor"));
        int contidad_producto = 0;
        desPedidoVO desVO = new desPedidoVO(id_productoFK, pedidoFK, contidad_producto, subtotal, total);
        desPedidoDAO desDAO = new desPedidoDAO(desVO);
        
        
        
        switch(valor){
            case 1:
                break;
            case 2:
                desVO = desDAO.consultartarPago(pedidoFK);
                if(desVO != null){
                    request.setAttribute("datosConsultados", desVO);
                       request.getRequestDispatcher("pagar.jsp").forward(request, response);
                }else{
                     request.setAttribute("mensajeError", "no se pudo encontrar");
                     request.getRequestDispatcher("pagar.jsp").forward(request, response);
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

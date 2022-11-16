/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.productosDAO;
import ModeloVO.productosVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 57314
 */
@WebServlet(name = "productosControlador", urlPatterns = {"/p"})
public class productosControlador extends HttpServlet {

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
         String id_producto = request.getParameter("prod_id");
        String producto_nombre = request.getParameter("prod_nombre");
        String producto_precio = request.getParameter("prod_precio");
        String producto_estado = request.getParameter("prod_estado");
        String producto_cantidad = request.getParameter("prod_cant");
        int valor = Integer.parseInt(request.getParameter("valor"));
        productosVO prodVO = new productosVO(id_producto, producto_nombre, producto_estado, producto_precio, producto_cantidad);
        productosDAO prodDAO = new productosDAO(prodVO);
        switch(valor){
            case 1: 
                if(prodDAO.agregarRegistro()){
                    request.setAttribute("mensaExito", "el producto se registro correctamente");
                
                }else{
                    request.setAttribute("mensaError", "el producto NO se registro correctamente");
                }
                request.getRequestDispatcher("view/Administrador.jsp").forward(request, response);
                break;
            case 2:
                if(prodDAO.actualizarRegistro()){
                    request.setAttribute("mensExito", "el producto se actualizo correctamente");
                }else{
                    request.setAttribute("mensError", "el producto no se pudo actualizar");
                }
                 request.getRequestDispatcher("view/Administrador.jsp").forward(request, response);
                break;
            case 3: 
                //reporte ventas
                request.getRequestDispatcher("reportes.jsp").forward(request, response);
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

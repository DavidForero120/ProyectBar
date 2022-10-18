/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ProductoDAO;
import ModeloVO.ProductoVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alrod
 */
@WebServlet(name = "ProductoControlador", urlPatterns = {"/Producto"})
public class ProductoControlador extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        String id_producto = request.getParameter("prod_id");
        String producto_nombre = request.getParameter("prod_nombre");
        String producto_precio = request.getParameter("prod_precio");
        String producto_estado = request.getParameter("prod_estado");
        String producto_cantidad = request.getParameter("prod_cant");
        int valor = Integer.parseInt(request.getParameter("valor"));
        
        ProductoVO prodVO = new ProductoVO();
        ProductoDAO prodDAO = new ProductoDAO();
        
        
        switch(valor){
            case 1: //Registrar Producto
                if(prodDAO.agregarRegistro()){
                    request.setAttribute("mensajeExito", "el producto se registro correctamente");
                
                }else{
                    request.setAttribute("mensajeError", "el producto NO se registro correctamente");
                }
                request.getRequestDispatcher("producto.jsp").forward(request, response);
                break;
            case 2://Consultar por Nombre
                
                prodVO = prodDAO.buscarQ(producto_nombre);
                if (prodVO != null){
                    request.setAttribute("consultaNombre", prodVO);
                    request.getRequestDispatcher("GenerarVenta.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "el producto no se pudo encontrar");
                    request.getRequestDispatcher("GenerarVenta.jsp").forward(request, response);
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

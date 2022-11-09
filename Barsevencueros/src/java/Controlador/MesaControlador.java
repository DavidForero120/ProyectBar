/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.MesaDAO;
import ModeloVO.MesaVO;
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
@WebServlet(name = "MesaControlador", urlPatterns = {"/Mesa"})
public class MesaControlador extends HttpServlet {

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
        String id_mesa = request.getParameter("id");
        String mesa_numero = request.getParameter("numero");
        String mesa_estado = request.getParameter("estado");
        
        int valor = Integer.parseInt(request.getParameter("valor"));
        
        MesaVO mesaVO = new MesaVO(id_mesa, mesa_numero, mesa_estado);
        
        MesaDAO mesaDAO = new MesaDAO(mesaVO);
        
        switch(valor){
            case 1://Agregar Mesa
                    if(mesaDAO.agregarRegistro()){
                        request.setAttribute("mensajeExito", "La mesa se registro correctamente");
                    }else{
                        request.setAttribute("mensajeError", "La mesa no se registro correctamente, puede que ya exista.");
                    }
                    request.getRequestDispatcher("view/Administrador.jsp").forward(request, response);
                break;
            case 2://Actualizar Mesa
                
                    if(mesaDAO.actualizarRegistro()){
                        request.setAttribute("menssegeExito", "La mesa se actualizo correctamente");
                    }else{
                        request.setAttribute("menssegeError", "La mesa NO se actualizo correctamente");
                    }
                    request.getRequestDispatcher("view/Administrador.jsp").forward(request, response);
                break;
            case 3://Consultar Mesa
                    mesaVO = mesaDAO.consultarMesa(id_mesa);

                if (mesaVO != null){
                    request.setAttribute("datosConsultados", mesaVO);
                    request.getRequestDispatcher("actualizarMesa.jsp").forward(request, response);
                } else {
                    request.setAttribute("msError", "La mesa no se pudo encontrar");
                    request.getRequestDispatcher("registroMesa.jsp").forward(request, response);
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
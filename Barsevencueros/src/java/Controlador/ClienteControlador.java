/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ClienteDAO;
import ModeloDAO.ProductoDAO;
import ModeloVO.ClienteVO;
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
@WebServlet(name = "ClienteControlador", urlPatterns = {"/Cliente"})
public class ClienteControlador extends HttpServlet {
    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String id_cliente = request.getParameter("cliente_id");
        String numero_documento = request.getParameter("cliente_documento");
        String cliente_nombre = request.getParameter("cliente_nombre");
        String cliente_apellido = request.getParameter("cliente_apellido");
        String cliente_estado = request.getParameter("cliente_estado");
        String cliente_correo = request.getParameter("cliente_correo");
        String fecha_nacimiento = request.getParameter("cliente_nacimiento");
        String tipo_documento = request.getParameter("cliente_tipo");
     
        int valor = Integer.parseInt(request.getParameter("valor"));
        
        ClienteVO cliVO = new ClienteVO(id_cliente, numero_documento, cliente_nombre, cliente_apellido, cliente_estado, cliente_correo, fecha_nacimiento, tipo_documento);
        
        ClienteDAO cliDAO = new ClienteDAO(cliVO);
        
        switch(valor){
        
            case 1://Registrar CLiente
                if(cliDAO.agregarRegistro()){
                    request.setAttribute("mensajeExito", "el cliente se registro correctamente");
                }else{
                    request.setAttribute("mensajeExito", "el cliente NO se registro correctamente");
                }
                request.getRequestDispatcher("listarCliente.jsp").forward(request, response);
                break;
            case 2://Actualizar Cliente
                    if(cliDAO.actualizarRegistro()){
                        request.setAttribute("mensajeExito", "El cliente se actualizo correctamente");
                    }else{
                        request.setAttribute("mensajeError", "el cliente NO se actualizo correctamente");
                    }
                    request.getRequestDispatcher("listarCliente.jsp").forward(request, response);
                break;
            case 3://Consultar Cliente
                    cliVO = cliDAO.consultarCliente(id_cliente);
                if (cliVO != null){
                    request.setAttribute("datosConsultados", cliVO);
                    request.getRequestDispatcher("actualizarCliente.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "el cliente no se pudo encontrar");
                    request.getRequestDispatcher("listarCliente.jsp").forward(request, response);
                }
                break;
            case 4://Consultar por Documento
                cliVO = cliDAO.buscar(numero_documento);
                if (cliVO != null){
                    request.setAttribute("consultaDocumento", cliVO);
                    request.getRequestDispatcher("GenerarVenta.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "el cliente no se pudo encontrar");
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

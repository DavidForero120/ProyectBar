/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.RolDAO;
import ModeloDAO.UsuarioDAO;
import ModeloVO.RolVO;
import ModeloVO.UsuarioVO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * Daniel
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/Usuario"})
public class UsuarioControlador extends HttpServlet {

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
        String usuario_nombre = request.getParameter("usuario_nombre");
        String usuario_password = request.getParameter("usuario_password");
        //byte[] encript=DigestUtils.sha256("usuario_password");
        //String clavecifrada=String.valueOf(encript);
        String usuario_apellido = request.getParameter("usuario_apellido");
        String usuario_estado = request.getParameter("usuario_estado");
        String id_usuario = request.getParameter("id_usuario");
        String id_rolFK = request.getParameter("rol");

        int valor = Integer.parseInt(request.getParameter("valor"));

        UsuarioVO usuVO = new UsuarioVO(id_usuario, usuario_nombre, usuario_apellido,usuario_password /*, clavecifrada*/, usuario_estado, id_rolFK);

        UsuarioDAO usuDAO = new UsuarioDAO(usuVO);

        switch (valor) {
            case 1://Iniciar sesi??n

                if (usuDAO.inicioSesion(usuario_nombre, usuario_password)) {
                    HttpSession misesion = request.getSession(true);
                    usuVO = new UsuarioVO(id_usuario, usuario_nombre, usuario_apellido, usuario_password, usuario_estado, id_rolFK);
                    misesion.setAttribute("datosUsuario", usuVO);

                    RolDAO rolDAO = new RolDAO();
                    RolVO rolVO = new RolVO();

                    ArrayList<RolVO> listaRol = rolDAO.listar(usuario_nombre);
                    for (int i = 0; i < listaRol.size(); i++) {
                        rolVO = listaRol.get(i);
                    }
                    String roltipo = rolVO.getTipo_rol();

                    if (roltipo.equals("Administrador")) {
                        request.getRequestDispatcher("view/Administrador.jsp").forward(request, response);
                    } else if (roltipo.equals("Cajero")) {
                        request.getRequestDispatcher("view/Cajero.jsp").forward(request, response);
                    } else if (roltipo.equals("Mesero")) {
                        request.getRequestDispatcher("view/Mesero.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("Error", "??Por favor, verifique sus datos de acceso!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

                break;
                
                case 2: //Agregar Registro
                 
                if (usuDAO.agregarRegistro()) {
                    request.setAttribute("Exito", "El usuario se registro correctamente");
                } else {
                    request.setAttribute("Error", "El usuario NO se registro correctamente");
                }
                request.getRequestDispatcher("view/Administrador.jsp").forward(request, response);
                break;
                
                case 3: //Actualizar Registro
                 
                if (usuDAO.actualizarRegistro()) {
                    request.setAttribute("Exito", "El usuario se actualizo correctamente");
                } else {
                    request.setAttribute("Error", "El usuario no se pudo actualizar");
                }
                request.getRequestDispatcher("view/Administrador.jsp").forward(request, response);
                break;
                
                case 4:
                    usuVO = usuDAO.consultarUsuario(id_usuario);
                    
                    if(usuVO != null){
                        request.setAttribute("datosConsultados", usuVO);
                        request.getRequestDispatcher("actualizarUsuario.jsp").forward(request, response);
                    } else {
                        request.setAttribute("msError", "El usuario no se pudo encontrar");
                        request.getRequestDispatcher("actualizarUsuario.jsp").forward(request, response);
                    }
                    
                    break;
                case 5:
                    request.getRequestDispatcher("view/Mesero.jsp").forward(request, response);
                    break;
                case 6:
                     request.getRequestDispatcher("view/Administrador.jsp").forward(request, response);
                    break;
                case 7:
                    request.getRequestDispatcher("view/Cajero.jsp").forward(request, response);
                    break;
                case 8:
                    request.getRequestDispatcher("pagar.jsp").forward(request, response);
                    break;
                case 9:
                    request.getRequestDispatcher("view/Mesero.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;
import ModeloDAO.ClienteDAO;
import ModeloDAO.PedidoDAO;
import ModeloDAO.ProductoDAO;
import ModeloDAO.desPedidoDAO;
import ModeloVO.ClienteVO;
import ModeloVO.PedidoVO;
import ModeloVO.ProductoVO;
import ModeloVO.desPedidoVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author alrod
 */
@WebServlet(name = "Pedido", urlPatterns = {"/Pedido"})
public class Pedido extends HttpServlet 
{
   ClienteVO cliVO = new ClienteVO();
   ClienteDAO cliDAO = new ClienteDAO();
   
   ProductoVO prodVO = new ProductoVO();
   ProductoDAO prodDAO = new ProductoDAO();
   
   PedidoVO pedVO = new PedidoVO();
   PedidoDAO pedDAO = new PedidoDAO();
   
   List<PedidoVO>lista = new ArrayList<>();
    int item = 0;
    String id_Producto, nombre_Producto;
    double precio, subtotal;
    int cantidad_producto;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        String menu = request.getParameter("menu");
        
        
        if(menu.equals("NuevaVenta"))
        {
            switch(accion)
            {
                case "RegistroCliente":
                String dni = request.getParameter("cliente_documento");
                cliVO.setNumero_documento(dni);
                cliVO = cliDAO.buscar(dni);
                request.setAttribute("cliente", cliVO);
                
                case "RegistrarProducto":
                    String id = request.getParameter("id_producto");
                    prodVO.setId_producto(id);
                    prodVO = prodDAO.buscarQ(id);
                    request.setAttribute("cliente", cliVO);
                    request.setAttribute("pr", prodVO);
                    request.setAttribute("lista", lista);
                    break;
                
                case "AgregarQ":
                    item=item+1;
                    id_Producto=prodVO.getId_producto();
                    nombre_Producto = prodVO.getProducto_nombre();
                    precio = prodVO.getProducto_precio();
                    cantidad_producto = Integer.parseInt(request.getParameter("cantidad"));
                    subtotal= precio;
                    pedVO=new PedidoVO();
                    pedVO.setItem(item);
                    pedVO.setId_producto(id_Producto);
                    pedVO.setNombre_Producto(nombre_Producto);
                    pedVO.setPrecio(precio);
                    //pedVO.setCantidad_producto(cantidad_producto);
                    pedVO.setSubtotal(subtotal);
                    
                    lista.add(pedVO);
                    request.setAttribute("lista", lista);
                    request.setAttribute("cliente", cliVO);
                 break;
                
                default:
                request.getRequestDispatcher("GenerarVenta.jsp").forward(request, response);
                
            }
            request.getRequestDispatcher("GenerarVenta.jsp").forward(request, response);
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

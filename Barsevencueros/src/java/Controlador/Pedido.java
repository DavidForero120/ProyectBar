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
public class Pedido extends HttpServlet {

    ClienteVO cliVO = new ClienteVO();
    ClienteDAO cliDAO = new ClienteDAO();

    ProductoVO prodVO = new ProductoVO();
    ProductoDAO prodDAO = new ProductoDAO();

    PedidoVO pedVO = new PedidoVO();
    PedidoDAO pedDAO = new PedidoDAO();

    List<PedidoVO> lista = new ArrayList<>();
    int item = 0;
    String id_Producto, nombre_Producto;
    double precio, subtotal, total;
    int cantidad_producto;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");
        String menu = request.getParameter("menu");

        if (menu.equals("NuevaVenta")) {
            switch (accion) {
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
                    request.setAttribute("totalPaga", total);

                    break;

                case "AgregarQ":
                    total = 0.0;
                    item = item + 1;
                    id_Producto = prodVO.getId_producto();
                    nombre_Producto = prodVO.getProducto_nombre();
                    precio = prodVO.getProducto_precio();
                    cantidad_producto = Integer.parseInt(request.getParameter("cantidad"));
                    subtotal = precio * cantidad_producto;

                    pedVO = new PedidoVO();
                    pedVO.setItem(item);
                    pedVO.setId_producto(id_Producto);
                    pedVO.setNombre_Producto(nombre_Producto);
                    pedVO.setPrecio(precio);
                    pedVO.setCantidad_producto(cantidad_producto);
                    pedVO.setSubtotal(subtotal);
                    lista.add(pedVO);
                    for (int i = 0; i < lista.size(); i++) {
                        total = total + lista.get(i).getSubtotal();
                        System.out.println(total);

                    }

                    request.setAttribute("totalPaga", total);
                    request.setAttribute("lista", lista);
                    request.setAttribute("cliente", cliVO);
                    break;
                case "GenerarPedido":
                    //Guardar Pedido Cabecero
                    String id_usu = request.getParameter("id_usuario");
                    String idCliente = request.getParameter("idCliente");
                    String mesaFK = request.getParameter("mesaFK");
                    int metodoPago = Integer.parseInt(request.getParameter("metodoPago"));

                    pedVO.setId_usuarioFK(id_usu);
                    pedVO.setId_Cliente(idCliente);
                    pedVO.setMesaFK(mesaFK);
                    pedVO.setSubtotal(subtotal);
                    pedVO.setEstado("1");
                    pedVO.setMetodo_pago(metodoPago);
                    pedDAO.guardarVenta(pedVO);
                    //Guardar Pedido Lineas

                    int idPedido = pedDAO.idPedido();
                    for (int i = 0; i < lista.size(); i++) {
                        pedVO = new PedidoVO();
                        pedVO.setId_Pedido(idPedido);
                        pedVO.setId_producto(lista.get(i).getId_producto());
                        pedVO.setCantidad_producto(lista.get(i).getCantidad_producto());
                        pedVO.setTotal(total);
                        pedDAO.Agregardespedido(pedVO);
                    }

                    request.getRequestDispatcher("GenerarVenta.jsp").forward(request, response);
                    break;
                case "Eliminar":
                    pedVO = new PedidoVO();
                    String id_producto = pedVO.getId_producto();
                    for (int i = 0; i < lista.size(); i++) {
                        id_producto = lista.get(i).getId_producto();
                    }                   
                    pedDAO.eliminarRegister(id_producto);

                    if (prodVO != null) {
                        request.setAttribute("mensajeExito", "Se ha eliminado correctamente");

                    } else {
                        request.setAttribute("mensajeError", "No se ha eliminado correctamente");
                    }
                    request.getRequestDispatcher("GenerarVenta.jsp").forward(request, response);
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

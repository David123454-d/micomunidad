/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.EventoDAO;
import VO.EventoVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Camilo
 */
@WebServlet(name = "EventoControlador", urlPatterns = {"/EventoControlador"})
public class EventoControlador extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                    int op = Integer.parseInt(request.getParameter("opcion"));
        
            String evenNombre = request.getParameter("txtNombre");
            String evenDesc = request.getParameter("txtDesc");
            String evenFecha = request.getParameter("txtFecha");
            String evenHora_inicio = request.getParameter("txtHInicio");
            String evenHora_finalizacion = request.getParameter("txtHFinal");
            String evenLugar = request.getParameter("txtLugar");
            String evenEstado = request.getParameter("txtEstado");
            String evenUsuario = request.getParameter("txtUsuario");
            String columna = request.getParameter("columnatxt");
            String columnadrop = request.getParameter("coldrop");
            String idEvento = request.getParameter("txtID");

           EventoVO evenVO = new EventoVO(idEvento,evenNombre, evenDesc, evenFecha, evenHora_inicio, evenHora_finalizacion, evenLugar, evenEstado, evenUsuario);
           EventoDAO evenDAO = new EventoDAO(evenVO);
        
            switch(op){
                case 1:
                    if(evenDAO.validarEventos()){
                        if (evenDAO.validarLugar()) {
                            if (evenDAO.agregarRegistro()) {
                                if(evenDAO.actLugar(evenLugar)){
                                    request.setAttribute("Exitoso", "Evento ingresado correctamente");
                                }else{
                                    request.setAttribute("Error", "Hubo un error al solicitar el lugar, intente nuevamente");
                                }                            
                            }else{
                            request.setAttribute("Error", "Hubo un error al intentar ingresar el evento, intente nuevamente");
                            }
                        }
                        else{
                            request.setAttribute("Error", "El lugar ya se encuentra prestado.");
                        }
                        request.getRequestDispatcher("consultarEvento.jsp").forward(request, response);
                    }else{
                        request.setAttribute("Error", "El usuario ya tiene un evento en proceso o activo");
                    }
                    request.getRequestDispatcher("consultarEvento.jsp").forward(request, response);
                    break;
                case 4:
                    if (evenDAO.actualizarRegistro()){
                        if (evenDAO.actLugarD(evenLugar)) {
                            request.setAttribute("Exitoso", "Evento eliminado correctamente");
                        }else{
                            request.setAttribute("Error", "Hubo un error al intentar eliminar el evento, intente nuevamente");
                        }                        
                    }else{
                        request.setAttribute("Error", "Hubo un error al intentar eliminar el evento, intente nuevamente");
                    }
                    request.getRequestDispatcher("consultarEvento.jsp").forward(request, response);
                    break;
                case 3:
                    if(evenDAO.actualizarRegistro()){
                        request.setAttribute("Exitoso", "Evento actualizado correctamente");
                    }else{
                            request.setAttribute("Error", "Hubo un error al intentar actualizar el evento, intente nuevamente");
                    }
                    request.getRequestDispatcher("consultarEvento.jsp").forward(request, response);
                    break;
                case 5:
                    request.setAttribute("columna", columna);
                    request.getRequestDispatcher("actualizarEvento.jsp").forward(request, response);
                    break;
                case 6:
                    request.setAttribute("columna", columnadrop);
                    request.getRequestDispatcher("actualizarEvento.jsp").forward(request, response);
                    break;
            }
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

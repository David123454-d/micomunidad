/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.prestamoDAO;
import VO.prestamoVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(name = "prestamoControlador", urlPatterns = {"/prestamoControlador"})
public class prestamoControlador extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        int op = Integer.parseInt(request.getParameter("opcion"));
        
        String id_lugar = request.getParameter("txtLugar");
        String id_prestamo = request.getParameter("id");
        String tiempo = request.getParameter("txtTInicio");
        String TSalida = request.getParameter("txtTSalida");
        String fecha = request.getParameter("txtFecha");
        String descripcion = request.getParameter("txtDescripcion");
        String usuario = request.getParameter("txtusuario");
        String estado = request.getParameter("txtEstado");
        String columna = request.getParameter("columnatxt");
        String columnadrop = request.getParameter("cosldrop");
        
        
        prestamoVO preVO = new prestamoVO(id_lugar,id_prestamo,tiempo,fecha,descripcion,usuario,estado,TSalida);
        prestamoDAO preDAO = new prestamoDAO(preVO);
        
        switch(op){
            case 1:
                if (preDAO.agregarRegistro()) {
                    if (preDAO.actLugar(id_lugar)) {
                        request.setAttribute("Exitoso", "prestamo ingresado correctamente");
                    }else{
                        request.setAttribute("Error", "Hubo un error al intentar ingresar el prestamo, intente nuevamente");
                    }                    
                }else{
                    request.setAttribute("Error", "Hubo un error al intentar ingresar el prestamo, intente nuevamente");
                }
                request.getRequestDispatcher("consultarPrestamos.jsp").forward(request, response);
                break;
            case 4:                
                if (preDAO.actualizarRegistro()){
                    if (preDAO.actLugarD(id_lugar)) {
                        request.setAttribute("Exitoso", "prestamo eliminado correctamente");
                    }else{
                        request.setAttribute("Error", "Hubo un error al intentar eliminar el prestamo, intente nuevamente");
                    }                    
                    
                }else{
                    request.setAttribute("Error", "Hubo un error al intentar eliminar el prestamo, intente nuevamente");
                }
                request.getRequestDispatcher("consultarPrestamos.jsp").forward(request, response);
                break;
            case 3:
                if(preDAO.actualizarRegistro()){
                    request.setAttribute("Exitoso", "prestamo actualizado correctamente");
                }else{
                        request.setAttribute("Error", "Hubo un error al intentar actualizar el prestamo, intente nuevamente");
                }
                request.getRequestDispatcher("consultarPrestamos.jsp").forward(request, response);
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

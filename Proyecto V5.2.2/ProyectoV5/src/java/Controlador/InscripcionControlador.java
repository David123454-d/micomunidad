/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.InscripcionDAO;
import VO.InscripcionVO;
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
@WebServlet(name = "InscripcionControlador", urlPatterns = {"/Inscripcion"})
public class InscripcionControlador extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            int op = Integer.parseInt(request.getParameter("opcion"));
        
        String InsId = request.getParameter("txtId");
        String Descripcion = request.getParameter("txtDes");
        String Horario = request.getParameter("txtHora");
        String id_curso = request.getParameter("txtIDC");
        String id_datos = request.getParameter("txtIDD");
        
        InscripcionVO InsVO = new InscripcionVO(InsId, Descripcion, Horario, id_curso, id_datos);
        InscripcionDAO InsDAO = new InscripcionDAO(InsVO);
        
        switch(op){
            case 1:
                if(InsDAO.validarInsc()){
                    if (InsDAO.agregarRegistro()) {
                       request.setAttribute("Exitoso", "Inscripcion ingresada correctamente");
                    }else{
                        request.setAttribute("Error", "Hubo un error al intentar ingresar la Inscripcion, intente nuevamente");
                    }
                }else{
                    request.setAttribute("Error", "El usuario ya se encuentra inscrito o en proceso para un curso");
                }
                request.getRequestDispatcher("consultarInscripciones.jsp").forward(request, response);
                break;
            case 2:
                if (InsDAO.actualizarRegistro()) {
                    request.setAttribute("Exitoso", "Inscripcion actualizada correctamente");
                }else{
                    request.setAttribute("Error", "Hubo un error al intentar actualizar la Inscripcion, intente nuevamente");
                }
                request.getRequestDispatcher("consultarInscripciones.jsp").forward(request, response);
                break;
            case 4:
                if (InsDAO.eliminarRegistro()){
                    request.setAttribute("Exitoso", "Estado actulizado correctamente");
                }else{
                    request.setAttribute("Error", "Hubo un error al intentar actulizar el estado la Inscripcion, intente nuevamente");
                }
                request.getRequestDispatcher("consultarInscripciones.jsp").forward(request, response);
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

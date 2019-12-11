/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.CursoDAO;
import VO.CursoVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author deman
 */
@WebServlet(name = "Curso", urlPatterns = {"/Curso"})
public class CursoControlador extends HttpServlet {

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
        
        String curID = request.getParameter("txtID");
        String curNombre = request.getParameter("txtNombre");
        String curDesc = request.getParameter("txtDesc");
        String curCupos = request.getParameter("txtCupos");
        String curDuracion = request.getParameter("txtDuracion");
        String curHorarios = request.getParameter("txtHorarios");
        String curCosto = request.getParameter("txtCosto");
        String curCertificado = request.getParameter("txtCertificado");
        String curInstitucion = request.getParameter("txtInstitucion");
        String curInstructor = request.getParameter("txtInstructor");
        String curLugar = request.getParameter("txtLugar");
        String curEstado = request.getParameter("txtEstado");
        
        CursoVO curVO = new CursoVO(curNombre, curDesc, curCupos, curDuracion, curHorarios, curCosto, curCertificado, curInstitucion, curInstructor, curLugar, curEstado, curID);
        CursoDAO curDAO = new CursoDAO(curVO);
        
        switch(op){
            case 1:
                if(curDAO.validarCurso()){
                    if(curDAO.validarLugar()){
                        if (curDAO.agregarRegistro()) {
                        request.setAttribute("Exitoso", "Curso ingresado correctamente");
                        }else{
                            request.setAttribute("Error", "Hubo un error al intentar ingresar el curso, intente nuevamente");
                        }
                        request.getRequestDispatcher("consultarCurso.jsp").forward(request, response);
                    }else{
                        request.setAttribute("Error", "No se puede dar dos cursos en el mismo lugar");
                    }   
                }else{
                    request.setAttribute("Error", "Ya existe un curso similar activo");
                }
                
                request.getRequestDispatcher("consultarCurso.jsp").forward(request, response);
                break;
            case 4:                
                if (curDAO.Eliminar(curID)){
                    request.setAttribute("Exitoso", "Curso eliminado correctamente");
                    
                }else{
                    request.setAttribute("Error", "Hubo un error al intentar eliminar el curso, intente nuevamente");
                }
                request.getRequestDispatcher("consultarCurso.jsp").forward(request, response);
                break;
            case 3:
                if(curDAO.actualizaRegistro(curID)){
                    request.setAttribute("Exitoso", "Curso actualizado correctamente");
                }else{
                        request.setAttribute("Error", "Hubo un error al intentar actualizar el curso, intente nuevamente");
                }
                request.getRequestDispatcher("consultarCurso.jsp").forward(request, response);
                break;
            case 5:
                //request.setAttribute("columna", columna);
                request.getRequestDispatcher("actualizarCurso.jsp").forward(request, response);
                break;
            case 6:
                //request.setAttribute("columna", columnadrop);
                request.getRequestDispatcher("eliminarCurso.jsp").forward(request, response);
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

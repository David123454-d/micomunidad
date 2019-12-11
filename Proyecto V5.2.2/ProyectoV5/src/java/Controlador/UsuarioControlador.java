/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.UsuarioDAO;
import VO.UsuarioVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author APRENDIZ
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
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            int op = Integer.parseInt(request.getParameter("opcion"));
        
        String usuario = request.getParameter("txtUsu");
        String contraseña = request.getParameter("txtCla");
        String pass2 = request.getParameter("txtCla2");
        String columna = request.getParameter("columnatxt");
        String Estado = request.getParameter("estadotxt");
        UsuarioVO usuVO = new UsuarioVO(usuario, contraseña, Estado);
        UsuarioDAO usuDAO = new UsuarioDAO(usuVO);
        
        switch(op){
            case 1:
                if (usuDAO.agregarRegistro()) {
                    request.setAttribute("Exitoso", "Usuario ingresado correctamente");
                }else{
                    request.setAttribute("Error", "Hubo un error al intentar ingresar el usuario, intente nuevamente");
                }               
                request.getRequestDispatcher("usuario.jsp").forward(request, response);
                break;
            case 2:
                if (usuDAO.actualizarRegistro()) {
                    request.setAttribute("Exitoso", "Usuario actualizado correctamente");
                }else{
                    request.setAttribute("Error", "Hubo un error al intentar actualizar el usuario, intente nuevamente");
                }
                request.getRequestDispatcher("consultarUsuario.jsp").forward(request, response);
                break;
            case 4:
                if (usuDAO.eliminarRegistro()){
                    request.setAttribute("Exitoso", "Usuario eliminado correctamente");
                }else{
                    request.setAttribute("Error", "Hubo un error al intentar eliminar el curso, intente nuevamente");
                }
                request.getRequestDispatcher("usuario.jsp").forward(request, response);
                break;            
            case 5:
                if(contraseña.equals(pass2)){
                    if (usuDAO.agregarRegistro()) {
                        request.setAttribute("Exitoso", "Usuario ingresado correctamente");
                    }else{
                        request.setAttribute("Error", "Hubo un error al intentar ingresar el usuario, intente nuevamente");
                    }
                }else{
                    request.setAttribute("Error", "Las contraseñas no son iguales, intentelo nuevamente");
                    request.setAttribute("datos", usuVO);
                }                
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                break;
            case 6:
                if (usuDAO.validarAcceso()) {
                    HttpSession sesion = request.getSession(true);
                    UsuarioVO usvo = new UsuarioVO(usuario);
                    sesion.setAttribute("usuario", usvo);
                    request.getRequestDispatcher("menu.jsp").forward(request, response);
                }else{
                    request.setAttribute("Error", "Usuario y/o contraseñas incorrectos");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                break;
            case 7:
                    request.setAttribute("columna", columna);
                    request.getRequestDispatcher("actualizarUsuario.jsp").forward(request, response);
                break;
            case 8:
                    request.setAttribute("columna", columna);
                    request.getRequestDispatcher("eliminarUsuario.jsp").forward(request, response);
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

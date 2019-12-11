package Controlador;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Controlador.propiedadesCorreo;
import DAO.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(urlPatterns = {"/envioCorreo"})
public class envioCorreo extends HttpServlet {

    private String host, puerto, usuario, clave;

    public void init() {
        ServletContext contexto = getServletContext();

        host = contexto.getInitParameter("host");
        puerto = contexto.getInitParameter("puerto");
        usuario = contexto.getInitParameter("usuario");
        clave = contexto.getInitParameter("clave");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String receptor = request.getParameter("receptor");
        UsuarioDAO usDAO = new UsuarioDAO();
        String pass = usDAO.solicitarPass(receptor);
        
        String asunto = "Solicitud de recuperación de contraseña";
        String contenido = "El administrador ha atendido su solicitud de recuperación de contraseña por lo que en este correo le adjunta su contraseña \n Su contraseña es: "+pass;
        
        
        String resultado ="";
        
        try {
            propiedadesCorreo.envioCorreo(host, puerto, usuario, clave, receptor, asunto, contenido);
            resultado = "El mensaje se envió correctamente.";
        } catch (Exception e) {
            System.out.println("Error al enviar en mensaje" + e.toString());
            
            
        }finally{
            
            request.setAttribute("Exitoso", resultado);
            request.getRequestDispatcher("consultarUsuario.jsp").forward(request, response);
        }
    }
    

}

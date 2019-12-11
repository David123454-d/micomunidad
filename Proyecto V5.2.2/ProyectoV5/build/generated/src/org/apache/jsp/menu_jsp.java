package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import DAO.InformacionU_DAO;
import VO.InformacionU_VO;
import VO.UsuarioVO;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

    HttpSession miSesion = (HttpSession)request.getSession();
    UsuarioVO usuoVO = (UsuarioVO)miSesion.getAttribute("usuario");
    if(usuoVO != null){
    }else{
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } 
    
    if(miSesion.getAttribute("usuario")==null){
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    if(miSesion==null){
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    boolean bandera = false;
    InformacionU_VO iuVO = new InformacionU_VO();
    InformacionU_DAO iuDAO = new InformacionU_DAO(iuVO);
    
    
    
    /*if(iuDAO.validarDatosU(usuoVO.getUsuario())){
        bandera = true;
    }*/

    
    ArrayList<InformacionU_VO>listarrol = iuDAO.listarRol(usuoVO.getUsuario());
    
    String rol ="";
    
    for (int i = 0; i < listarrol.size(); i++) {
       iuVO = listarrol.get(i);
       rol = iuVO.getInfrol();
    }

      out.write("\n");
      out.write("<!--\n");
      out.write("\n");
      out.write("=========================================================\n");
      out.write("* Argon Dashboard - v1.1.0\n");
      out.write("=========================================================\n");
      out.write("\n");
      out.write("* Product Page: https://www.creative-tim.com/product/argon-dashboard\n");
      out.write("* Copyright 2019 Creative Tim (https://www.creative-tim.com)\n");
      out.write("* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)\n");
      out.write("\n");
      out.write("* Coded by Creative Tim\n");
      out.write("\n");
      out.write("=========================================================\n");
      out.write("\n");
      out.write("* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\" />\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("  <title>\n");
      out.write("    Menu\n");
      out.write("  </title>\n");
      out.write("  <!-- Favicon -->\n");
      out.write("  <link href=\"./assets/img/brand/favicon.png\" rel=\"icon\" type=\"image/png\">\n");
      out.write("  <!-- Fonts -->\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700\" rel=\"stylesheet\">\n");
      out.write("  <!-- Icons -->\n");
      out.write("  <link href=\"./assets/js/plugins/nucleo/css/nucleo.css\" rel=\"stylesheet\" />\n");
      out.write("  <link href=\"./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" />\n");
      out.write("  <!-- CSS Files -->\n");
      out.write("  <link href=\"./assets/css/argon-dashboard.css?v=1.1.0\" rel=\"stylesheet\" />\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body class=\"\">\n");
      out.write("  <nav class=\"navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white\" id=\"sidenav-main\">\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("      <!-- Toggler -->\n");
      out.write("      <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#sidenav-collapse-main\" aria-controls=\"sidenav-main\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("        <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("      </button>\n");
      out.write("      <!-- Brand -->\n");
      out.write("      <a class=\"navbar-brand pt-0\" href=\"menu.jsp\">\n");
      out.write("        <img src=\"./assets/img/brand/blue.png\" class=\"navbar-brand-img\" alt=\"...\">\n");
      out.write("      </a>\n");
      out.write("      <!-- User -->\n");
      out.write("      <ul class=\"nav align-items-center d-md-none\">\n");
      out.write("        \n");
      out.write("        \n");
      out.write("      </ul>\n");
      out.write("      <!-- Collapse -->\n");
      out.write("      <div class=\"collapse navbar-collapse\" id=\"sidenav-collapse-main\">\n");
      out.write("        <!-- Collapse header -->\n");
      out.write("        <div class=\"navbar-collapse-header d-md-none\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-6 collapse-brand\">\n");
      out.write("              <a href=\"./index.html\">\n");
      out.write("                <img src=\"./assets/img/brand/blue.png\">\n");
      out.write("              </a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-6 collapse-close\">\n");
      out.write("              <button type=\"button\" class=\"navbar-toggler\" data-toggle=\"collapse\" data-target=\"#sidenav-collapse-main\" aria-controls=\"sidenav-main\" aria-expanded=\"false\" aria-label=\"Toggle sidenav\">\n");
      out.write("                <span></span>\n");
      out.write("                <span></span>\n");
      out.write("              </button>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("       \n");
      out.write("        <!-- Navigation -->\n");
      out.write("\n");
      out.write("        <ul class=\"navbar-nav\">\n");
      out.write("          ");

              if(rol.equals("Administrador")){
          
      out.write("\n");
      out.write("          <li class=\"nav-item\">\n");
      out.write("          <a class=\"nav-link\" href=\" ./consultarUsuario.jsp\" target=\"here\"> <i class=\"ni ni-single-02 text-success\"></i> Usuario\n");
      out.write("            </a>\n");
      out.write("          </li>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("          <li class=\"nav-item\">\n");
      out.write("            <a class=\"nav-link \" href=\"./consultarEvento.jsp\" target=\"here\">\n");
      out.write("              <i class=\"ni ni-tag text-success\"></i> Eventos\n");
      out.write("            </a>\n");
      out.write("          </li>\n");
      out.write("\n");
      out.write("          <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link \" href=\"./consultarCurso.jsp\" target=\"here\">\n");
      out.write("              <i class=\"ni ni-single-copy-04 text-success\"></i> Cursos\n");
      out.write("            </a>\n");
      out.write("          </li>\n");
      out.write("          <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link \" href=\"./consultarInscripciones.jsp\" target=\"here\">\n");
      out.write("              <i class=\"ni ni-archive-2 text-success\"></i> Inscripciones\n");
      out.write("            </a>\n");
      out.write("          </li> \n");
      out.write("\n");
      out.write("          <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link\" href=\"./consultarPrestamos.jsp\" target=\"here\">\n");
      out.write("              <i class=\"ni ni-key-25 text-success\"></i> Prestamo\n");
      out.write("            </a>\n");
      out.write("          </li>\n");
      out.write("          \n");
      out.write("          <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link\" href=\"./consultarLugares.jsp\" target=\"here\">\n");
      out.write("              <i class=\"ni ni-pin-3 text-success\"></i> Lugares\n");
      out.write("            </a>\n");
      out.write("          </li>\n");
      out.write("          <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link\" href=\"./chat.jsp\" target=\"here\">\n");
      out.write("              <i class=\"ni ni-email-83 text-success\"></i> Chat\n");
      out.write("            </a>\n");
      out.write("          </li>\n");
      out.write("          <hr class=\"my-3\">\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link\" href=\"./Sesiones\">\n");
      out.write("              <i class=\"ni ni-lock-circle-open\"></i> Cerrar Sesión\n");
      out.write("            </a>\n");
      out.write("          </li>\n");
      out.write("        </ul>\n");
      out.write("        <!-- Divider -->\n");
      out.write("        <hr class=\"my-3\">\n");
      out.write("        <!-- Heading -->\n");
      out.write("        \n");
      out.write("        <!-- Navigation -->\n");
      out.write("        \n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </nav>\n");
      out.write("    <div class=\"main-content\">\n");
      out.write("        ");
if (bandera) {
      out.write("\n");
      out.write("            <iframe src=\"informacio.jsp\" name=\"here\" style=\"width: 100%; height: 980px;\" frameborder=\"0\"></iframe>\n");
      out.write("        ");
}else{
      out.write("\n");
      out.write("            <iframe src=\"info.jsp\" name=\"here\" style=\"width: 100%; height: 980px;\" frameborder=\"0\"></iframe>\n");
      out.write("        ");
}
      out.write("                                        \n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <!--   Core   -->\n");
      out.write("  <script src=\"./assets/js/plugins/jquery/dist/jquery.min.js\"></script>\n");
      out.write("  <script src=\"./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("  <!--   Optional JS   -->\n");
      out.write("  <script src=\"./assets/js/plugins/chart.js/dist/Chart.min.js\"></script>\n");
      out.write("  <script src=\"./assets/js/plugins/chart.js/dist/Chart.extension.js\"></script>\n");
      out.write("  <!--   Argon JS   -->\n");
      out.write("  <script src=\"./assets/js/argon-dashboard.min.js?v=1.1.0\"></script>\n");
      out.write("  <script src=\"https://cdn.trackjs.com/agent/v3/latest/t.js\"></script>\n");
      out.write("  <script>\n");
      out.write("    window.TrackJS &&\n");
      out.write("      TrackJS.install({\n");
      out.write("        token: \"ee6fab19c5a04ac1a32a645abde4613a\",\n");
      out.write("        application: \"argon-dashboard-free\"\n");
      out.write("      });\n");
      out.write("  </script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

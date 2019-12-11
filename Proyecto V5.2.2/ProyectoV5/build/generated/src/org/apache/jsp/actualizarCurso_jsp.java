package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import DAO.CursoDAO;
import VO.CursoVO;

public final class actualizarCurso_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <title>Gestionar Curso</title>\n");
      out.write("        <!-- Bootstrap CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/vendor/bootstrap/css/bootstrap.min.css\">\n");
      out.write("        <link href=\"assets/vendor/fonts/circular-std/style.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/libs/css/style.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/vendor/fonts/fontawesome/css/fontawesome-all.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/vendor/datepicker/tempusdominus-bootstrap-4.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/vendor/inputmask/css/inputmask.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"dashboard-wrapper\">\n");
      out.write("            <div class=\"container-fluid dashboard-content\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-xl-10\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12\">\n");
      out.write("                            <div class=\"section-block\" id=\"basicform\">\n");
      out.write("                                <h3 class=\"section-title\">Gestionar Curso</h3>                    \n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                ");

                                    CursoVO CurVO = new CursoVO();
                                    CursoDAO CurDAO = new CursoDAO();

                                    ArrayList<CursoVO> listar = CurDAO.listar();
                                    //if(request.getAttribute("columna") != null){
                                    //String ad = request.getAttribute("columna").toString();
                                        
                                
      out.write("\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <form method=\"post\" action=\"Curso\" autocomplete=\"off\">\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"nm\" class=\"col-form-label\">Ingrese el nombre del curso: </label>\n");
      out.write("                                        <input type=\"text\" name=\"txtNombre\" id=\"nm\" class=\"form-control\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"dec\" class=\"col-form-label\">Ingrese una descripcion del curso:</label>\n");
      out.write("                                        <textarea name=\"txtDesc\" id=\"dec\" class=\"form-control\"></textarea>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"cups\" class=\"col-form-label\">Ingrese la cantidad de cupos: </label>\n");
      out.write("                                        <input type=\"number\" name=\"txtCupos\" id=\"cups\" class=\"form-control\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"time\" class=\"col-form-label\">Ingrese la duración del curso (Meses): </label>\n");
      out.write("                                        <input type=\"text\" name=\"txtDuracion\" id=\"time\" class=\"form-control\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"hr\" class=\"col-form-label\">Ingrese el horario </label>\n");
      out.write("                                        <select name=\"txtHorarios\" id=\"hr\" class=\"form-control\">\n");
      out.write("                                            <option value=\"Diurno\">Diurno</option>\n");
      out.write("                                            <option value=\"Tarde\">Tarde</option>\n");
      out.write("                                        </select>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"hr\" class=\"col-form-label\">Ingrese el estado del curso </label>\n");
      out.write("                                        <select name=\"txtEstado\" id=\"hr\" class=\"form-control\">\n");
      out.write("                                            <option value=\"Activo\">Activo</option>\n");
      out.write("                                            <option value=\"Inactivo\">Inactivo</option>\n");
      out.write("                                        </select>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");

                                    //}
                                    
      out.write("\n");
      out.write("                                    <input type=\"hidden\" value=\"3\" name=\"opcion\">\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary btn-lg btn-block\">Ingresar curso</button>    \n");
      out.write("                                </form>\n");
      out.write("                                ");

                                    if(request.getAttribute("Error")!= null){
                                    
      out.write("        \n");
      out.write("                                        <p class=\"Error\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                                    ");
}else if(request.getAttribute("Exitoso")!= null){
      out.write("\n");
      out.write("                                        <p>Nisuuuuuuuuuuuuuuuuuuuu</p>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    </div>  \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>         \n");
      out.write("        <script src=\"assets/vendor/jquery/jquery-3.3.1.min.js\"></script>\n");
      out.write("        <script src=\"assets/vendor/bootstrap/js/bootstrap.bundle.js\"></script>\n");
      out.write("        <script src=\"assets/vendor/slimscroll/jquery.slimscroll.js\"></script>\n");
      out.write("        <script src=\"assets/libs/js/main-js.js\"></script>\n");
      out.write("        <script src=\"assets/vendor/inputmask/js/jquery.inputmask.bundle.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

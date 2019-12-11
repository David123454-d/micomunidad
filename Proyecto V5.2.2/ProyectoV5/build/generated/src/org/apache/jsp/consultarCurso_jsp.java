package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import DAO.CursoDAO;
import VO.CursoVO;

public final class consultarCurso_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("                                <div class=\"card-body\">\n");
      out.write("                            <h1>Consultar Curso</h1>\n");
      out.write("                            <form action=\"Curso\" method=\"post\">\n");
      out.write("                                <table class=\"table table-striped\">\n");
      out.write("                                    <thead class=\"thead-dark\">\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th scope=\"col\">Nombre</th>\n");
      out.write("                                            <th scope=\"col\">Descripción</th>\n");
      out.write("                                            <th scope=\"col\">Cupos</th>\n");
      out.write("                                            <th scope=\"col\">Duración</th>\n");
      out.write("                                            <th scope=\"col\">Horarios</th>\n");
      out.write("                                            <th scope=\"col\">Estado</th>\n");
      out.write("                                            <th scope=\"col\">Opciones</th>\n");
      out.write("                                        </tr>\n");
      out.write("                                    </thead>\n");
      out.write("                                    ");

                                        CursoVO CurVO = new CursoVO();
                                        CursoDAO CurDAO = new CursoDAO();

                                        ArrayList<CursoVO> listar = CurDAO.listar();

                                        for(int i = 0; i<listar.size(); i++){
                                            CurVO = listar.get(i);
                                    
      out.write("\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>");
      out.print(CurVO.getCurNombre());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(CurVO.getCurDesc());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(CurVO.getCurCupos());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(CurVO.getCurDuracion());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(CurVO.getCurHorarios());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(CurVO.getCurEstado());
      out.write("</td>\n");
      out.write("                                    <form action=\"Curso\" method=\"post\">\n");
      out.write("                                        <td><button type=\"submit\" class=\"btn btn-xs btn-warning\">");
      out.print(i);
      out.write("Editar</button><span>   </span><button type=\"submit\" class=\"btn btn-xs btn-danger\">Eliminar</button></td>\n");
      out.write("                                        <input type=\"hidden\" name=\"opcion\" value=\"5\">\n");
      out.write("                                        <input type=\"hidden\" name=\"columnatxt\" value=\"");
      out.print(i);
      out.write("\">\n");
      out.write("                                    </form>\n");
      out.write("                                    </tr>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                </table>\n");
      out.write("                            </form> \n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    </div>  \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>  \n");
      out.write("        <script src=\"assets/vendor/jquery/jquery-3.3.1.min.js\"></script>\n");
      out.write("        <script src=\"assets/vendor/bootstrap/js/bootstrap.bundle.js\"></script>\n");
      out.write("        <script src=\"assets/vendor/slimscroll/jquery.slimscroll.js\"></script>\n");
      out.write("        <script src=\"assets/libs/js/main-js.js\"></script>\n");
      out.write("        <script src=\"assets/vendor/inputmask/js/jquery.inputmask.bundle.js\"></script> \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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

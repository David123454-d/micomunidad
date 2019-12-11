package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import DAO.CursoDAO;
import VO.CursoVO;

public final class ingresarCurso_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("    Cursos\n");
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
      out.write("    <div class=\"main-content\">\n");
      out.write("    <!-- Navbar -->\n");
      out.write("    <nav class=\"navbar navbar-top navbar-expand-md navbar-dark\" id=\"navbar-main\">\n");
      out.write("      <div class=\"container-fluid\">\n");
      out.write("        <!-- Brand -->\n");
      out.write("        <a class=\"h4 mb-0 text-white text-uppercase d-none d-lg-inline-block\" href=\"./index.html\">Ingresar Curso</a>\n");
      out.write("        <!-- Form -->\n");
      out.write("        \n");
      out.write("        <!-- User -->\n");
      out.write("        <ul class=\"navbar-nav align-items-center d-none d-md-flex\">\n");
      out.write("          \n");
      out.write("        </ul>\n");
      out.write("      </div>\n");
      out.write("    </nav>\n");
      out.write("    <!-- End Navbar -->\n");
      out.write("    <!-- Header -->\n");
      out.write("    <div class=\"header bg-gradient-success pb-8 pt-5 pt-md-8\">\n");
      out.write("      \n");
      out.write("    </div>\n");
      out.write("           \n");
      out.write("    <div class=\"container-fluid mt--7 mb-5\">\n");
      out.write("      <div class=\"row justify-content-center\">\n");
      out.write("        <div class=\"col-md-10\">\n");
      out.write("          <div class=\"card shadow\">\n");
      out.write("            <div class=\"card-header border-0\">\n");
      out.write("                <h2 class=\"mb-0\">Ingresar curso</h2>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"p-2 border-0 bg-light-neutral\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"tab-pane tab-example-result p-5\">\n");
      out.write("            <form action=\"Curso\" method=\"post\" autocomplete=\"off\">\n");
      out.write("              <div class=\"row\">\n");
      out.write("                <div class=\"col-md-6\">\n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                    <label for=\"name\">*Nombre del curso</label>\n");
      out.write("                    <input type=\"text\" maxlength=\"20\" class=\"form-control form-control-alternative\" name=\"txtNombre\" id=\"name\" placeholder=\"\" autofocus>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-3\">\n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                    <label for=\"cups\">*Cupos</label>\n");
      out.write("                    <input type=\"number\" min=\"10\" max=\"20\"  name=\"txtCupos\" placeholder=\"Ex: 20 Cupos\" id=\"cups\" class=\"form-control form-control-alternative\" />\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-3\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                      <label for=\"cups\">*Duración (Meses)</label>\n");
      out.write("                      <input type=\"number\" min=\"1\" max=\"12\" name=\"txtDuracion\" placeholder=\"Ex: 12 Meses\" id=\"cups\" class=\"form-control form-control-alternative\" />\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"row\">\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                      <label for=\"hr\">*Horarios</label>\n");
      out.write("                      <select name=\"txtHorarios\" id=\"hr\" class=\"form-control form-control-alternative\">\n");
      out.write("                        <option value=\"\">Seleccione una opción</option>\n");
      out.write("                        <option value=\"Lunes a Viernes - Diurno\">Lunes a viernes - Diurno</option>\n");
      out.write("                        <option value=\"Lunes a Viernes - Tarde\">Lunes a viernes - Tarde</option>\n");
      out.write("                        <option value=\"Sabado - Diurno\">Sabado - Diurno</option>\n");
      out.write("                        <option value=\"Sabado - Tarde\">Sabado - Tarde</option>\n");
      out.write("                      </select>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                  <div class=\"form-group\">                  \n");
      out.write("                      <label for=\"vl\">Costo</label>  \n");
      out.write("                      <input id=\"vl\" class=\"form-control form-control-alternative\" name=\"txtCosto\" placeholder=\"Si es gratis no ingrese nada\" type=\"number\">                                          \n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                      <label for=\"cert\">*Certificado</label>\n");
      out.write("                      <select id=\"cert\" name=\"txtCertificado\" class=\"form-control form-control-alternative\">\n");
      out.write("                        <option value=\"\">Seleccione una opción</option>\n");
      out.write("                        <option value=\"Si\">Si</option>\n");
      out.write("                        <option value=\"No\">No</option>\n");
      out.write("                      </select>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("              </div>\n");
      out.write("              <div class=\"row\">                \n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                    <label for=\"inst\">*Institución</label>\n");
      out.write("                    <input type=\"text\" maxlength=\"35\" class=\"form-control form-control-alternative\" name=\"txtInstitucion\" id=\"inst\">\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                    <label for=\"instruc\">*Instructor</label>\n");
      out.write("                    <input type=\"text\" id=\"instruc\" maxlength=\"20\" name=\"txtInstructor\" class=\"form-control form-control-alternative\">\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-4\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"cert\">*Lugar</label>\n");
      out.write("                        <select id=\"certr\" name=\"txtLugar\" class=\"form-control form-control-alternative\">\n");
      out.write("                          <option value=\"\">Seleccione una opción</option>\n");
      out.write("                          ");

                            CursoVO CurVO = new CursoVO();
                            CursoDAO CurDAO = new CursoDAO();

                            ArrayList<CursoVO> listar = CurDAO.listarLugares();

                            for(int i = 0; i<listar.size(); i++){
                                CurVO = listar.get(i);
                          
      out.write("\n");
      out.write("                          <option value=\"");
      out.print((i+1));
      out.write('"');
      out.write('>');
      out.print(CurVO.getCurNombre());
      out.write("</option>\n");
      out.write("                          ");
}
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"row\">\n");
      out.write("                  <div class=\"col-md-6\">\n");
      out.write("                      <label for=\"desc\">*Descripción del curso</label>\n");
      out.write("                      <textarea name=\"txtDesc\" pattern=\"[A-Za-z0-9]\" id=\"desc\" cols=\"10\" rows=\"5\" class=\"form-control form-control-alternative\" style=\"resize: none;\"></textarea>\n");
      out.write("                  </div>                  \n");
      out.write("              </div>\n");
      out.write("              <div class=\"row\">\n");
      out.write("                <div class=\"col-md-6 mt-5\">                    \n");
      out.write("                  <button class=\"btn btn-success\">Ingresar Curso</button>\n");
      out.write("                  <input type=\"hidden\" value=\"\" name=\"txtID\">\n");
      out.write("                  <input type=\"hidden\" value=\"1\" name=\"opcion\">\n");
      out.write("                  <a href=\"consultarCurso.jsp\" class=\"btn btn-info\">Volver</a>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("            </form>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("         <!-- Footer -->\n");
      out.write("      <footer class=\"footer\">\n");
      out.write("        <div class=\"row align-items-center justify-content-xl-between\">\n");
      out.write("          <div class=\"col-xl-6\">\n");
      out.write("            <div class=\"copyright text-center text-xl-left text-muted\">\n");
      out.write("              &copy; 2019 <a  class=\"font-weight-bold ml-1\" target=\"_blank\">Accion Comunal San Vicente</a>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-xl-6\">\n");
      out.write("            <ul class=\"nav nav-footer justify-content-center justify-content-xl-end\">\n");
      out.write("              <li class=\"nav-item\">\n");
      out.write("                <a href=\"https://bogota.gov.co/\" class=\"nav-link\" target=\"_blank\">Alcaldia de Bogota</a>\n");
      out.write("              </li>\n");
      out.write("             \n");
      out.write("              \n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </footer>                \n");
      out.write("    </div>    \n");
      out.write("</div>\n");
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

package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("  <meta charset=\"utf-8\" />\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("  <title>\n");
      out.write("    Argon Dashboard - Free Dashboard for Bootstrap 4 by Creative Tim\n");
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
      out.write("    <body class=\"\">\n");
      out.write("    <div class=\"main-content\">\n");
      out.write("    <!-- Navbar -->\n");
      out.write("    <nav class=\"navbar navbar-top navbar-expand-md navbar-dark\" id=\"navbar-main\">\n");
      out.write("      <div class=\"container-fluid\">\n");
      out.write("        <!-- Brand -->\n");
      out.write("        <a class=\"h4 mb-0 text-white text-uppercase d-none d-lg-inline-block\" href=\"./index.html\">Plantilla</a>\n");
      out.write("        <!-- Form -->\n");
      out.write("        \n");
      out.write("        <!-- User -->\n");
      out.write("        <ul class=\"navbar-nav align-items-center d-none d-md-flex\">\n");
      out.write("          <li class=\"nav-item dropdown\">\n");
      out.write("            <a class=\"nav-link pr-0\" href=\"#\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("              <div class=\"media align-items-center\">\n");
      out.write("                <span class=\"avatar avatar-sm rounded-circle\">\n");
      out.write("                  <img alt=\"Image placeholder\" src=\"./assets/img/theme/team-4-800x800.jpg\">\n");
      out.write("                </span>\n");
      out.write("                <div class=\"media-body ml-2 d-none d-lg-block\">\n");
      out.write("                  <span class=\"mb-0 text-sm  font-weight-bold\">Jessica Jones</span>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("            </a>\n");
      out.write("            <div class=\"dropdown-menu dropdown-menu-arrow dropdown-menu-right\">\n");
      out.write("              <div class=\" dropdown-header noti-title\">\n");
      out.write("                <h6 class=\"text-overflow m-0\">Welcome!</h6>\n");
      out.write("              </div>\n");
      out.write("              <a href=\"./examples/profile.html\" class=\"dropdown-item\">\n");
      out.write("                <i class=\"ni ni-single-02\"></i>\n");
      out.write("                <span>My profile</span>\n");
      out.write("              </a>\n");
      out.write("              <a href=\"./examples/profile.html\" class=\"dropdown-item\">\n");
      out.write("                <i class=\"ni ni-settings-gear-65\"></i>\n");
      out.write("                <span>Settings</span>\n");
      out.write("              </a>\n");
      out.write("              <a href=\"./examples/profile.html\" class=\"dropdown-item\">\n");
      out.write("                <i class=\"ni ni-calendar-grid-58\"></i>\n");
      out.write("                <span>Activity</span>\n");
      out.write("              </a>\n");
      out.write("              <a href=\"./examples/profile.html\" class=\"dropdown-item\">\n");
      out.write("                <i class=\"ni ni-support-16\"></i>\n");
      out.write("                <span>Support</span>\n");
      out.write("              </a>\n");
      out.write("              <div class=\"dropdown-divider\"></div>\n");
      out.write("              <a href=\"#!\" class=\"dropdown-item\">\n");
      out.write("                <i class=\"ni ni-user-run\"></i>\n");
      out.write("                <span>Logout</span>\n");
      out.write("              </a>\n");
      out.write("            </div>\n");
      out.write("          </li>\n");
      out.write("        </ul>\n");
      out.write("      </div>\n");
      out.write("    </nav>\n");
      out.write("    <!-- End Navbar -->\n");
      out.write("    <!-- Header -->\n");
      out.write("    <div class=\"header bg-gradient-success pb-8 pt-5 pt-md-8\">\n");
      out.write("      \n");
      out.write("    </div>  \n");
      out.write("    <div class=\"container-fluid mt--7 mb-5\">\n");
      out.write("      <section  style=\"padding: 15%;\">\t\t\t\n");
      out.write("\t\t\t\t<div class=\"row\">\t\t\t\t\n");
      out.write("\t\t\t\t\t<center><font size=\"5\" color=\"#FF3366\" face=\"DK Cinnabar Brush\">Chat</font></center>\n");
      out.write("\t\t\t\t</div>\t\n");
      out.write("\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t<form id=\"formChat\" role=\"form\">\n");
      out.write("\t\t\t\t\t\t<div class=\"form-group\">\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t<div class=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-md-12\" >\n");
      out.write("\t\t\t\t\t\t\t\t\t<div id=\"conversation\" style=\"height:200px; border: 1px solid #CCCCCC; padding: 12px;  border-radius: 5px; overflow-x: hidden;background-color:white;\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"form-group\">\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t<label for=\"message\"><font size=\"5\" color=\"#FF3366\" face=\"DK Cinnabar Brush\">Mensaje</font></label>\n");
      out.write("\t\t\t\t\t\t\t<textarea id=\"message\" name=\"message\" placeholder=\"mensaje\"  class=\"form-control\" rows=\"3\"></textarea>\n");
      out.write("                                                        <input name=\"usuario\" value=\"\" type=\"hidden\" value=\"michel\">\n");
      out.write("                                                        <input name=\"fecha\" value=\"\" type=\"hidden\" value=\"michel\">\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<button id=\"send\" class=\"btn\">Enviar</button>\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</section>\t\n");
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

package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    Inicio de sesion\n");
      out.write("  </title>\n");
      out.write("  <!-- Favicon -->\n");
      out.write("  <link href=\"assets/img/brand/favicon.ico\" rel=\"icon\" type=\"image/png\">\n");
      out.write("  <!-- Fonts -->\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700\" rel=\"stylesheet\">\n");
      out.write("  <!-- Icons -->\n");
      out.write("  <link href=\"assets/js/plugins/nucleo/css/nucleo.css\" rel=\"stylesheet\" />\n");
      out.write("  <link href=\"assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" />\n");
      out.write("  <!-- CSS Files -->\n");
      out.write("  <link href=\"assets/css/argon-dashboard.css?v=1.1.0\" rel=\"stylesheet\" />\n");
      out.write("  <link rel=\"stylesheet\" href=\"assets/css/custom.css\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body class=\"fondo\">\n");
      out.write("  <div class=\"main-content\">\n");
      out.write("    <!-- Navbar -->\n");
      out.write("    <nav class=\"navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark mt-5\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <a class=\"navbar-brand\" href=\"../index.html\">\n");
      out.write("          <img src=\"assets/img/brand/white.png\" />\n");
      out.write("        </a>\n");
      out.write("        <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbar-collapse-main\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("          <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("        </button>\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbar-collapse-main\">\n");
      out.write("          <!-- Collapse header -->\n");
      out.write("          <div class=\"navbar-collapse-header d-md-none\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("              <div class=\"col-6 collapse-brand\">\n");
      out.write("                <a href=\"../index.html\">\n");
      out.write("                  <img src=\"assets/img/brand/blue.png\">\n");
      out.write("                </a>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"col-6 collapse-close\">\n");
      out.write("                <button type=\"button\" class=\"navbar-toggler\" data-toggle=\"collapse\" data-target=\"#navbar-collapse-main\" aria-controls=\"sidenav-main\" aria-expanded=\"false\" aria-label=\"Toggle sidenav\">\n");
      out.write("                  <span></span>\n");
      out.write("                  <span></span>\n");
      out.write("                </button>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <!-- Navbar items -->\n");
      out.write("          <ul class=\"navbar-nav ml-auto\">            \n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link nav-link-icon\" href=\"registro.jsp\">\n");
      out.write("                <i class=\"ni ni-key-25 \"></i>\n");
      out.write("                <span class=\"nav-link-inner--text \">Registro</span>\n");
      out.write("              </a>\n");
      out.write("            </li>\n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </nav>\n");
      out.write("    <!-- Header -->\n");
      out.write("    <div class=\"header py-5 py-lg-6\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"header-body text-center mb-7\">\n");
      out.write("          <div class=\"row justify-content-center\">\n");
      out.write("            <div class=\"col-lg-5 col-md-6 mt-4\">\n");
      out.write("              \n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <!-- Page content -->\n");
      out.write("    <div class=\"container mt--5 pb-3\">\n");
      out.write("        \n");
      out.write("      <!-- Table -->\n");
      out.write("      <div class=\"row justify-content-center\">\n");
      out.write("        <div class=\"col-lg-6 col-md-8\">\n");
      out.write("             ");

            if(request.getAttribute("Error")!= null){
            
      out.write("\n");
      out.write("            <div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n");
      out.write("              <span class=\"alert-inner--icon\"><i class=\"ni ni-fat-remove\"></i></span>\n");
      out.write("              <span class=\"alert-inner--text\"><strong>Ups! </strong>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span>\n");
      out.write("              <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n");
      out.write("                  <span aria-hidden=\"true\">&times;</span>\n");
      out.write("              </button>\n");
      out.write("            </div>            \n");
      out.write("            ");
}else if(request.getAttribute("Exitoso")!= null){
      out.write("\n");
      out.write("            <div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">\n");
      out.write("              <span class=\"alert-inner--icon\"><i class=\"ni ni-check-bold\"></i></span>\n");
      out.write("              <span class=\"alert-inner--text\"><strong>Bien! </strong>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Exitoso}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span>\n");
      out.write("              <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n");
      out.write("                  <span aria-hidden=\"true\">&times;</span>\n");
      out.write("              </button>\n");
      out.write("          </div>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("          <div class=\"card shadow-md border-0\">            \n");
      out.write("            <div class=\"card-body px-lg-5 py-lg-5\">\n");
      out.write("              <div class=\"text-center text-muted mb-5\">\n");
      out.write("                Iniciar sesión\n");
      out.write("              </div>\n");
      out.write("              <form action=\"Usuario\" method=\"post\" autocomplete=\"off\">\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                  <div class=\"input-group input-group-alternative mb-3\">\n");
      out.write("                    <div class=\"input-group-prepend\">\n");
      out.write("                      <span class=\"input-group-text\"><i class=\"ni ni-hat-3\"></i></span>\n");
      out.write("                    </div>\n");
      out.write("                      <input class=\"form-control form-control-alternative\" placeholder=\"Correo\" name=\"txtUsu\" type=\"email\"  required autofocus>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                  <div class=\"input-group input-group-alternative mb-3\">\n");
      out.write("                    <div class=\"input-group-prepend\">\n");
      out.write("                      <span class=\"input-group-text\"><i class=\"ni ni-lock-circle-open\"></i></span>\n");
      out.write("                    </div>\n");
      out.write("                      <input class=\"form-control\" placeholder=\"Contraseña\" name=\"txtCla\" type=\"password\" required>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                  <div class=\"row ml-2\" style=\"float: left;\">\n");
      out.write("                      <i class=\"\"><a class=\"text-gray\" href=\"\">Registrate ahora.</a></i>\n");
      out.write("                  </div>\n");
      out.write("                  <div class=\"row mr-2\" style=\"float: right;\">\n");
      out.write("                      <i class=\"float-right\"><a href=\"\" class=\"text-gray\">¿Olvidaste tu contraseña?</a></i>\n");
      out.write("                  </div>\n");
      out.write("                <div class=\"row mt-5 justify-content-center\">\n");
      out.write("                    <input type=\"hidden\" name=\"opcion\" value=\"6\">                    \n");
      out.write("                    <button type=\"submit\" class=\"btn btn-dark mt-4\">Iniciar sesion</button>\n");
      out.write("                </div>\n");
      out.write("                  \n");
      out.write("              </form>               \n");
      out.write("            </div>            \n");
      out.write("          </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"container-fluid mt-2\">        \n");
      out.write("      <div class=\"row justify-content-center\">\n");
      out.write("        <div class=\"col-md-3\">\n");
      out.write("         \n");
      out.write("          \n");
      out.write("          \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <!-- Footer -->\n");
      out.write("  <footer class=\"py-5 mt-5\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("      <div class=\"row align-items-center justify-content-center\">\n");
      out.write("        <div class=\"col-xl-6\">\n");
      out.write("          <div class=\"copyright text-center text-xl-left text-white\">\n");
      out.write("            \n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-xl-6\">\n");
      out.write("          \n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </footer>\n");
      out.write("  </div>\n");
      out.write("  <!--   Core   -->\n");
      out.write("  <script src=\"assets/js/plugins/jquery/dist/jquery.min.js\"></script>\n");
      out.write("  <script src=\"assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("  <!--   Optional JS   -->\n");
      out.write("  <!--   Argon JS   -->\n");
      out.write("  <script src=\"assets/js/argon-dashboard.min.js?v=1.1.0\"></script>\n");
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

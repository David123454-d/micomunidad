package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class usuario_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <title>Concept - Bootstrap 4 Admin Dashboard Template</title>\n");
      out.write("        <!-- Bootstrap CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"../assets/vendor/bootstrap/css/bootstrap.min.css\">\n");
      out.write("        <link href=\"../assets/vendor/fonts/circular-std/style.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../assets/libs/css/style.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../assets/vendor/fonts/fontawesome/css/fontawesome-all.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../assets/vendor/datepicker/tempusdominus-bootstrap-4.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"../assets/vendor/inputmask/css/inputmask.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"card\">\n");
      out.write("            <form method=\"post\" action=\"Usuario\" autocomplete=\"off\">\n");
      out.write("                \n");
      out.write("                <label for=\"nm\">Ingrese Usuario: </label><br><br>\n");
      out.write("                <input type=\"text\" name=\"txtUsu\" id=\"nm\"><br><br>\n");
      out.write("                <label for=\"dec\">Ingrese Contraseña: </label><br><br>\n");
      out.write("                <input type=\"password\" name=\"txtCla\" id=\"dec\"></input><br><br>\n");
      out.write("                \n");
      out.write("                <button type=\"hidden\" value=\"1\" name=\"opcion\">Ingresar</button>    \n");
      out.write("                <button type=\"hidden\" value=\"2\" name=\"opcion\">Actualizar</button>    \n");
      out.write("                <button type=\"hidden\" value=\"4\" name=\"opcion\">Eliminar</button> \n");
      out.write("            </form>\n");
      out.write("            \n");
      out.write("            ");

            if(request.getAttribute("Error")!= null){
            
      out.write("        \n");
      out.write("                <p class=\"Error\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("            ");
}else if(request.getAttribute("Exitoso")!= null){
      out.write("\n");
      out.write("                <p>Registrado con exito</p>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>    \n");
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

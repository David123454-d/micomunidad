package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class inscripcion_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form method=\"post\" action=\"Inscripcion\" autocomplete=\"off\">\n");
      out.write("            <label for=\"nm\">Ingrese Id inscripción: </label><br><br>\n");
      out.write("            <input type=\"text\" name=\"txtId\" id=\"nm\"><br><br>\n");
      out.write("            <label for=\"dec\">Ingrese Descripción: </label><br><br>\n");
      out.write("            <input type=\"text\" name=\"txtDes\" id=\"dec\"></input><br><br>\n");
      out.write("            <label for=\"cups\">Ingrese Horario: </label><br><br>\n");
      out.write("            <input type=\"text\" name=\"txtHora\" id=\"cups\"><br><br>\n");
      out.write("            <label for=\"hh\">Ingrese Id curso </label><br><br>\n");
      out.write("            <input type=\"text\" name=\"txtIDC\" id=\"hh\"><br><br>\n");
      out.write("            <label for=\"ll\">Ingrese Cedula: </label><br><br>\n");
      out.write("            <input type=\"text\" name=\"txtIDD\" id=\"ll\"><br><br>\n");
      out.write("\n");
      out.write(" \n");
      out.write("            <button type=\"hidden\" value=\"1\" name=\"opcion\">Ingresar</button>    \n");
      out.write("            <button type=\"hidden\" value=\"2\" name=\"opcion\">Actualizar</button>    \n");
      out.write("            <button type=\"hidden\" value=\"4\" name=\"opcion\">Eliminar</button> \n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        ");

            if(request.getAttribute("Error")!= null){
            
      out.write("        \n");
      out.write("                <p class=\"Error\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${Error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("            ");
}else if(request.getAttribute("Exitoso")!= null){
      out.write("\n");
      out.write("                <p>Ingresado Correctamente</p>\n");
      out.write("            ");
}
      out.write("\n");
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

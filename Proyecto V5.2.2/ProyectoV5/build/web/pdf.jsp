<%-- 
    Document   : pdf.jsp
    Created on : 25/09/2019, 08:47:21 PM
    Author     : Familia Gonzalez  A
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer.*"%>

<%@page import="javax.servlet.ServletResponse"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
        String driver, urlDB, db, userDB, passwordDB;
        Connection conexion = null;    
            
        driver = "com.mysql.jdbc.Driver";
        db = "socialred";
        userDB = "root";
        passwordDB = "";
        urlDB = "jdbc:mysql://localhost:3306/"+db;
        
        try {
            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(urlDB, userDB, passwordDB);
            System.out.println("nisu");
        } catch (Exception e) {
            System.out.println("Error = "+e.toString());
        }
        
      File reportfile= new File (application.getRealPath("report1.jasper"));
      
      Map<String, Object> parameter = new HashMap<String, Object>();
      
      byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter,conexion );
      
      response.setContentType("application/pdf");
      response.setContentLength(bytes.length);
      ServletOutputStream outPutStream = response.getOutputStream();
      outPutStream.write(bytes,0,bytes.length);
      
      outPutStream.flush();
      outPutStream.close();
      %>
    </body>
</html>

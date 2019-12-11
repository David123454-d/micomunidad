<%-- 
    Document   : conexion
    Created on : 25/09/2019, 11:00:26 PM
    Author     : Familia Gonzalez  A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       Connection con=null;
               try{
               Class.forName("com.mysql.jdbc.Driver");
               con=(Connection)DriverManager.getConnection("jdbc:msql://localhost:3306/socialred","root","");
               out.print("conexion en linea");
               }
               catch(Exception ex){
                   out.print("erro"+ex.getMessage());
               }
              
       
                   
       %>
    </body>
</html>

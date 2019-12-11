<%-- 
    Document   : conversation.jsp
    Created on : 25-sep-2019, 16:45:24
    Author     : Camilo
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String driver, urlDB, db, userDB, passwordDB;
            Connection conexion;
            
            driver = "com.mysql.jdbc.Driver";
            db = "socialred";
            userDB = "root";
            passwordDB = "";
            urlDB = "jdbc:mysql://localhost:3306/"+db;
            
            
            request.getParameter("message");
        %>
    </body>
</html>

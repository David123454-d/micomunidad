<%-- 
    Document   : register.php
    Created on : 25-sep-2019, 17:13:36
    Author     : Camilo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
            String driver, urlDB, db, userDB, passwordDB;
            Connection conexion;
            
            driver = "com.mysql.jdbc.Driver";
            db = "socialred";
            userDB = "root";
            passwordDB = "";
            urlDB = "jdbc:mysql://localhost:3306/"+db;
            String mensaje = request.getParameter("message");
            String usuario = request.getParameter("usuario");
            
            
            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(urlDB, userDB, passwordDB);
            Statement puente = conexion.createStatement();
            ResultSet rs = puente.executeQuery("insert into chat (Mensaje) values ("+mensaje+")");
            
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    </body>
</html>

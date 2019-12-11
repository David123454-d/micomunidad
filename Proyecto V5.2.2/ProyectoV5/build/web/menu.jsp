<%-- 
    Document   : menu
    Created on : 13/08/2019, 07:36:39 PM
    Author     : deman
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession miSesion = (HttpSession)request.getSession();
    UsuarioVO usuoVO = (UsuarioVO)miSesion.getAttribute("usuario");
    if(usuoVO != null){
    }else{
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } 
    
    if(miSesion.getAttribute("usuario")==null){
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    if(miSesion==null){
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    boolean bandera = false;
    InformacionU_VO iuVO = new InformacionU_VO();
    InformacionU_DAO iuDAO = new InformacionU_DAO(iuVO);
    
    
    
    if(iuDAO.validarDatosU(usuoVO.getUsuario())){
        bandera = true;
    }

    
    ArrayList<InformacionU_VO>listarrol = iuDAO.listarRol(usuoVO.getUsuario());
    
    String rol ="";
    
    for (int i = 0; i < listarrol.size(); i++) {
       iuVO = listarrol.get(i);
       rol = iuVO.getInfrol();
    }
%>
<!--

=========================================================
* Argon Dashboard - v1.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2019 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Menu
  </title>
  <!-- Favicon -->
  <link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
</head>

<body class="">
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="menu.jsp">
        <img src="./assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        
        
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="./index.html">
                <img src="./assets/img/brand/blue.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
       
        <!-- Navigation -->

        <ul class="navbar-nav">
          <%
              if(rol.equals("Administrador")){
          %>
          <li class="nav-item">
          <a class="nav-link" href=" ./consultarUsuario.jsp" target="here"> <i class="ni ni-single-02 text-success"></i> Usuario
            </a>
          </li>
        <%}%>
          <li class="nav-item">
            <a class="nav-link " href="./consultarEvento.jsp" target="here">
              <i class="ni ni-tag text-success"></i> Eventos
            </a>
          </li>

          <li class="nav-item">
              <a class="nav-link " href="./consultarCurso.jsp" target="here">
              <i class="ni ni-single-copy-04 text-success"></i> Cursos
            </a>
          </li>
          <li class="nav-item">
              <a class="nav-link " href="./consultarInscripciones.jsp" target="here">
              <i class="ni ni-archive-2 text-success"></i> Inscripciones
            </a>
          </li> 

          <li class="nav-item">
              <a class="nav-link" href="./consultarPrestamos.jsp" target="here">
              <i class="ni ni-key-25 text-success"></i> Préstamo
            </a>
          </li>
          
          <li class="nav-item">
              <a class="nav-link" href="./consultarLugares.jsp" target="here">
              <i class="ni ni-pin-3 text-success"></i> Lugares
            </a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="./chat.jsp" target="here">
              <i class="ni ni-email-83 text-success"></i> Chat
            </a>
          </li>
          <hr class="my-3">
            <li class="nav-item">
              <a class="nav-link" href="./Sesiones">
              <i class="ni ni-lock-circle-open"></i> Cerrar Sesión
            </a>
          </li>
        </ul>
        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
        
        <!-- Navigation -->
        
      </div>
    </div>
  </nav>
    <div class="main-content">
        <%if (bandera) {%>
            <iframe src="informacio.jsp" name="here" style="width: 100%; height: 980px;" frameborder="0"></iframe>
        <%}else{%>
            <iframe src="info.jsp" name="here" style="width: 100%; height: 980px;" frameborder="0"></iframe>
        <%}%>                                        
    </div>
  </div>
  <!--   Core   -->
  <script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
  <script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
  <!--   Argon JS   -->
  <script src="./assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
</body>

</html>
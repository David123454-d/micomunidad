<%-- 
    Document   : eliminarEvento
    Created on : 23-sep-2019, 15:12:17
    Author     : Camilo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.EventoDAO"%>
<%@page import="VO.EventoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Argon Dashboard - Free Dashboard for Bootstrap 4 by Creative Tim
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
    <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
        <!-- Brand -->
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Eliminar evento</a>
        <!-- Form -->
        
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          
        </ul>
      </div>
    </nav>
<%
    if(request.getParameter("id") != null){
    EventoVO evenVO = new EventoVO();
    EventoDAO evenDAO = new EventoDAO();

    ArrayList<EventoVO> evento = evenDAO.consultarEvento(request.getParameter("id"));

    for(int i = 0; i<evento.size(); i++){
       evenVO = evento.get(i);
%>
<div class="header bg-gradient-success pb-8 pt-5 pt-md-8">
      
</div>
<div class="container-fluid mt--7 mb-5">
      <div class="row justify-content-center">
        <div class="col-md-5">
          <div class="card shadow">
            <div class="card-header border-0">
                <h2 class="mb-0">Eliminar evento</h2>
            </div>
            <div class="p-2 border-0 bg-light-neutral">

            </div>
            <div class="tab-pane tab-example-result p-5">
            <form action="EventoControlador" method="post" autocomplete="off">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">                      
                    <label for="name">¿Desea realmente eliminar el evento <%= evenVO.getEvenNombre()%>?</label>
                    <input type="hidden" value="<%= request.getParameter("id")%>" name="txtID">                   
                    <input name="txtNombre" type="hidden" value="<%=evenVO.getEvenNombre()%>" required>
                    <input name="txtFecha" type="hidden" value="<%=evenVO.getEvenFecha()%>" required>
                    <input name="txtDesc" type="hidden" value="<%=evenVO.getEvenDesc()%>" required>
                    <input name="txtHInicio" type="hidden" value="<%=evenVO.getHora_inicio()%>" required>
                    <input name="txtHFinal" type="hidden" value="<%=evenVO.getHora_finalizacion()%>" required>
                    <input name="txtLugar" type="hidden" value="<%=evenVO.getLugar()%>" required>
                    <input name="txtEstado" type="hidden" value="Inactivo" required>
                    <input name="txtUsuario" type="hidden" value="<%=evenVO.getUsuario()%>" required>
                  </div>
                  <input type="hidden" value="4" name="opcion">                                    
                </div>                            
            </div>
            <div class="row">
              <div class="col-md-6 mt-5">                    
                <button class="btn btn-success">Eliminar Evento</button>
                <input type="hidden" value="4" name="opcion">
                <a href="consultarCurso.jsp" class="btn btn-info">Volver</a>
              </div>
            </div>
            </form>
          </div>
        </div>                  
      </div>
    </div>    
      <!-- Footer -->
      <footer class="footer">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              &copy; 2019 <a  class="font-weight-bold ml-1" target="_blank">Accion Comunal San Vicente</a>
            </div>
          </div>
          <div class="col-xl-6">
            <ul class="nav nav-footer justify-content-center justify-content-xl-end">
              <li class="nav-item">
                <a href="https://bogota.gov.co/" class="nav-link" target="_blank">Alcaldia de Bogota</a>
              </li>
             
              
            </ul>
          </div>
        </div>
      </footer>             
    <%}
    }%>
</div>
</div>
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

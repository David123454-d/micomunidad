
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="DAO.prestamoDAO"%>
<%@page import="VO.prestamoVO"%>
<%-- 
    Document   : actualizarCurso
    Created on : 13/08/2019, 08:22:41 AM
    Author     : APRENDIZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Prestamo
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Actualizar Prestamo</a>
        <!-- Form -->
        
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          
        </ul>
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    <div class="header bg-gradient-success pb-8 pt-5 pt-md-8">
      
    </div>
    <%
    
        prestamoVO perVO = new prestamoVO();
        prestamoDAO perDAO = new prestamoDAO();

        ArrayList<prestamoVO> prestamo = perDAO.consultarPrestamo(request.getParameter("id"));
        
        for(int i = 0; i<prestamo.size(); i++){
           perVO = prestamo.get(i);
    %>       
    <div class="container-fluid mt--7 mb-5">
      <div class="row justify-content-center">
        <div class="col-md-10">
          <div class="card shadow">
            <div class="card-header border-0">
                <h2 class="mb-0">Actualizar prestamo</h2>
            </div>
            <div class="p-2 border-0 bg-light-neutral">

            </div>
            <div class="tab-pane tab-example-result p-5">
             <form action="prestamoControlador" method="post" autocomplete="off">
              <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="cert">* Lugar</label>
                        <select id="certr" name="txtLugar" class="form-control form-control-alternative" autofocus>
                          <%
                            prestamoVO prestVO = new prestamoVO();
                            prestamoDAO prestDAO = new prestamoDAO();

                            ArrayList<prestamoVO> listar = prestDAO.listarLugares();

                            for(int o = 0; o<listar.size(); o++){
                                prestVO = listar.get(o);
                                int lug = o + 1;
                                if(Integer.parseInt(perVO.getId_prestamo()) == lug){
                                    
                                
                          %>
                          <option value="<%=perVO.getId_prestamo()%>"><%=prestVO.getId_lugar()%></option>
                          <%}
                            }%>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="cups">* Hora de inicio</label>
                    <input value="<%=perVO.getTiempo()%>" type="time" name="txtTInicio" placeholder="Tiempo" id="cups" class="form-control form-control-alternative" />
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="cups">Hora de salida</label>
                    <input value="<%=perVO.getHSalida()%>" type="time" name="txtTSalida" placeholder="Tiempo" id="cups" class="form-control form-control-alternative" />
                  </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                      <label for="cups">* Fecha</label>
                      <input value="<%=perVO.getFecha()%>"  type="date"  min="2019-01-01" max="2019-12-31" name="txtFecha" placeholder="Fecha" id="cups" class="form-control form-control-alternative" />
                    </div>
                  </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                      <label for="hr">* Descripción</label>
                      <textarea name="txtDescripcion" pattern="[A-Za-z0-9]"  cols="10" rows="5" class="form-control form-control-alternative" style="resize: none;" required><%=perVO.getDescripcion()%></textarea>                      
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">                  
                      <label for="vl">Usuario</label>  
                         <select id="certr" name="txtusuario"  class="form-control form-control-alternative" required>  
                          <option value="<%=perVO.getUsuario()%>"><%=perVO.getUsuario()%></option>
                        </select>
                  </div>
                </div>  
                <div class="col-md-4">
                  <div class="form-group">
                      <label for="cert">* Estado</label>
                      <select id="cert" name="txtEstado" class="form-control form-control-alternative">
                        <option value="Inactivo">Inactivo</option>
                        <option value="Activo">Activo</option>
                        <option value="Concluido">Concluido</option>
                      </select>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mt-5">                    
                  <button class="btn btn-success">Ingresar Prestamo</button>
                  <input type="hidden" value="<%=request.getParameter("id")%>" name="id">
                  <input type="hidden" value="3" name="opcion">
                  <a href="consultarPrestamos.jsp" class="btn btn-info">Volver</a>
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
    </div>    
    <%}
    %>
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
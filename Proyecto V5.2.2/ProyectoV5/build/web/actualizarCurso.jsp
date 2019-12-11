<%-- 
    Document   : actualizarCurso
    Created on : 13/08/2019, 08:22:41 AM
    Author     : APRENDIZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CursoDAO"%>
<%@page import="VO.CursoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Curso
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Actualizar Curso</a>
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
    if(request.getParameter("id") != null){
        CursoVO CurVO = new CursoVO();
        CursoDAO CurDAO = new CursoDAO();

        ArrayList<CursoVO> usuario = CurDAO.consultarCurso(request.getParameter("id"));
        
        for(int i = 0; i<usuario.size(); i++){
           CurVO = usuario.get(i);
    %>       
    <div class="container-fluid mt--7 mb-5">
      <div class="row justify-content-center">
        <div class="col-md-10">
          <div class="card shadow">

            <div class="p-2 border-0 bg-light-neutral">

            </div>
            <div class="tab-pane tab-example-result p-5">
            <form action="Curso" method="post" autocomplete="off">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name">* Nombre del curso</label>
                    <input type="text" maxlength="20" value="<%= CurVO.getCurNombre()%>" class="form-control form-control-alternative" name="txtNombre" id="name" placeholder="Ex: Pepe Mujica" required>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="cups">* Cupos</label>
                    <input type="number" min="10" max="20" value="<%= CurVO.getCurCupos()%>" name="txtCupos" placeholder="Ex: 20 Cupos" id="cups" class="form-control form-control-alternative" required/>
                  </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                      <label for="">* Duración (Meses)</label>
                      <input type="number" value="<%= CurVO.getCurDuracion()%>" name="txtDuracion" placeholder="Ex: 12 Meses" id="cups" class="form-control form-control-alternative" required/>
                    </div>
                  </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                      <label for="hr">* Horarios</label>
                      <select value="<%= CurVO.getCurHorarios()%>" name="txtHorarios" id="hr" class="form-control form-control-alternative" required>
                        <option value="">Seleccione una opción</option>
                        <option value="Lunes a Viernes - Diurno">Lunes a viernes - Diurno</option>
                        <option value="Lunes a Viernes - Tarde">Lunes a viernes - Tarde</option>
                        <option value="Sabado - Diurno">Sabado - Diurno</option>
                        <option value="Sabado - Tarde">Sabado - Tarde</option>
                      </select>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">                  
                      <label for="vl">* Costo</label>  
                      <input id="vl" value="<%= CurVO.getCurCostos()%>" class="form-control form-control-alternative" name="txtCosto" placeholder="Si es gratis no ingrese nada" type="number">                                          
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                      <label for="cert">* Certificado</label>
                      <select id="cert" name="txtCertificado" value="<%= CurVO.getCurCertificado()%>" class="form-control form-control-alternative" required>
                        <option value="">Seleccione una opción</option>
                        <option value="Si">Si</option>
                        <option value="No">No</option>
                      </select>
                  </div>
                </div>
                
              </div>
              <div class="row">                
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="inst">* Institución</label>
                    <input type="text" maxlength="20" class="form-control form-control-alternative" value="<%= CurVO.getCurInstitucion()%>" name="txtInstitucion" id="inst" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="instruc">*Instructor</label>
                    <input type="text" maxlength="20" id="instruc" name="txtInstructor" value="<%= CurVO.getCurInstructor()%>" class="form-control form-control-alternative" required>
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="cert">* Lugar</label>
                        <select id="certr" name="txtLugar" value="<%= CurVO.getCurLugar()%>" class="form-control form-control-alternative" required>
                          <option value="">Seleccione una opción</option>
                          <%
                            CursoVO CurVOS = new CursoVO();
                            CursoDAO CurDAOS = new CursoDAO();

                            ArrayList<CursoVO> listar = CurDAOS.listarLugares();

                            for(int j = 0; j<listar.size(); j++){
                                CurVOS = listar.get(j);
                          %>
                          <option value="<%=(j+1)%>"><%=CurVOS.getCurNombre()%></option>
                          <%}%>
                        </select>
                    </div>
                  </div>
              </div>
              <div class="row">
                  <div class="col-md-6">
                      <label for="desc">* Descripción del curso</label>
                      <textarea name="txtDesc" pattern="[A-Za-z0-9]" id="desc" cols="10" rows="5" class="form-control form-control-alternative" style="resize: none;" required><%= CurVO.getCurDesc()%></textarea>                      
                  </div>                  
              </div>
              <div class="row">
                <div class="col-md-6 mt-5">                    
                  <button class="btn btn-success">Ingresar Curso</button>
                  <input type="hidden" value="<%=request.getParameter("id")%>" name="txtID">
                  <input type="hidden" value="3" name="opcion">
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
    </div>
                  
    <%}
    }%>
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
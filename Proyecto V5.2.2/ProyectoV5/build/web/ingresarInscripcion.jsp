<%@page import="DAO.InscripcionDAO"%>
<%@page import="VO.InscripcionVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="java.util.ArrayList"%>
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
<%
    HttpSession miSesion = (HttpSession)request.getSession();
    UsuarioVO usuoVO = (UsuarioVO)miSesion.getAttribute("usuario");
    if(usuoVO != null){
    }else{
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } 
    
    
    InformacionU_VO iuVO = new InformacionU_VO();
    InformacionU_DAO iuDAO = new InformacionU_DAO(iuVO);
    ArrayList<InformacionU_VO>listarrol = iuDAO.listarRol(usuoVO.getUsuario());
    
    String rol ="";
    
    for (int i = 0; i < listarrol.size(); i++) {
       iuVO = listarrol.get(i);
       rol = iuVO.getInfrol();
    }
%>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Inscripciones
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Ingresar inscripcion</a>
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
           
    <div class="container-fluid mt--7 mb-5">
      <div class="row justify-content-center">
        <div class="col-md-10">
          <div class="card shadow">
            <div class="card-header border-0">
                <h2 class="mb-0">Realizar inscripcion</h2>
            </div>
            <div class="p-2 border-0 bg-light-neutral">

            </div>
            <div class="tab-pane tab-example-result p-5">
            <form action="Inscripcion" method="post" autocomplete="off">
              <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="cert">Usuario</label>
                        <%
                        if(rol.equals("Administrador")){%>                                                                                                           
                        <select id="certr" name="txtIDD" class="form-control form-control-alternative" autofocus>
                          <option value="">Seleccione una opción</option>
                          <%
                            InscripcionVO inscVO = new InscripcionVO();
                            InscripcionDAO inscDAO = new InscripcionDAO();

                            ArrayList<InscripcionVO> listar = inscDAO.listarUsuarios();

                            for(int i = 0; i<listar.size(); i++){
                                inscVO = listar.get(i);
                          %>
                          <option value="<%=inscVO.getInsID_datos()%>"><%=inscVO.getInsId()%></option>
                          <%}%>
                          <%}else {%>
                          <input type="text" readonly class="form-control form-control-alternative" value="<%=iuVO.getInfnombres() + " " + iuVO.getInfapellidos() %>">
                          <input type="hidden" name="txtIDD" value="<%=iuVO.getInfcedula()%>">
                        <%}%>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="cert">Cursos</label>
                        <select id="certr" name="txtIDC" class="form-control form-control-alternative">
                          <%
                              if(request.getParameter("id") == null){%>
                                  <option value="">Seleccione una opción</option>
                              <%}%>
                          <%
                            InscripcionVO inscVO1 = new InscripcionVO();
                            InscripcionDAO inscDAO1 = new InscripcionDAO();

                            ArrayList<InscripcionVO> listar1 = inscDAO1.listarCursos();

                            for(int i = 0; i<listar1.size(); i++){
                                inscVO1 = listar1.get(i);
                                if(request.getParameter("id") != null){
                                    int id = Integer.parseInt(request.getParameter("id"));
                                    if(id == (i + 1)){%>
                                       <option value="<%=inscVO1.getInsID_datos()%>"><%=inscVO1.getInsId()%></option> 
                                    <%}
                                }else{%>
                                <option value="<%=inscVO1.getInsID_datos()%>"><%=inscVO1.getInsId()%></option>
                            <%}
                          %>
                          
                          <%}%>
                        </select>
                  </div>
                </div>                
                <div class="col-md-4">
                    <div class="form-group">
                      <label for="hr">* Horarios</label>
                      <select name="txtHora" id="hr" class="form-control form-control-alternative">
                        <option value="">Seleccione una opción</option>
                        <option value="Lunes a Viernes - Diurno">Lunes a viernes - Diurno</option>
                        <option value="Lunes a Viernes - Tarde">Lunes a viernes - Tarde</option>
                        <option value="Sabado - Diurno">Sabado - Diurno</option>
                        <option value="Sabado - Tarde">Sabado - Tarde</option>
                      </select>
                    </div>
                  </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                      <label for="hr">* Descripción</label>
                      <textarea name="txtDes" pattern="[A-Za-z0-9]" cols="10" rows="5" class="form-control form-control-alternative" style="resize: none;" required></textarea>                      
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mt-5">                    
                  <button class="btn btn-success">Realizar inscripcion</button>
                  <input type="hidden" value="1" name="opcion">
                  <a href="consultarInscripciones.jsp" class="btn btn-info">Volver</a>
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
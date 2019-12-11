<%-- 
    Document   : ingresarEvento
    Created on : 23-sep-2019, 15:06:11
    Author     : Camilo
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="DAO.CursoDAO"%>
<%@page import="VO.CursoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="DAO.InscripcionDAO"%>
<%@page import="VO.InscripcionVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession miSesion = (HttpSession) request.getSession();
    UsuarioVO usuoVO = (UsuarioVO) miSesion.getAttribute("usuario");
    if (usuoVO != null) {
    } else {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    InformacionU_VO iuVO = new InformacionU_VO();
    InformacionU_DAO iuDAO = new InformacionU_DAO(iuVO);
    ArrayList<InformacionU_VO> listarrol = iuDAO.listarRol(usuoVO.getUsuario());

    String rol = "";

    for (int i = 0; i < listarrol.size(); i++) {
        iuVO = listarrol.get(i);
        rol = iuVO.getInfrol();
    }

    Calendar c = Calendar.getInstance();
    Calendar c1 = new GregorianCalendar();

    String dia = Integer.toString(c.get(Calendar.DATE));
    String mes = Integer.toString(c.get(Calendar.MONTH));
    String annio = Integer.toString(c.get(Calendar.YEAR));

    String fecha = annio + "-" + mes + "-" + dia;
%>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>
            Eventos
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
                    <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">GESTIONAR EVENTOS</a>
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
                                <h2 class="mb-0">Ingresar Evento</h2>
                            </div>
                            <div class="p-2 border-0 bg-light-neutral">

                            </div>

                            <div class="tab-pane tab-example-result p-5">
                                <form action="EventoControlador" method="post" autocomplete="off">
                                    <div class="row"> 
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">* Nombre del evento</label>
                                                <input name="txtNombre" type="text" class="form-control form-control-alternative" required autofocus>
                                                <br>
                                                <label for="name">* Fecha</label>
                                                <input name="txtFecha" type="date"  min="2019-01-01" max="2019-12-31" class="form-control form-control-alternative" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">* Descripción</label>
                                                <textarea name="txtDesc" cols="10"  pattern="[A-Za-z0-9]" placeholder="Máximo 100 caracteres" rows="5" class="form-control form-control-alternative" style="resize: none;" required></textarea>                      
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">* Hora de inicio</label>
                                                <input name="txtHInicio" type="time" class="form-control form-control-alternative" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">* Hora de finalización</label>
                                                <input name="txtHFinal" type="time" class="form-control form-control-alternative" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">* Lugar</label>
                                                <select id="certr" name="txtLugar" class="form-control form-control-alternative" required>
                                                    <%if(request.getParameter("id") == null){%>
                                                        <option value="">Seleccione una opción</option>
                                                    <%}
                                                        CursoVO CurVOS = new CursoVO();
                                                        CursoDAO CurDAOS = new CursoDAO();

                                                        ArrayList<CursoVO> listar = CurDAOS.listarLugares();

                                                        for (int j = 0; j < listar.size(); j++) {
                                                            CurVOS = listar.get(j);
                                                            if(request.getParameter("id") != null){
                                                                int id = Integer.parseInt(request.getParameter("id"));
                                                                if(id == (j + 1)){%>
                                                                    <option value="<%=(j + 1)%>"><%=CurVOS.getCurNombre()%></option>
                                                                <%}
                                                            }else{%>
                                                                <option value="<%=(j + 1)%>"><%=CurVOS.getCurNombre()%></option>
                                                            <%}
                                                    %>
                                                    
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">* Estado</label>
                                                <select name="txtEstado" class="form-control form-control-alternative" required>
                                                    <option value="EnProceso">En proceso</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="name">* Usuario</label>
                                            <%
                                            if (rol.equals("Administrador")) {%>                                                                                                           
                                            <select id="certr" name="txtUsuario" class="form-control form-control-alternative">
                                                <option value="">Seleccione una opción</option>
                                                <%
                                                    InscripcionVO inscVO = new InscripcionVO();
                                                    InscripcionDAO inscDAO = new InscripcionDAO();

                                                    ArrayList<InscripcionVO> listar1 = inscDAO.listarUsuarios();

                                                    for (int i = 0; i < listar1.size(); i++) {
                                                        inscVO = listar1.get(i);
                                                %>
                                                <option value="<%=inscVO.getInsID_datos()%>"><%=inscVO.getInsId()%></option>
                                                <%}%>
                                                <%} else {%>
                                                <input type="text" readonly class="form-control form-control-alternative" value="<%=iuVO.getInfnombres() + " " + iuVO.getInfapellidos()%>">
                                                <input type="hidden" name="txtUsuario" value="<%=iuVO.getInfcedula()%>">
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mt-5" >                    
                                            <button class="btn btn-success">Ingresar Evento</button>
                                            <input type="hidden" value="1" name="opcion">
                                            <a href="consultarEvento.jsp" class="btn btn-info">Volver</a>
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


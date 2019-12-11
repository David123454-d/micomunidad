<%-- 
    Document   : actulizarEvento
    Created on : 23-sep-2019, 11:48:14
    Author     : Camilo
--%>

<%@page import="DAO.EventoDAO"%>
<%@page import="VO.EventoVO"%>
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
    
    
    InformacionU_VO iuVO = new InformacionU_VO();
    InformacionU_DAO iuDAO = new InformacionU_DAO(iuVO);
    ArrayList<InformacionU_VO>listarrol = iuDAO.listarRol(usuoVO.getUsuario());
    
    String rol ="";
    
    for (int i = 0; i < listarrol.size(); i++) {
       iuVO = listarrol.get(i);
       rol = iuVO.getInfrol();
    }
%>
<html>
  <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
   Evento
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Actualizar Eventos</a>
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
        EventoVO evenVO = new EventoVO();
        EventoDAO evenDAO = new EventoDAO();

        ArrayList<EventoVO> evento = evenDAO.consultarEvento(request.getParameter("id"));
        
        for(int i = 0; i<evento.size(); i++){
           evenVO = evento.get(i);
    %> 
    <div class="container-fluid mt--7 mb-5">
      <div class="row justify-content-center">
        <div class="col-md-10">
          <div class="card shadow">
            <div class="card-header border-0">
                <h2 class="mb-0">Actualizar Evento</h2>
            </div>
            <div class="p-2 border-0 bg-light-neutral">
                
            </div>

            <div class="tab-pane tab-example-result p-5">
                <form action="EventoControlador" method="post" autocomplete="off">
                <div class="row"> 
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="name">Nombre del evento</label>
                        <input name="txtNombre" type="text" value="<%=evenVO.getEvenNombre()%>" class="form-control form-control-alternative" required autofocus> 
                        <br>
                        <label for="name">Fecha</label>
                        <input name="txtFecha" type="date"  min="2019-01-01" max="2019-12-31" value="<%=evenVO.getEvenFecha()%>" class="form-control form-control-alternative" required>
                      </div>
                    </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="name">Descripcion</label>
                            <textarea name="txtDesc" pattern="[A-Za-z0-9]" cols="10" rows="5" class="form-control form-control-alternative" style="resize: none;" required><%=evenVO.getEvenDesc()%></textarea>                      
                          </div>
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-md-6">
                      <div class="form-group">
                        <label for="name">Hora de inicio</label>
                        <input name="txtHInicio" type="time" value="<%=evenVO.getHora_inicio()%>" class="form-control form-control-alternative" required>
                      </div>
                    </div>
                     <div class="col-md-6">
                      <div class="form-group">
                        <label for="name">Hora de finalización</label>
                        <input name="txtHFinal" type="time" value="<%=evenVO.getHora_finalizacion()%>" class="form-control form-control-alternative" required>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                   <div class="col-md-6">
                      <div class="form-group">
                        <label for="name">Lugar</label>
                        <select id="certr" name="txtLugar" value="<%=evenVO.getLugar()%>"class="form-control form-control-alternative" required>
                          
                          <%
                            EventoVO evenVOS = new EventoVO();
                            EventoDAO evenDAOS = new EventoDAO();
                            
                            ArrayList<EventoVO> lugar =  evenDAOS.consultarLugarId(evenVO.getLugar());
                            for(int j = 0; j<lugar.size(); j++){
                                evenVOS = lugar.get(j);
                        %>
                        <option value="" disabled><%=evenVOS.getLugar()%></option>
                          <%
                             }
                            ArrayList<EventoVO> listar = evenDAOS.listarLugares();

                            for(int j = 0; j<listar.size(); j++){
                                evenVOS = listar.get(j);
                          %>
                          <option value="<%=(j+1)%>"><%=evenVOS.getLugar()%></option>
                          <%}%>
                        </select>
                      </div>
                    </div>
                   <div class="col-md-6">
                      <div class="form-group">
                        <label for="name">Estado</label>
                        <select name="txtEstado" value="<%=evenVO.getEstado()%>" class="form-control form-control-alternative" required>
                            <option>Seleccione una opción</option>
                            <option value="EnProceso">En proceso</option>
                            <option value="Activo">Activo</option>
                            <option value="Concluido">Concluido</option>
                        </select>
                      </div>
                    </div>
                    </div>
                   <div class="col-md-12">
                      <div class="form-group">
                        <label for="name">Usuario</label>                          

                        <select id="certr" name="txtUsuario" value="<%=evenVO.getLugar()%>" class="form-control form-control-alternative" required>  
                          <%
                            InformacionU_VO infouVO = new InformacionU_VO();
                            InformacionU_DAO infouDAO = new InformacionU_DAO();
                            
                            ArrayList<InformacionU_VO> usuario =  infouDAO.listarUsuario(evenVO.getUsuario());
                            for(int j = 0; j<usuario.size(); j++){
                                infouVO = usuario.get(j);
                        %>
                        <option value="" disabled><%=infouVO.getInfnombres()%><%out.println(" ");%><%=infouVO.getInfapellidos()%></option>
                          <%
                             }
                            ArrayList<InformacionU_VO> listarusu = infouDAO.listar();

                            for(int j = 0; j<listarusu.size(); j++){
                                infouVO = listarusu.get(j);
                          %>
                          <option value="<%=infouVO.getInfcedula()%>"><%=infouVO.getInfnombres()%><%out.println(" ");%><%=infouVO.getInfapellidos()%></option>
                          <%}%>
                        </select>
                      </div>
                    </div>
                    <div class="row">
                    <div class="col-md-6 mt-5">                    
                      <button class="btn btn-success">Actualizar Evento</button>
                      <input type="hidden" value="<%=request.getParameter("id")%>" name="txtID">
                      <input type="hidden" value="3" name="opcion">
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

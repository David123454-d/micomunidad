<%-- 
    Document   : consultarEvento
    Created on : 23-sep-2019, 11:09:07
    Author     : Camilo
--%>

<%@page import="VO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.EventoDAO"%>
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="VO.EventoVO"%>
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
    
    if(iuDAO.validarDatosU(usuoVO.getUsuario())){
        request.getRequestDispatcher("informacio.jsp").forward(request, response);
    }
    
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
    Consultar Eventos
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Gestionar Eventos</a>
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
    
    <div class="container-fluid mt--7">
        
      <div class="row">
        <div class="col">
            
          <a href="ingresarEvento.jsp" class="btn btn-icon btn-3 btn-secondary mb-4"><i class="ni ni-fat-add"></i>Nuevo Evento</a>        
          <%if(rol.equals("Administrador")){%>
          <a href="pdf.jsp" class="btn btn-icon btn-3 btn-secondary mb-4"><i class="ni ni-fat-add"></i>Generar Reporte</a>        
          <%}%>
          <div class="card shadow">    
            <div class="card-header border-0">
              <h2 class="mb-0">Evento</h2>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                    <tr>
                      <th scope="col">Nombre</th>
                      <th scope="col">Descripción</th>
                      <th scope="col">Fecha</th>
                      <th scope="col">Hora de inicio</th>
                      <th scope="col">Hora de finalización</th>
                      <th scope="col">Lugar</th>
                      <th scope="col">Usuario</th>
                      <th scope="col">Estado</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <%
                        EventoVO evenVO = new EventoVO();
                        EventoDAO evenDAO = new EventoDAO();

                        ArrayList<EventoVO> listar = evenDAO.listar();

                        for(int i = 0; i<listar.size(); i++){
                            evenVO = listar.get(i);
                    %>
                      <td><%=evenVO.getEvenNombre()%></td>                                        
                      <td><%=evenVO.getEvenDesc()%></td>                                        
                      <td><%=evenVO.getEvenFecha()%></td>                                        
                      <td><%=evenVO.getHora_inicio()%></td>                                        
                      <td><%=evenVO.getHora_finalizacion()%></td>                                        
                      <td><%=evenVO.getLugar()%></td>                                        
                      <td><%=evenVO.getUsuario()%></td>                                                                              
                      <td><%if(evenVO.getEstado().equals("EnProceso")){%>
                            <span class="badge badge-dot mr-4">
                                  <i class="bg-yellow"></i>En proceso
                            </span>
                          <%}else if(evenVO.getEstado().equals("Activo")){%>
                            <span class="badge badge-dot mr-4">
                                <i class="bg-success"></i>Aprobado
                            </span>
                          <%}else if(evenVO.getEstado().equals("Inactivo") || evenVO.getEstado().equals("Cancelado")){%>
                            <span class="badge badge-dot mr-4">
                                <i class="bg-danger"></i>Cancelado
                            </span>
                          <%}%>
                      </td>  
                      <%if(rol.equals("Administrador")){%>
                      <td class="text-right">
                        <div class="dropdown">
                          <a class="btn btn-sm btn-icon-only text-dark" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v"></i>
                          </a>
                          <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                            <a class="dropdown-item" href="actualizarEvento.jsp?id=<%=evenVO.getIdEvento()%>">Actualizar</a>
                            <a class="dropdown-item" href="eliminarEvento.jsp?id=<%=evenVO.getIdEvento()%>">Eliminar</a>                              
                          </div>
                        </div>
                      </td>
                      <%}%>
                    </tr>
                    <%}%>
                  </tbody>
              </table>              
            </div>            
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid mt-5">        
      <div class="row justify-content-center">
        <div class="col-md-6">
                 <%
            if(request.getAttribute("Error")!= null){
            %>
            <div class="mt-5 alert alert-danger alert-dismissible fade show" role="alert">
              <span class="alert-inner--icon"><i class="ni ni-fat-remove"></i></span>
              <span class="alert-inner--text"><strong>Ups! </strong>${Error}</span>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
            </div>            
            <%}else if(request.getAttribute("Exitoso")!= null){%>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
              <span class="alert-inner--icon"><i class="ni ni-check-bold"></i></span>
              <span class="alert-inner--text"><strong>Bien! </strong>${Exitoso}</span>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
        <%}%>
          
          
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

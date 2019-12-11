<%-- 
    Document   : consultarCurso
    Created on : 13/08/2019, 09:08:57 AM
    Author     : APRENDIZ
--%>

<%@page import="DAO.prestamoDAO"%>
<%@page import="VO.prestamoVO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="java.util.ArrayList"%>
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
    
    String usuario="";
    
    if(iuDAO.validarDatosU(usuoVO.getUsuario())){
        request.getRequestDispatcher("informacio.jsp").forward(request, response);
    }
    
    for (int i = 0; i < listarrol.size(); i++) {
       iuVO = listarrol.get(i);
       rol = iuVO.getInfrol();
       usuario = iuVO.getInfusuario();
    }
%>
<html>
    <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Prestamos
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Gestionar Prestamos</a>
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
          <a href="ingresarPrestamo.jsp" class="btn btn-icon btn-3 btn-secondary mb-4"><i class="ni ni-fat-add"></i>Nuevo Préstamo</a>        
            <div class="card shadow">    
            <div class="card-header border-0">
              <h2 class="mb-0">Préstamos</h2>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                    <tr>
                      <th scope="col">Lugar</th>
                      <th scope="col">Hora de entrada</th>
                      <th scope="col">Hora de salida</th>
                      <th scope="col">Fecha</th>
                      <th scope="col">Descripción</th>
                      <th scope="col">Usuario</th>
                      <th scope="col">Estado</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <%
                        prestamoVO presVO = new prestamoVO();
                        prestamoDAO presDAO = new prestamoDAO();

                        if(rol.equals("Administrador")){
                        
                        ArrayList<prestamoVO> listar = presDAO.listar();

                        for(int i = 0; i<listar.size(); i++){
                            presVO = listar.get(i);
                    %>
                      <td><%=presVO.getId_lugar()%></td>                                        
                      <td><%=presVO.getTiempo()%></td>                                                          
                      <td><%=presVO.getHSalida()%></td> 
                      <td><%=presVO.getFecha()%></td>                                                          
                      <td><%=presVO.getDescripcion()%></td>                                                          
                      <td><%=presVO.getUsuario()%></td>
                      <td><%
                          if(presVO.getEstado().equals("Pendiente")){%>
                          <span class="badge badge-dot mr-4">
                            <i class="bg-yellow"></i> En proceso
                          </span>
                          <%}else if(presVO.getEstado().equals("Activo")){%>
                          <span class="badge badge-dot mr-4">
                            <i class="bg-success"></i> Activo
                         </span>
                            <%}else if(presVO.getEstado().equals("Inactivo")){%>
                          <span class="badge badge-dot mr-4">
                            <i class="bg-danger"></i> Inactivo
                          </span>
                            <%}%></td>   
                      <td class="text-right">
                        <div class="dropdown">
                          <a class="btn btn-sm btn-icon-only text-dark" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v"></i>
                          </a>
                          <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                            <a class="dropdown-item" href="actualizarPrestamo.jsp?id=<%=presVO.getId_prestamo()%>">Actualizar</a>
                            <a class="dropdown-item" href="eliminarPrestamo.jsp?id=<%=presVO.getId_prestamo()%>">Eliminar</a>                              
                          </div>
                        </div>
                      </td>
                    </tr>
                    
                    <%}
                    }else if(rol.equals("Ciudadano")){
                      ArrayList<prestamoVO> listar = presDAO.consultarPrestamoUsu(usuario);
                      for(int i = 0; i<listar.size(); i++){
                            presVO = listar.get(i);
                    %>
                      <td><%=presVO.getId_lugar()%></td>                                        
                      <td><%=presVO.getTiempo()%></td>                                                          
                      <td><%=presVO.getHSalida()%></td> 
                      <td><%=presVO.getFecha()%></td>                                                          
                      <td><%=presVO.getDescripcion()%></td>                                                          
                      <td><%=presVO.getUsuario()%></td>                                                          
                      <td><%
                          if(presVO.getEstado().equals("Pendiente")){%>
                          <span class="badge badge-dot mr-4">
                            <i class="bg-yellow"></i> En proceso
                          </span>
                          <%}else if(presVO.getEstado().equals("Activo")){%>
                          <span class="badge badge-dot mr-4">
                            <i class="bg-success"></i> Activo
                         </span>
                            <%}else if(presVO.getEstado().equals("Inactivo")){%>
                          <span class="badge badge-dot mr-4">
                            <i class="bg-danger"></i> Inactivo
                          </span>
                            <%}%></td>   
                    </tr>
                    <%}
                     }
                    %>
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
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
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


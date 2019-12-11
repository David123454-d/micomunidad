<%-- 
    Document   : consultarCurso
    Created on : 13/08/2019, 09:08:57 AM
    Author     : APRENDIZ
--%>

<%@page import="VO.UsuarioVO"%>
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CursoDAO"%>
<%@page import="VO.CursoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession miSesion = (HttpSession)request.getSession();
    UsuarioVO usuoVO = (UsuarioVO)miSesion.getAttribute("usuario");
    if(usuoVO != null){
    }else{
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } 
    
    boolean bandera = false;
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
    Consultar Cursos
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Gestionar cursos</a>
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
          <%if(rol.equals("Administrador")){%>                            
          <a href="ingresarCurso.jsp" class="btn btn-icon btn-3 btn-secondary mb-4"><i class="ni ni-fat-add"></i>Nuevo curso</a>        
          <%}%>
          <div class="card shadow">
            <div class="card-header border-0">
              <h2 class="mb-0">Cursos</h2>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                    <tr>
                      <th scope="col">Nombre</th>
                      <th scope="col">Descripción</th>
                      <th scope="col">Cupos</th>
                      <th scope="col">Duración</th>
                      <th scope="col">Horario</th>
                      <th scope="col">Costo</th>
                      <th scope="col">Certificado</th>
                      <th scope="col">Institución</th>
                      <th scope="col">Instructor</th>
                      <th scope="col">Lugar</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <%
                        CursoVO CurVO = new CursoVO();
                        CursoDAO CurDAO = new CursoDAO();

                        ArrayList<CursoVO> listar = CurDAO.listar();

                        for(int i = 0; i<listar.size(); i++){
                            CurVO = listar.get(i);
                    %>
                      <td><%=CurVO.getCurNombre()%></td>                                        
                      <td><%=CurVO.getCurDesc()%></td>                                        
                      <td><%=CurVO.getCurCupos()%></td>                                        
                      <td><%=CurVO.getCurDuracion()%> Meses</td>                                        
                      <td><%=CurVO.getCurHorarios()%></td>                                        
                      <td><%=CurVO.getCurCostos()%></td>                                        
                      <td><%=CurVO.getCurCertificado()%></td>                                        
                      <td><%=CurVO.getCurInstitucion()%></td>                                        
                      <td><%=CurVO.getCurInstructor()%></td>                                        
                      <td><%=CurVO.getCurLugar()%></td>                                        
                      <%if(rol.equals("Administrador")){%>                                                
                      <td class="text-right">
                        <div class="dropdown">
                          <a class="btn btn-sm btn-icon-only text-dark" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v"></i>
                          </a>
                          <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                            <a class="dropdown-item" href="actualizarCurso.jsp?id=<%=CurVO.getCurID()%>">Actualizar</a>
                            <a class="dropdown-item" href="eliminarCurso.jsp?id=<%=CurVO.getCurID()%>">Eliminar</a>
                            <a class="dropdown-item" href="ingresarInscripcion.jsp?id=<%=CurVO.getCurID()%>">Solicitar inscripción</a>
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


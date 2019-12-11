<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="VO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CursoDAO"%>
<%@page import="VO.CursoVO"%>
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

     InformacionU_VO iuVO = new InformacionU_VO();
    InformacionU_DAO iuDAO = new InformacionU_DAO(iuVO);
   
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Perfil
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="menu.jsp">Ingresar información personal</a>
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
        <div class="col-md-7">
          <div class="card shadow">
            <div class="card-header border-0">
                <h2 class="mb-0">Ingresa tus datos personales</h2>
            </div>
            <div class="p-2 border-0 bg-light-neutral">

            </div>
            <div class="tab-pane tab-example-result p-5">
            <form action="Informacion" method="post" autocomplete="off">
                <div class="row">                
                <div class="col-md-12">
                    <p>Por favor usuario con el correo <strong><%=usuoVO.getUsuario()%></strong> Ingrese sus datos personales para poder interactuar con el aplicativo.</p><br>
                    <hr class="my-3">
                </div>
              </div>          
               <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name">* Cedula</label>
                    <input type="number" maxlength="10" class="form-control form-control-alternative" name="txtCedula" id="cedula" placeholder="">
                  </div>
                    </div>
                </div>
                <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="cups">* Nombres</label>
                    <input type="text" name="txtNombre" placeholder="Ex: Maicol David" id="cups" required class="form-control form-control-alternative" autofocus/>
                  </div>
                </div>                 
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="cups">* Apellidos</label>
                    <input type="text" name="txtApellidos" placeholder="Ex: Otero Rojas" id="cups" required class="form-control form-control-alternative" />
                  </div>
                </div>                                  
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name">* Télefono</label>
                    <input type="number" maxlength="10" class="form-control form-control-alternative" name="txtTelefono" id="cedula" placeholder="">
                  </div>
                </div>              
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name">* Celular</label>
                    <input type="number" maxlength="10" class="form-control form-control-alternative" name="txtCelular" value="" id="cedula" placeholder="">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name">* Dirección</label>
                    <input type="text" maxlength="35" class="form-control form-control-alternative" name="txtDireccion" id="cedula" placeholder="" >
                  </div>
                </div>                
                
                  <div class="col-md-1"></div>                                
              </div>
                           
              <div class="row">
                <div class="col-md-6 mt-5">                    
                  <a href="consultarCurso.jsp" class="btn btn-info">Volver</a>
                  <button class="btn btn-success">Ingresar</button>
                  <input type="hidden" value="<%=usuoVO.getUsuario()%>" name="txtUsuario">
                  <input type="hidden" value="1" name="opcion">
                  
                </div>
              </div>
            </form>
            </div>
          </div>
          
        </div>
         <div class="alert alert-danger alert-dismissible fade show d-none col-md-5" id="respuesta" role="alert">
            <span class="alert-inner--icon"><i class="ni ni-fat-remove"></i></span>
            <span class="alert-inner--text"><strong>Ups! </strong>${Error}</span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
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
  <script src="./assets/js/validaciones.js"></script>
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
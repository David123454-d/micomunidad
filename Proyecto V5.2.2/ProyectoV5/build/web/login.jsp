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
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Inicio de sesion
  </title>
  <!-- Favicon -->
  <link href="assets/img/brand/favicon.ico" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/custom.css">
</head>

<body class="fondo">
  <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-horizontal navbar-expand-md navbar-dark mt-5">
      <div class="container">
        <a class="navbar-brand" href="../index.html">
          <img src="assets/img/brand/white.png" />
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar-collapse-main">
          <!-- Collapse header -->
          <div class="navbar-collapse-header d-md-none">
            <div class="row">
              <div class="col-6 collapse-brand">
                <a href="../index.html">
                  <img src="assets/img/brand/blue.png">
                </a>
              </div>
              <div class="col-6 collapse-close">
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                  <span></span>
                  <span></span>
                </button>
              </div>
            </div>
          </div>
          <!-- Navbar items -->
          <ul class="navbar-nav ml-auto">            
            <li class="nav-item">
              <a class="nav-link nav-link-icon" href="registro.jsp">
                <i class="ni ni-key-25 "></i>
                <span class="nav-link-inner--text ">Registro</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Header -->
    <div class="header py-5 py-lg-6">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-lg-5 col-md-6 mt-4">
              
            </div>
          </div>
        </div>
      </div>
      
    </div>
    
    
    <!-- Page content -->
    <div class="container mt--5 pb-3">
        
      <!-- Table -->
      <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8">
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
          <div class="card shadow-md border-0">            
            <div class="card-body px-lg-5 py-lg-5">
              <div class="text-center text-muted mb-5">
                Iniciar sesión
              </div>
              <form action="Usuario" method="post" autocomplete="off">
                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                    </div>
                      <input class="form-control form-control-alternative" placeholder="Correo" name="txtUsu" type="email"  required autofocus>
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                      <input class="form-control" placeholder="Contraseña" name="txtCla" type="password" required>
                  </div>
                </div>
                  <div class="row ml-2" style="float: left;">
                      <i class=""><a class="text-gray" href="">Registrate ahora.</a></i>
                  </div>
                  <div class="row mr-2" style="float: right;">
                      <i class="float-right"><a href="" class="text-gray">¿Olvidaste tu contraseña?</a></i>
                  </div>
                <div class="row mt-5 justify-content-center">
                    <input type="hidden" name="opcion" value="6">                    
                    <button type="submit" class="btn btn-dark mt-4">Iniciar sesion</button>
                </div>
                  
              </form>               
            </div>            
          </div>
            
        </div>
      </div>
    </div>
    <div class="container-fluid mt-2">        
      <div class="row justify-content-center">
        <div class="col-md-3">
         
          
          
        </div>
      </div>
    </div>
  </div>
  <!-- Footer -->
  <footer class="py-5 mt-5">
    <div class="container">
      <div class="row align-items-center justify-content-center">
        <div class="col-xl-6">
          <div class="copyright text-center text-xl-left text-white">
            
          </div>
        </div>
        <div class="col-xl-6">
          
        </div>
      </div>
    </div>
  </footer>
  </div>
  <!--   Core   -->
  <script src="assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <!--   Argon JS   -->
  <script src="assets/js/argon-dashboard.min.js?v=1.1.0"></script>
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
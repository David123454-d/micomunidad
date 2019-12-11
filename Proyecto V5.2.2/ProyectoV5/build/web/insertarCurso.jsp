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
    Argon Dashboard - Free Dashboard for Bootstrap 4 by Creative Tim
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Plantilla</a>
        <!-- Form -->
        
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="./assets/img/theme/team-4-800x800.jpg">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold">Jessica Jones</span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="./examples/profile.html" class="dropdown-item">
                <i class="ni ni-single-02"></i>
                <span>My profile</span>
              </a>
              <a href="./examples/profile.html" class="dropdown-item">
                <i class="ni ni-settings-gear-65"></i>
                <span>Settings</span>
              </a>
              <a href="./examples/profile.html" class="dropdown-item">
                <i class="ni ni-calendar-grid-58"></i>
                <span>Activity</span>
              </a>
              <a href="./examples/profile.html" class="dropdown-item">
                <i class="ni ni-support-16"></i>
                <span>Support</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="#!" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
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
                <h2 class="mb-0">Ingresar curso</h2>
            </div>
            <div class="p-2 border-0 bg-light-neutral">

            </div>
            <div class="tab-pane tab-example-result p-5">
            <form>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="name">Nombre del curso</label>
                    <input type="text" class="form-control form-control-alternative" id="name" name="txtNombre" placeholder="Ex: Pepe Mujica">
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="cups">Cupos</label>
                    <input type="number" placeholder="Ex: 20 Cupos" id="cups" name="txtCupos" class="form-control form-control-alternative" />
                  </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                      <label for="cups">Duracion (Meses)</label>
                      <input type="number" placeholder="Ex: 12 Meses" name="txtDuracion" id="cups" class="form-control form-control-alternative" />
                    </div>
                  </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                      <label for="hr">Horarios</label>
                      <select name="horarios" id="hr" name="txtHorarios" class="form-control form-control-alternative">
                        <option value="">Escoja una opción</option>
                        <option value="LaVD">Lunes a viernes - Diurno</option>
                        <option value="LaVT">Lunes a viernes - Tarde</option>
                        <option value="SD">Sabado - Diurno</option>
                        <option value="ST">Sabado - Tarde</option>
                      </select>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">                  
                      <label for="vl">Costo</label>  
                      <input id="vl" class="form-control form-control-alternative" name="txtCosto" placeholder="Si no tiene costo ingrese 0" type="number">                                          
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                      <label for="cert">Certificado</label>
                      <select name="horarios" id="certr" name="txtCertificado" class="form-control form-control-alternative">
                        <option value="">Escoja una opción</option>
                        <option value="Yes">Si</option>
                        <option value="No">No</option>
                      </select>
                  </div>
                </div>
                
              </div>
              <div class="row">                
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="inst">Institución</label>
                    <input type="text" class="form-control form-control-alternative" name="txtInstitucion" id="inst" name="institucion">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="instruc">Instructor</label>
                    <input type="text" id="instruc" name="instructor" name="txtInstructor" class="form-control form-control-alternative">
                  </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="cert">Lugar</label>
                        <select name="horarios" id="certr" name="txtLugar" class="form-control form-control-alternative">
                          <option value="">Escoja una opción</option>
                          <option value="Yes">Lugar 1</option>
                          <option value="No">Lugar 2</option>
                        </select>
                    </div>
                  </div>
              </div>
              <div class="row">
                  <div class="col-md-6">
                      <label for="desc">Descripción del curso</label>
                      <textarea name="txtDesc" id="desc" cols="10" rows="5" class="form-control form-control-alternative" style="resize: none;"></textarea>
                  </div>                  
              </div>
              <div class="row">
                <div class="col-md-6 mt-5">                    
                  <button class="btn btn-success">Ingresar Curso</button>
                  <button class="btn btn-info">Volver</button>
                </div>
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="alert alert-success alert-dismissible fade show" role="alert">
              <span class="alert-inner--icon"><i class="ni ni-check-bold"></i></span>
              <span class="alert-inner--text"><strong>Excelete!</strong> El curso se ha ingresado correctamente</span>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
              <span class="alert-inner--icon"><i class="ni ni-fat-remove"></i></span>
              <span class="alert-inner--text"><strong>Ups!</strong> Hubo un error al ingresar el curso, intente nuevamente</span>
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
        </div>
      </div>
    </div>
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
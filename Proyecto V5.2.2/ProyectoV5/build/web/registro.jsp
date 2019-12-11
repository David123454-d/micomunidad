<%@page import="VO.UsuarioVO"%>
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
    Registro
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
              <a class="nav-link nav-link-icon" href="login.jsp">
                <i class="ni ni-key-25 "></i>
                <span class="nav-link-inner--text ">Iniciar sesi�n</span>
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
    <div class="container mt--5 pb-5">
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
              <div class="text-center text-muted mb-4">
                Crea una cuenta
              </div>
               <%
                   UsuarioVO usuVO = null;
                   if (request.getAttribute("datos") != null) {                       
                       usuVO = (UsuarioVO)request.getAttribute("datos");
                    }
               %>
              <form action="Usuario" method="POST" autocomplete="off">
                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                    </div>
                      <%
                          if(usuVO != null){%>
                              <input class="form-control form-control-alternative" name="txtUsu" placeholder="Correo"  type="email" required value="<%=usuVO.getUsuario() %>" autofocus>
                          <%}else{%>
                          <input class="form-control form-control-alternative" name="txtUsu" placeholder="Correo"  type="email" required autofocus>
                        <%}
                      %>
                      
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                      <input class="form-control" placeholder="Contrase�a" name="txtCla" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Debe contener al menos un n�mero y una letra may�scula y min�scula, y al menos 8 o m�s caracteres" required>
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                    </div>
                    <input class="form-control" placeholder="Repetir contrase�a" name="txtCla2" type="password" required>
                  </div>
                </div>                
                <div class="row my-4">
                  <div class="col-12">
                    <div class="custom-control custom-control-alternative custom-checkbox">
                      <input class="custom-control-input" id="customCheckRegister" type="checkbox" required>
                      <label class="custom-control-label" for="customCheckRegister">
                        <span class="text-muted">Acepta los <a href="#!" data-toggle="modal" data-target="#exampleModal" class="text-dark">T�rminos y Condiciones</a></span>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="text-center">
                  <input type="hidden" name="opcion" value="5">
                  <button type="submit" class="btn btn-dark mt-4">Completar registro</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          INFORMACI�N RELEVANTE<br>

          Es requisito necesario para la adquisici�n de los productos que se ofrecen en este sitio, que lea y acepte los siguientes T�rminos y Condiciones que a continuaci�n se redactan. El uso de nuestros servicios as� como la compra de nuestros productos implicar� que usted ha le�do y aceptado los T�rminos y Condiciones de Uso en el presente documento. Todas los productos  que son ofrecidos por nuestro sitio web pudieran ser creadas, cobradas, enviadas o presentadas por una p�gina web tercera y en tal caso estar�an sujetas a sus propios T�rminos y Condiciones. En algunos casos, para adquirir un producto, ser� necesario el registro por parte del usuario, con ingreso de datos personales fidedignos y definici�n de una contrase�a.<br><br>
          

        El usuario puede elegir y cambiar la clave para su acceso de administraci�n de la cuenta en cualquier momento, en caso de que se haya registrado y que sea necesario para la compra de alguno de nuestros productos. www.micomunidad.com no asume la responsabilidad en caso de que entregue dicha clave a terceros.<br><br>


        Los precios de los productos ofrecidos en esta Tienda Online es v�lido solamente en las compras realizadas en este sitio web.<br><br>

        LICENCIA<br><br>

        micomunidad  a trav�s de su sitio web concede una licencia para que los usuarios utilicen  los productos que son vendidos en este sitio web de acuerdo a los T�rminos y Condiciones que se describen en este documento.<br><br>

        USO NO AUTORIZADO<br><br>

        En caso de que aplique (para venta de software, templetes, u otro producto de dise�o y programaci�n) usted no puede colocar uno de nuestros productos, modificado o sin modificar, en un CD, sitio web o ning�n otro medio y ofrecerlos para la redistribuci�n o la reventa de ning�n tipo.<br><br>

        PROPIEDAD<br><br>

        Usted no puede declarar propiedad intelectual o exclusiva a ninguno de nuestros productos, modificado o sin modificar. Todos los productos son propiedad  de los proveedores del contenido. En caso de que no se especifique lo contrario, nuestros productos se proporcionan  sin ning�n tipo de garant�a, expresa o impl�cita. En ning�n esta compa��a ser�  responsables de ning�n da�o incluyendo, pero no limitado a, da�os directos, indirectos, especiales, fortuitos o consecuentes u otras p�rdidas resultantes del uso o de la imposibilidad de utilizar nuestros productos.<br><br>

        PRIVACIDAD<br><br>

        Este sitio web www.micomunidad.com garantiza que la informaci�n personal que usted env�a cuenta con la seguridad necesaria. Los datos ingresados por usuario o en el caso de requerir una validaci�n de los pedidos no ser�n entregados a terceros, salvo que deba ser revelada en cumplimiento a una orden judicial o requerimientos legales.<br><br>

        La suscripci�n a boletines de correos electr�nicos publicitarios es voluntaria y podr�a ser seleccionada al momento de crear su cuenta.<br><br>

        micomunidad reserva los derechos de cambiar o de modificar estos t�rminos sin previo aviso.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>        
      </div>
    </div>
  </div>
</div>
    
  </div>
  <!-- Footer -->
  <footer class="py-5 mt-5">
    <div class="container">
      <div class="row align-items-center justify-content-xl-between">
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
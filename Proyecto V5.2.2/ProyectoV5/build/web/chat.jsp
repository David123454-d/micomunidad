<%-- 
    Document   : chat
    Created on : 25-sep-2019, 15:51:22
    Author     : Camilo
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="VO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    
    Calendar c = Calendar.getInstance();
    Calendar c1 = new GregorianCalendar();
    
    String dia = Integer.toString(c.get(Calendar.DATE));
    String mes = Integer.toString(c.get(Calendar.MONTH));
    String annio = Integer.toString(c.get(Calendar.YEAR));
    
    String fecha = annio+"/"+mes+"/"+dia;
%>
<!DOCTYPE html>
<html>
<html>
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Chat</a>
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
        <div class="row">
            <div class="col">
                <div class="card shadow">
                      <div class="card-header border-0">
        <h2 class="mb-0">Chat</h2>
    </div>
        <section>			
                <div class="">
                        <form id="formChat" role="form">
                                <div class="form-group">
                                        <div class="">
                                                <div class="col-md-12" >
                                                        <div id="conversation" style="height:200px; border: 1px solid #CCCCCC; padding: 12px;  border-radius: 5px; overflow-x: hidden;background-color:white;">

                                                        </div>
                                                </div>
                                        </div>
                                </div>
                                <div class="form-group">
                                    <div class="card-header border-0">
                                        <h2 class="mb-0">Mensaje</h2>
                                    </div>   
                                    <div class="col-md-12">
                                        <textarea id="message" name="message" placeholder="mensaje"  pattern="[A-Za-z0-9]" class="form-control" rows="3" autofocus></textarea>
                                    </div>
                                        <input name="usuario" value="<%=usuoVO.getUsuario()%>" type="hidden" value="michel">
                                        <input name="fecha" value="<%=fecha%>" type="hidden" value="michel">
                                </div>
                                <div class="col-md-6 mt-5">
                                <button id="send" class="btn btn-success">Enviar</button>
                                <br>
                                <br>
                                </div>
                        </form>
                </div>
        </section>  
                </div>
            </div>
        </div>
                  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>		
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
        $(document).on("ready", function(){	
                registerMessages();
                $.ajaxSetup({"cache":false});
                setInterval("loadOldMessages()", 500);
        });

        var registerMessages = function(){
                $("#send").on("click", function(e){
                        e.preventDefault();
                        var frm= $("#formChat").serialize();
                        $.ajax({
                                type:"POST",
                                url: "ChatControlador",
                                data: frm
                        }).done(function(info){
                        $("#message").val("");	
                        $("#usuario").val("");
                        })
                });
        }

        var loadOldMessages = function(){
                $.ajax({
                        type: "POST",
                        url: "traerChat"
                }).done(function(info){
                        $("#conversation").html(info);
                        $("#conversation p:last-child").css({"background-color": "lightgreen",  "padding-botton": "20px"})
                });
        }
</script>
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



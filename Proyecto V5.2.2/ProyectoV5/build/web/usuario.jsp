<%-- 
    Document   : usuario.jsp
    Created on : 13/08/2019, 09:33:54 AM
    Author     : APRENDIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Gestionar Usuario</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="assets/vendor/datepicker/tempusdominus-bootstrap-4.css" />
        <link rel="stylesheet" href="assets/vendor/inputmask/css/inputmask.css" />
    </head>
    <body>
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <div class="row">
                    <div class="col-xl-10">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="section-block" id="basicform">
                                <h3 class="section-title">Gestionar usuario</h3>                    
                            </div>
                            <div class="card">
                                <div class="card-body">
                                <form method="post" action="Usuario" autocomplete="off">
                                <div class="form-group">
                                    <label for="nm" class="col-form-label">Ingrese Usuario: </label>
                                    <input type="text" name="txtUsu" id="nm" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="dec" class="col-form-label">Ingrese Contraseña: </label>
                                    <input type="password" name="txtCla" id="dec" class="form-control"></input>
                                </div>
                                <div class="form-group">
                                    <button type="hidden" value="1" name="opcion" class="btn btn-primary btn-lg btn-block">Ingresar</button>    
                                </div>
                                <div class="form-group">
                                    <button type="hidden" value="2" name="opcion" class="btn btn-primary btn-lg btn-block">Actualizar</button>    
                                </div>
                                <div class="form-group">
                                    <button type="hidden" value="4" name="opcion" class="btn btn-primary btn-lg btn-block">Eliminar</button> 
                                </div>
                            </form>
                            
                            <%
                            if(request.getAttribute("Error")!= null){
                            %>        
                                <p class="Error">${Error}</p>
                            <%}else if(request.getAttribute("Exitoso")!= null){%>
                                <p>Registrado con exito</p>
                            <%}%>
                            </div>
                            </div>
                        </div>
                    </div>
                    </div>  
                </div>
            </div>
        </div>         
        <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
        <script src="assets/libs/js/main-js.js"></script>
        <script src="assets/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>             
    </body>
</html>

<%-- 
    Document   : actualizarIU
    Created on : 29/08/2019, 12:50:35 AM
    Author     : siriu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Gestionar Datos personales</title>
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
                                                                <%
                                    InformacionU_VO iuVO = new InformacionU_VO();
                                    InformacionU_DAO iuDAO = new InformacionU_DAO();

                                    ArrayList<InformacionU_VO> listar = iuDAO.listar();
                                    if(request.getAttribute("columna") != null){
                                    int ad = Integer.parseInt(request.getAttribute("columna").toString());
                                        for(int i = 0; i<listar.size(); i++){
                                            if(i == ad){
                                            iuVO = listar.get(i);
                                            
                                %>
                                <div class="card-body">
                                    <form method="post" action="Informacion" autocomplete="off">
                                        <div class="form-group">
                                            <label for="nm" class="col-form-label">Ingrese Cedula: </label>
                                            <input type="text" pattern="[A-Za-z0-9]" value="<%=iuVO.getInfcedula()%>" readonly name="txtCedula" id="nm" class="form-control" autofocus>
                                        </div>
                                        <div class="form-group">
                                            <label for="dec" class="col-form-label">Ingrese Nombres: </label>
                                            <input type="text" pattern="[A-Za-z0-9]" value="<%=iuVO.getInfnombres()%>" name="txtNombre" id="dec" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="cups" class="col-form-label">Ingrese Apellidos: </label>
                                            <input type="text" pattern="[A-Za-z0-9]" value="<%=iuVO.getInfapellidos()%>"  name="txtApellidos" id="cups" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="hh" class="col-form-label">Ingrese Telefono: </label>
                                            <input type="number" min="1000000" max="9999999999"  value="<%=iuVO.getInftelefono()%>" name="txtTelefono" id="hh" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="ll" class="col-form-label">Ingrese Celular: </label>
                                            <input type="number" min="1000000" max="9999999999" value="<%=iuVO.getInfcelular()%>" name="txtCelular" id="ll" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="pp" class="col-form-label">Ingrese Estado: </label>
                                            <input type="text" pattern="[A-Za-z0-9]" value="<%=iuVO.getInfestado()%>" name="txtEstado" id="pp" class="form-control">
                                        </div>                               
                                        <div class="form-group">
                                            <label for="pp" class="col-form-label">Ingrese Rol: </label>
                                            <input type="text" pattern="[A-Za-z0-9]" value="<%=iuVO.getInfrol()%>" name="txtRol" id="pp" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="uu" class="col-form-label">Ingrese Usuario: </label>
                                            <input type="text" pattern="[A-Za-z0-9]" value="<%=iuVO.getInfusuario()%>" name="txtUsuario" id="uu" class="form-control">
                                        </div>
                                        <%}
                                         }
                                        }                                           
                                        %>
                                        <button type="hidden" value="2" name="opcion" class="btn btn-primary btn-lg btn-block">Actuaizar</button>    
                                    </form>
                                    
                                    <%
                                        if(request.getAttribute("Error")!= null){
                                        %>        
                                            <p class="Error">${Error}</p>
                                        <%}else if(request.getAttribute("Exitoso")!= null){%>
                                            <p>Ingresado Correctamente</p>
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

<%-- 
    Document   : eliminarIU
    Created on : 29/08/2019, 01:02:19 AM
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
        <title>Gestionar Información</title>
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
                                <h3 class="section-title">¿Desea eliminar esta persona?</h3>                    
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
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="nm" class="col-form-label">Cedula de la persona: </label>
                                            <input type="text" name="txtCedula" id="nm" class="form-control" readonly value="<%=iuVO.getInfcedula()%>">
                                        </div>
                                            <input type="hidden" value="<%=iuVO.getInfnombres()%>" name="txtNombre" id="dec" class="form-control">
                                            <input type="hidden" value="<%=iuVO.getInftelefono()%>" name="txtTelefono" id="hh" class="form-control">
                                            <input type="hidden" value="<%=iuVO.getInfcelular()%>" name="txtCelular" id="ll" class="form-control">
                                            <input type="hidden" value="Inactivo" name="txtEstado" id="pp" class="form-control">
                                            <input type="hidden" value="<%=iuVO.getInfrol()%>" name="txtRol" id="pp" class="form-control">
                                            <input type="hidden" value="<%=iuVO.getInfusuario()%>" name="txtUsuario" id="uu" class="form-control">
                                    </div>                                                                                                                                                                                    
                                    <%
                                          }
                                        }
                                    }
                                    
                                    %>
                                    <input type="hidden" value="2" name="opcion">
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-lg btn-space">Eliminar</button>
                                        <a href="consultarCurso.jsp" class="btn btn-secondary btn-lg btn-space">Regresar</a>
                                    </div>
                                </form>
                                <%
                                    if(request.getAttribute("Error")!= null){
                                    %>        
                                        <p class="Error">${Error}</p>
                                    <%}else if(request.getAttribute("Exitoso")!= null){%>
                                    
                                        <p class="alert-success">Actualización Completada</p>
                                    
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
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
        <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
        <script src="assets/libs/js/main-js.js"></script>
        <script src="assets/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>
    </body>
</html>

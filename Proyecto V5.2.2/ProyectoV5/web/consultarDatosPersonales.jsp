<%-- 
    Document   : consultarDatosPersonales
    Created on : 29/08/2019, 12:49:38 AM
    Author     : siriu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="VO.InformacionU_VO"%>
<%@page import="DAO.InformacionU_DAO"%>
<%@page import="VO.InformacionU_VO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Gestionar Curso</title>
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
                                <h3 class="section-title">Gestionar Información Usuario</h3>                    
                            </div>
                            <div class="card">
                                <div class="card-body">
                            <h1>Consultar Información Usuario</h1>
                            <form action="Informacion" method="post">
                                <table class="table table-striped">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Cedula</th>
                                            <th scope="col">Nombres</th>                                            
                                            <th scope="col">Apellidos</th>
                                            <th scope="col">Telefono</th>                                            
                                            <th scope="col">Celular</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Rol</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col">Opciones</th>
                                        </tr>
                                    </thead>
                                    <%
                                        InformacionU_VO iuVO = new InformacionU_VO();
                                        InformacionU_DAO iuDAO = new InformacionU_DAO();

                                        ArrayList<InformacionU_VO> listar = iuDAO.listar();

                                        for(int i = 0; i<listar.size(); i++){
                                            iuVO = listar.get(i);
                                    %>
                                    <tr>
                                        <td><%=iuVO.getInfcedula()%></td>
                                        <td><%=iuVO.getInfnombres()%></td>
                                        <td><%=iuVO.getInfapellidos()%></td>
                                        <td><%=iuVO.getInftelefono()%></td>
                                        <td><%=iuVO.getInfcelular()%></td>
                                        <td><%=iuVO.getInfestado()%></td>
                                        <td><%=iuVO.getInfrol()%></td>
                                        <td><%=iuVO.getInfusuario()%></td>
                                        <input type="hidden" name="columnatxt" value="<%=i%>">
                                    <form action="Informacion" method="post">
                                        <input type="hidden" name="opcion" value="5">
                                        <input type="hidden" name="columnatxt" value="<%=i%>">
                                        <td><button type="submit" class="btn btn-xs btn-warning btn-space">Editar</button><span>   </span>
                                    </form>
                                    <form action="Informacion" method="post">
                                      <button type="submit" class="btn btn-xs btn-danger btn-space">Inactivar</button></td>  
                                        <input type="hidden" name="opcion" value="6">
                                        <input type="hidden" name="columnatxt" value="<%=i%>">
                                        
                                    </form>
                                    </tr>
                                    <%}%>
                                </table>
                            </form>
                                <%
                                    if(request.getAttribute("Error")!= null){
                                    %>        
                                        <p class="Error">${Error}</p>
                                    <%}else if(request.getAttribute("Exitoso")!= null){%>
                                    <div class="alert alert-success m-t-10" role="alert">
                                        ¡Actualizacion Exitosa!
                                    </div>
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

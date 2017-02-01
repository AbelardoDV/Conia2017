<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!--------------- Completar ----------------------->
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Northwind 2!!!</title>
        <link rel="shortcut icon" href="<spring:url value="/resources/img/store_icon.png"/>">
        <link rel="stylesheet" href='<spring:url value="/resources/css/bootstrap.css"/>' />
        <script type='text/javascript' src='<spring:url value="/resources/js/jquery-1.11.1.min.js"/>'></script>
    </head>

    <body>
        <div class="navbar navbar-fixed-top" style="position: relative">
            <div class="navbar-inner">
                <div class="container" style="width: auto; padding: 0 20px;">
                    <ul class="nav">
                        <li class="active">
                            <a href="#">
                                <a href="#">${employeeBean.firstName} ${employeeBean.lastName} (${employeeBean.email}) - 
                                    <sec:authorize access="hasRole('ROLE_ADMINISTRATOR')"> Administrador </sec:authorize>
                                     <sec:authorize access="hasRole('ROLE_MANAGER')"> Gerente </sec:authorize>
                                     <sec:authorize access="hasRole('ROLE_EMPLOYEE')"> Usuario </sec:authorize>
                                </a>
                            </a>
                        </li>
                    </ul>
                    <a href="<spring:url value='/logout.do'/>" class="btn pull-right">Cerrar Sessión</a>
                </div>
            </div>
        </div>
        <div>  
            <div class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <header class="unit hero-unit">
                            <h1>Northwind Traders</h1><br>
                            <p>Home Page - Administrador</p>
                        </header>
                    </div>
                </div>
            </div>
        </div> 
        <br>

        <div class="row-fluid" style=" width: 80%; padding:0 10%;">
            <div class="span2">
                <ul class="nav nav-list well">
                    <li  class="active"><a href="#"><i class="icon-home icon-white"></i>Inicio</a></li>
                    <li><a href="<spring:url value='/admin/employee'/>"><i class="icon-chevron-right"></i>Empleados</a></li>
                </ul>
            </div>
        </div>


        <div class="container"  style="padding-top: 50px;"><hr>
            <footer class="footer">
                <p style="text-align: center;">
                    &copy; 2016 Software para Telecomunicaciones 2 - Pontificia Universidad Católica del Perú<br> 
            </footer></div>
    </body>
</html>

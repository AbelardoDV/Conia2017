<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!--------------- Completar ----------------------->
<!DOCTYPE html>

<%-- Obtengo los parámetros enviados desde el Servlet--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Northwind 2</title>
        <link rel="shortcut icon" href="<spring:url value="/resources/img/store_icon.png"/>">
        <link rel="stylesheet" href='<spring:url value="/resources/css/bootstrap.css"/>' />
        <script type='text/javascript' src='<spring:url value="/resources/js/jquery-1.11.1.min.js"/>'></script>
    </head>
    <body>
        <%-- Navbar superior--%>
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
        <%-- Panel Superior--%>        
        <div>  
            <div class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <header class="unit hero-unit">
                            <h1>Northwind Traders</h1><br>
                        </header>
                    </div>
                </div>
            </div>
        </div> 
        <br>

        <div class="row-fluid" style=" width: 80%; padding:0 10%;">
            <%-- Lista de opciones --%> 
            <div class="span2">
                <ul class="nav nav-list well">
                    <li><a href="<spring:url value="/home.do"/>"><i class="icon-home"></i> Inicio</a></li>
                    <li><a href="<spring:url value='/employee/profile'/>"><i class="icon-chevron-right"></i>Perfil</a></li>                    
                    <sec:authorize access="hasRole('ROLE_MANAGER')"><li class="active"><a href="<spring:url value='/employee/list'/>"><i class="icon-chevron-right"></i>Empleados</a></li></sec:authorize>
                </ul>
            </div>
            <%-- Tabla con los datos --%>             
            <div class="span10">
                <div class="well form-horizontal-search">
                          
                </div>

                <table class="items table table-bordered">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Correo</th>
                            <th>Anexo</th>
                    </thead>
                    <tbody>
                        <c:forEach var="employee" items="${ListaEmployees}">  
                            <tr>
                                <td>${employee.title}</td>
                                <td>${employee.firstName}</td>
                                <td>${employee.lastName}</td>
                                <td>${employee.email}</td>
                                <td>${employee.extension}</td>
                            </tr>
                        </c:forEach>                                         
                    </tbody>
                </table>

            </div>
        </div>

        <%-- Footer --%>             
        <div class="container"  style="padding-top: 50px;"><hr>
            <footer class="footer">
                <p style="text-align: center;">
                    &copy; 2016 Software para Telecomunicaciones 2 - Pontificia Universidad Católica del Perú<br> 

            </footer></div>
    </body>
</html>



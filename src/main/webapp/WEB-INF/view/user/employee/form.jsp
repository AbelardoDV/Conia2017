<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                                </a>    </a>
                        </li>
                    </ul>
                    <a href="<%=request.getContextPath()%>/logout.do" class="btn pull-right">Cerrar Sessión</a>
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
        <%-- Lista de opciones --%> 
        <div class="row-fluid" style=" width: 80%; padding:0 10%;">
            <div class="span2">
                <ul class="nav nav-list well">
                    <li><a href="<spring:url value="/home.do"/>"><i class="icon-home"></i> Inicio</a></li>
                    <li class="active"><a href="#"><i class="icon-chevron-right"></i> Perfil</a></li>                    
                    <sec:authorize access="hasRole('ROLE_MANAGER')"><li><a href="<spring:url value='/employee/list'/>"><i class="icon-chevron-right"></i>Empleados</a></li></sec:authorize>
                </ul>
            </div>

            <div class="span10">
                <%-- Formulario con los datos --%>   
                <form:form class="form-horizontal" action="${pageContext.request.contextPath}/employee/save" method="post" modelAttribute="employee">
                    <div class="control-group">
                        <label class="control-label">Nombre</label>
                        <div class="controls">
                            <form:input class="span4" path="firstName" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Apellido</label>
                        <div class="controls">
                            <form:input class="span4" path="lastName"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Correo</label>
                        <div class="controls">
                            <form:input readonly="true" class="span4" path="email"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Anexo</label>
                        <div class="controls">
                            <form:input class="span4" path="extension"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Dirección</label>
                        <div class="controls">
                            <form:input class="span4" path="address"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">País</label>
                        <div class="controls">
                            <form:input class="span4" path="country"/>
                        </div>
                    </div>                        
                    <div class="control-group">
                        <label class="control-label">Ciudad</label>
                        <div class="controls">
                            <form:input class="span4" path="city"/>
                        </div>
                    </div>                        
                    <div class="control-group">
                        <div class="controls">
                            <a class="btn btn-primary" href="<spring:url value="/home.do"/>">Regresar</a>&nbsp;&nbsp;&nbsp;                            
                            <input class="btn btn-success" type="submit" value="Guardar"/>                            
                        </div>
                    </div>
                    <form:hidden path="employeeID"/>
                </form:form>
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

<%-- 
    Document   : reporte_empleado_edad
    Created on : 27/12/2022, 04:52:46 AM
    Author     : Princce
--%>
<%@page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("usuario")==null){
            session.invalidate();
            response.sendRedirect("index.html");
            return;
    }
%>
            
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Empleados Edad</title>
    <script type="text/javascript" src="js/formulario_cliente.js"></script>
    </head>
    <body>
        
        <h2>Reporte Empleados Edad</h2>
        <table id="tablaUsuarios" class="tabla">
            <thead>
                <tr>
                    <th>Codigo Cliente</th>
                    <th>Nombre Apellidos</th>
                    <th>Email</th>
                    <th>Validacion Email</th>                
                </tr>
            </thead>
            <tbody id="contenido">
                <c:forEach items="${empleados}" var="empleado" varStatus="status">
                    <tr>
                        <td>${empleado.codigo_cliente}</td>
                        <td>${empleado.nombres_apellidos}</td>
                        <td>${empleado.email}</td>
                        <td>${empleado.validacion_email}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table> 
     </body>
</html>

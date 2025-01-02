<%@page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuario") == null) {
        session.invalidate();
        response.sendRedirect("index.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Reporte Pacientes Sexo</title>
        <link rel="stylesheet" href="css/portal.css">
    </head>
    <body>
        <h2 style="text-align: center;">Reporte Pacientes Edad y Sexo</h2>
        <table id="tablaUsuarios" class="tabla">
            <thead>
                <tr>
                    <th>Codigo Cama</th>
                    <th>Codigo Paciente</th>
                    <th>Nombre Completo</th>
                    <th>Sexo</th>
                    <th>Edad</th>
                </tr>
            </thead>
            <tbody id="contenido">
                <c:forEach items="${pacientes}" var="pacientes" varStatus="status">
                    <tr>
                        <td>${paciente.codigo_cama}</td>
                        <td>${paciente.codigo_paciente}</td>
                        <td>${paciente.nombre}</td>
                        <td>${paciente.info}</td>
                        <td>${paciente.edad}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../WEB-INF/connection/conexion.jspf" %>

<script src="../js/errorAlert.js"></script>

<sql:update var="eliminacionEstudiante" dataSource="${dbUtsProjects}">
    DELETE FROM estudiante WHERE id_estudiante = ?
    <sql:param value="${param.identification}" />
</sql:update>
<sql:update var="eliminacionUsuario" dataSource="${dbUtsProjects}">
    DELETE FROM usuario WHERE identificacion = ?
    <sql:param value="${param.identification}" />
</sql:update>

<c:choose>
    <c:when test="${eliminacionEstudiante > 0 and eliminacionUsuario > 0}">
        <script>
            window.location.href = "../pages/Mostrar.jsp?servicio=estudiante";
        </script>
    </c:when>
    <c:otherwise>
        <script>
            mostrarError("No se ha eliminado ningún registro. Verifica los datos o intenta nuevamente.");
            window.history.back();
        </script>
    </c:otherwise>
</c:choose>

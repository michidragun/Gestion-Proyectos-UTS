<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../WEB-INF/connection/conexion.jspf" %>

<script src="../js/errorAlert.js"></script>

<sql:update var="eliminacionDocente" dataSource="${dbUtsProjects}">
    DELETE FROM docente WHERE id_docente = ?
    <sql:param value="${param.identification}" />
</sql:update>
<sql:update var="eliminacionUsuario" dataSource="${dbUtsProjects}">
    DELETE FROM usuario WHERE identificacion = ?
    <sql:param value="${param.identification}" />
</sql:update>

<c:choose>
    <c:when test="${eliminacionDocente > 0 and eliminacionUsuario > 0}">
        <script>
            window.location.href = "../pages/Mostrar.jsp?servicio=docente";
        </script>
    </c:when>
    <c:otherwise>
        <script>
            mostrarError("No se ha eliminado ningún registro. Verifica los datos o intenta nuevamente.");
            window.history.back();
        </script>
    </c:otherwise>
</c:choose>

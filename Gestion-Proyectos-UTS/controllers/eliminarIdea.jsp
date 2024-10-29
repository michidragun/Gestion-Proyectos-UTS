<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../WEB-INF/connection/conexion.jspf" %>

<script src="../js/errorAlert.js"></script>

<sql:update var="eliminacionIdea" dataSource="${dbUtsProjects}">
    DELETE FROM proyecto WHERE id_proyecto = ?
    <sql:param value="${param.id_proyecto}" />
</sql:update>

<c:choose>
    <c:when test="${eliminacionIdea > 0}">
        <script>
            window.location.href = "../pages/Mostrar.jsp?servicio=anteProyecto";
        </script>
    </c:when>
    <c:otherwise>
        <script>
            mostrarError("No se ha eliminado ningún registro. Verifica los datos o intenta nuevamente.");
            window.history.back();
        </script>
    </c:otherwise>
</c:choose>

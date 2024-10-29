<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ include file="../WEB-INF/connection/conexion.jspf" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <script src="../js/successAlert.js"></script>
        <script src="../js/errorAlert.js"></script>

        <c:if
            test="${not empty param.career and not empty param.email and not empty param.password and not empty param.id}">
            <sql:update var="actualizacionCoordinacion" dataSource="${dbUtsProjects}">
                UPDATE coordinacion SET carrera = ?, correo = ?, contrasena = ? WHERE id_coordinacion = ?
                <sql:param value="${param.career}" />
                <sql:param value="${param.email}" />
                <sql:param value="${param.password}" />
                <sql:param value="${param.id}" />
            </sql:update>
            <c:choose>
                <c:when test="${actualizacionCoordinacion > 0}">
                    <script>
                        mostrarMensaje('Actualizacion hecha correctamente.');
                        window.location.href = "../pages/Mostrar.jsp?servicio=coordinacion";
                    </script>
                </c:when>
                <c:otherwise>
                    <script>
                        mostrarError('No se pudo actualizar la coordinacion');
                        window.history.back();
                    </script>
                </c:otherwise>
            </c:choose>
        </c:if>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ include file="../WEB-INF/connection/conexion.jspf" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <script src="../js/successAlert.js"></script>
        <script src="../js/errorAlert.js"></script>

        <c:if
            test="${not empty param.title and not empty param.description and not empty param.id}">
            <sql:update var="actualizacionIdea" dataSource="${dbUtsProjects}">
                UPDATE proyecto SET titulo = ?, descripcion = ? WHERE id_proyecto = ?
                <sql:param value="${param.title}" />
                <sql:param value="${param.description}" />
                <sql:param value="${param.id}" />
            </sql:update>
            <c:choose>
                <c:when test="${actualizacionIdea > 0}">
                    <script>
                        mostrarMensaje('Actualizacion hecha correctamente.');
                        window.location.href = "../pages/Mostrar.jsp?servicio=anteProyecto";
                    </script>
                </c:when>
                <c:otherwise>
                    <script>
                        mostrarError('No se pudo actualizar la idea de proyecto');
                        window.history.back();
                    </script>
                </c:otherwise>
            </c:choose>
        </c:if>
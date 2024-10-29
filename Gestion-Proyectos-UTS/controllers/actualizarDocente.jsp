<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ include file="../WEB-INF/connection/conexion.jspf" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


            <script src="../js/successAlert.js"></script>
            <script src="../js/errorAlert.js"></script>

            <c:if
                test="${not empty param.name and not empty param.lastname and not empty param.email and not empty param.password and not empty param.phone and not empty param.career and not empty param.especiality}">
                <sql:update var="actualizacionUsuarioDocente" dataSource="${dbUtsProjects}">
                    UPDATE usuario SET nombres = ?, apellidos = ?, correo = ?, contrasena = ?, telefono = ?, carrera
                    = ?
                    WHERE identificacion = ?
                    <sql:param value="${param.name}" />
                    <sql:param value="${param.lastname}" />
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.password}" />
                    <sql:param value="${param.phone}" />
                    <sql:param value="${param.career}" />
                    <sql:param value="${param.identification}" />
                </sql:update>
                <sql:update var="actualizacionDocente" dataSource="${dbUtsProjects}">
                    UPDATE docente SET especialidad = ? WHERE id_docente = ?
                    <sql:param value="${param.especiality}" />
                    <sql:param value="${param.identification}" />
                </sql:update>
                <c:choose>
                    <c:when test="${actualizacionUsuarioDocente > 0 and actualizacionDocente > 0}">
                        <script>
                            mostrarMensaje('Actualizacion hecha correctamente.');
                            window.location.href = "../pages/Mostrar.jsp?servicio=docente";
                        </script>
                    </c:when>
                    <c:otherwise>
                        <script>
                            mostrarError('No se pudo actualizar el docente');
                            window.history.back();
                        </script>
                    </c:otherwise>
                </c:choose>
            </c:if>
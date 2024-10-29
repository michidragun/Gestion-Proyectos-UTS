<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
            <%@ include file="../WEB-INF/connection/conexion.jspf" %>

                <c:set var="servicio" value="${param.servicio}" />
                <c:choose>
                    <c:when test="${servicio == 'estudiante'}">
                        <c:set var="crudPage" value="./CrudPrincipal.jsp?crud=estudiante" />
                    </c:when>
                    <c:when test="${servicio == 'coordinacion'}">
                        <c:set var="crudPage" value="./CrudPrincipal.jsp?crud=coordinacion" />
                    </c:when>
                    <c:when test="${servicio == 'docente'}">
                        <c:set var="crudPage" value="./CrudPrincipal.jsp?crud=docente" />
                    </c:when>
                    <c:when test="${servicio == 'anteProyecto'}">
                        <c:set var="crudPage" value="./CrudPrincipal.jsp?crud=anteProyecto" />
                    </c:when>
                    <c:when test="${servicio == 'director' or servicio == 'evaluador'}">
                        <c:set var="crudPage" value="./DocentePrincipal.jsp" />
                    </c:when>
                </c:choose>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
                    <meta name="Description" content="Enter your description here" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
                    <link rel="stylesheet" href="../styles/style.css" />
                    <link rel="shortcut icon" href="../img/Logo_UTS_2.png" type="image/x-icon">
                    <title>Gestion Proyectos UTS</title>
                </head>

                <body class="page-view-service">
                    <header>
                        <figure>
                            <a href="../index.html"><img src="../img/Uts_Logo.png" alt="Logo UTS" /></a>
                        </figure>
                        <div class="sesion">
                            <form class="sesion" action="../controllers/cerrarSesion.jsp" method="post">
                                <p>${usuario}</p>
                                <button type="submit" class="btn btn-danger">Cerrar Sesión</button>
                            </form>
                        </div>
                    </header>
                    <main>
                        <a class="btn btn-green volver" href="${crudPage}">Volver</a>
                        <c:choose>
                            <c:when test="${servicio == 'estudiante'}">
                                <sql:query var="rsStudents" dataSource="${dbUtsProjects}">
                                    SELECT * FROM usuario INNER JOIN estudiante ON usuario.identificacion =
                                    estudiante.id_estudiante
                                </sql:query>
                                <c:if test="${not empty rsStudents.rows}">
                                    <div class="container-table">
                                        <h1>ESTUDIANTES</h1>
                                        <table class="table mt-4">
                                            <thead class="thead-light">
                                                <tr class="text-center">
                                                    <th>Identificacion</th>
                                                    <th>Nombres</th>
                                                    <th>Apellidos</th>
                                                    <th>Correo Electronico</th>
                                                    <th>Telefono</th>
                                                    <th>Carrera</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="estudiante" items="${rsStudents.rows}">
                                                    <tr>
                                                        <td>${estudiante.Identificacion}</td>
                                                        <td>${estudiante.nombres}</td>
                                                        <td>${estudiante.apellidos}</td>
                                                        <td>${estudiante.correo}</td>
                                                        <td>${estudiante.telefono}</td>
                                                        <td>${estudiante.carrera}</td>
                                                        <td class="d-flex justify-content-center">
                                                            <form action="./Actualizar.jsp?servicio=estudiante"
                                                                method="post">
                                                                <input type="hidden" name="identificacion"
                                                                    value="${estudiante.identificacion}">
                                                                <input type="hidden" name="nombres"
                                                                    value="${estudiante.nombres}">
                                                                <input type="hidden" name="apellidos"
                                                                    value="${estudiante.apellidos}">
                                                                <input type="hidden" name="correo"
                                                                    value="${estudiante.correo}">
                                                                <input type="hidden" name="contrasena"
                                                                    value="${estudiante.contrasena}">
                                                                <input type="hidden" name="telefono"
                                                                    value="${estudiante.telefono}">
                                                                <input type="hidden" name="carrera"
                                                                    value="${estudiante.carrera}">
                                                                <button type="submit"
                                                                    class="btn btn-primary mr-1">Actualizar</button>
                                                            </form>
                                                            <form action="../controllers/eliminarEstudiante.jsp"
                                                                method="post">
                                                                <input type="hidden" name="identification"
                                                                    value="${estudiante.identificacion}">
                                                                <button type="submit"
                                                                    class="btn btn-danger">Eliminar</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${empty rsStudents.rows}">
                                    <div class="alert alert-info mt-4">
                                        <p>No se han registrado estudiantes todavia.</p>
                                    </div>
                                </c:if>
                            </c:when>

                            <c:when test="${servicio == 'docente'}">
                                <sql:query var="rsTeachers" dataSource="${dbUtsProjects}">
                                    SELECT * FROM usuario INNER JOIN docente ON usuario.identificacion =
                                    docente.id_docente
                                </sql:query>
                                <c:if test="${not empty rsTeachers.rows}">
                                    <div class="container-table">
                                        <h1>PROFESORES</h1>
                                        <table class="table mt-4">
                                            <thead class="thead-light">
                                                <tr class="text-center">
                                                    <th>Identificacion</th>
                                                    <th>Nombres</th>
                                                    <th>Apellidos</th>
                                                    <th>Correo Electronico</th>
                                                    <th>Telefono</th>
                                                    <th>Carrera</th>
                                                    <th>Especialidad</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="docente" items="${rsTeachers.rows}">
                                                    <tr>
                                                        <td>${docente.Identificacion}</td>
                                                        <td>${docente.nombres}</td>
                                                        <td>${docente.apellidos}</td>
                                                        <td>${docente.correo}</td>
                                                        <td>${docente.telefono}</td>
                                                        <td>${docente.carrera}</td>
                                                        <td>${docente.especialidad}</td>
                                                        <td class="d-flex justify-content-center">
                                                            <form action="./Actualizar.jsp?servicio=docente"
                                                                method="post">
                                                                <input type="hidden" name="identificacion"
                                                                    value="${docente.identificacion}">
                                                                <input type="hidden" name="nombres"
                                                                    value="${docente.nombres}">
                                                                <input type="hidden" name="apellidos"
                                                                    value="${docente.apellidos}">
                                                                <input type="hidden" name="correo"
                                                                    value="${docente.correo}">
                                                                <input type="hidden" name="contrasena"
                                                                    value="${docente.contrasena}">
                                                                <input type="hidden" name="telefono"
                                                                    value="${docente.telefono}">
                                                                <input type="hidden" name="carrera"
                                                                    value="${docente.carrera}">
                                                                <input type="hidden" name="especialidad"
                                                                    value="${docente.especialidad}">
                                                                <button type="submit"
                                                                    class="btn btn-primary mr-1">Actualizar</button>
                                                            </form>
                                                            <form action="../controllers/eliminarDocente.jsp"
                                                                method="post">
                                                                <input type="hidden" name="identification"
                                                                    value="${docente.identificacion}">
                                                                <button type="submit"
                                                                    class="btn btn-danger">Eliminar</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${empty rsTeachers.rows}">
                                    <div class="alert alert-info mt-4">
                                        <p>No se han registrado docentes todavia.</p>
                                    </div>
                                </c:if>
                            </c:when>
                            <c:when test="${servicio == 'coordinacion'}">
                                <sql:query var="rsCoordination" dataSource="${dbUtsProjects}">
                                    SELECT * FROM coordinacion
                                </sql:query>
                                <c:if test="${not empty rsCoordination.rows}">
                                    <div class="container-table">
                                        <h1>COORDINACIONES</h1>
                                        <table class="table mt-4">
                                            <thead class="thead-light">
                                                <tr class="text-center">
                                                    <th>Id</th>
                                                    <th>Nombre</th>
                                                    <th>Correo Electronico</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="coordinacion" items="${rsCoordination.rows}">
                                                    <tr>
                                                        <td>${coordinacion.id_coordinacion}</td>
                                                        <td>${coordinacion.carrera}</td>
                                                        <td>${coordinacion.correo}</td>
                                                        <td class="d-flex justify-content-center">
                                                            <form action="./Actualizar.jsp?servicio=coordinacion"
                                                                method="post">
                                                                <input type="hidden" name="id_coordinacion"
                                                                    value="${coordinacion.id_coordinacion}">
                                                                <input type="hidden" name="carrera"
                                                                    value="${coordinacion.carrera}">
                                                                <input type="hidden" name="correo"
                                                                    value="${coordinacion.correo}">
                                                                <input type="hidden" name="contrasena"
                                                                    value="${coordinacion.contrasena}">
                                                                <button type="submit"
                                                                    class="btn btn-primary mr-1">Actualizar</button>
                                                            </form>
                                                            <form action="../controllers/eliminarCoordinacion.jsp"
                                                                method="post">
                                                                <input type="hidden" name="id_coordination"
                                                                    value="${coordinacion.id_coordinacion}">
                                                                <button type="submit"
                                                                    class="btn btn-danger">Eliminar</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${empty rsCoordination.rows}">
                                    <div class="alert alert-info mt-4">
                                        <p>No se han registrado coordinaciones todavia.</p>
                                    </div>
                                </c:if>
                            </c:when>
                            <c:when test="${servicio == 'anteProyecto'}">
                                <sql:query var="rsAnteProyecto" dataSource="${dbUtsProjects}">
                                    SELECT * FROM proyecto INNER JOIN coordinacion ON coordinacion.id_coordinacion =
                                    proyecto.coordinacion_id
                                </sql:query>
                                <c:if test="${not empty rsAnteProyecto.rows}">
                                    <div class="container-table">
                                        <h1>PROYECTOS</h1>
                                        <table class="table mt-4">
                                            <thead class="thead-light">
                                                <tr class="text-center">
                                                    <th>Id de Ante Proyecto</th>
                                                    <th>Titulo</th>
                                                    <th>Coordinacion</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="anteProyectoRow" items="${rsAnteProyecto.rows}">
                                                    <tr>
                                                        <td>${anteProyectoRow.id_proyecto}</td>
                                                        <td>${anteProyectoRow.titulo}</td>
                                                        <td>${anteProyectoRow.carrera}</td>
                                                        <td class="d-flex justify-content-center">
                                                            <form action="./Actualizar.jsp?servicio=anteProyecto"
                                                                method="post">
                                                                <input type="hidden" name="id_proyecto"
                                                                    value="${anteProyectoRow.id_proyecto}">
                                                                <input type="hidden" name="titulo"
                                                                    value="${anteProyectoRow.titulo}">
                                                                <input type="hidden" name="descripcion"
                                                                    value="${anteProyectoRow.descripcion}">
                                                                <button type="submit"
                                                                    class="btn btn-primary mr-1">Actualizar</button>
                                                            </form>
                                                            <form action="../controllers/eliminarIdea.jsp"
                                                                method="post">
                                                                <input type="hidden" name="id_proyecto"
                                                                    value="${anteProyectoRow.id_proyecto}">
                                                                <button type="submit"
                                                                    class="btn btn-danger">Eliminar</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${empty rsAnteProyecto.rows}">
                                    <div class="alert alert-info mt-4">
                                        <p>No se han registrado ideas de proyecto todavia.</p>
                                    </div>
                                </c:if>
                            </c:when>
                            <c:when test="${servicio == 'director'}">
                                <sql:query var="rsDirector" dataSource="${dbUtsProjects}">
                                    SELECT * FROM proyecto INNER JOIN usuario ON proyecto.director_id = usuario.identificacion WHERE estado_proyecto = ?  AND estado_calif_director IS NULL
                                    <sql:param value='En Proceso'/>
                                </sql:query>
                                <c:if test="${not empty rsDirector.rows}">
                                    <div class="container-table">
                                        <h1>ANTEPROYECTOS ASIGNADOS</h1>
                                        <table class="table mt-4">
                                            <thead class="thead-light">
                                                <tr class="text-center">
                                                    <th>Id de Ante Proyecto</th>
                                                    <th>Titulo</th>
                                                    <th>Coordinacion</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="anteProyectoRow" items="${rsDirector.rows}">
                                                    <tr>
                                                        <td>${anteProyectoRow.id_proyecto}</td>
                                                        <td>${anteProyectoRow.titulo}</td>
                                                        <td>${anteProyectoRow.carrera}</td>
                                                        <td class="d-flex justify-content-center">
                                                            <form action="./CalificarProyectoDirector.jsp" method="post">
                                                                <input type="hidden" name="id_proyecto" value="${anteProyectoRow.id_proyecto}">
                                                                <input type="hidden" name="proyectoTitulo" value="${anteProyectoRow.titulo}">
                                                                <button class="btn btn-primary">Ver</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${empty rsDirector.rows}">
                                    <div class="alert alert-info mt-4">
                                        <p>No se te han asignado proyectos todavia como director.</p>
                                    </div>
                                </c:if>
                            </c:when>
                            <c:when test="${servicio == 'evaluador'}">
                                <sql:query var="rsEvaluador" dataSource="${dbUtsProjects}">
                                    SELECT * FROM proyecto INNER JOIN usuario ON proyecto.evaluador_id = usuario.identificacion WHERE estado_proyecto = ?  AND estado_calif_evaluador IS NULL
                                    <sql:param value='En Proceso'/>
                                </sql:query>
                                <c:if test="${not empty rsEvaluador.rows}">
                                    <div class="container-table">
                                        <h1>PROYECTOS ASIGNADOS</h1>
                                        <table class="table mt-4">
                                            <thead class="thead-light">
                                                <tr class="text-center">
                                                    <th>Id de Proyecto</th>
                                                    <th>Titulo</th>
                                                    <th>Coordinacion</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="anteProyectoRow" items="${rsEvaluador.rows}">
                                                    <tr>
                                                        <td>${anteProyectoRow.id_proyecto}</td>
                                                        <td>${anteProyectoRow.titulo}</td>
                                                        <td>${anteProyectoRow.carrera}</td>
                                                        <td class="d-flex justify-content-center">
                                                            <form action="./CalificarProyectoEvaluador.jsp" method="post">
                                                                <input type="hidden" name="id_proyecto" value="${anteProyectoRow.id_proyecto}">
                                                                <input type="hidden" name="proyectoTitulo" value="${anteProyectoRow.titulo}">
                                                                <button class="btn btn-primary">Ver</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${empty rsEvaluador.rows}">
                                    <div class="alert alert-info mt-4">
                                        <p>No se te han asignado proyectos todavia como evaluador.</p>
                                    </div>
                                </c:if>
                            </c:when>
                        </c:choose>
                    </main>
                    <footer>
                        <p>
                            Copyright &copy; 2024 <strong>Julian y Gabriela.</strong> All rights
                            reserved
                        </p>
                    </footer>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
                </body>

                </html>
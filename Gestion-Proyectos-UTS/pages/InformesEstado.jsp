<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
            <%@ include file="../WEB-INF/connection/conexion.jspf" %>

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
                        <a class="btn btn-green volver mb-4" href="./CoordinacionPrincipal.jsp">Volver</a>
                        <sql:query var="rsProjectsDir" dataSource="${dbUtsProjects}">
                            SELECT *
                            FROM proyecto
                            INNER JOIN usuario ON proyecto.director_id = usuario.identificacion
                            INNER JOIN docente ON proyecto.director_id = docente.id_docente
                            INNER JOIN coordinacion ON proyecto.coordinacion_id = coordinacion.id_coordinacion
                            WHERE proyecto.coordinacion_id = ?;
                            <sql:param value="${id_coordinacion}" />
                        </sql:query>
                        <c:if test="${not empty rsProjectsDir.rows}">
                            <div class="container-table">
                                <h1>INFORMES DE ESTADO DE PROYECTOS EN DIRECTORES</h1>
                                <table class="table mt-4">
                                    <thead class="thead-light">
                                        <tr class="text-center">
                                            <th>Id</th>
                                            <th>Titulo</th>
                                            <th>Director</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="proyecto" items="${rsProjectsDir.rows}">
                                            <tr>
                                                <td>${proyecto.id_proyecto}</td>
                                                <td>${proyecto.titulo}</td>
                                                <td>${proyecto.nombres}</td>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${proyecto.estudiante_id == null}">
                                                            <div class="btn btn-secondary">No Iniciado</div>
                                                        </c:when>
                                                        <c:when test="${proyecto.estudiante_id != null and proyecto.estado_calif_director == null}">
                                                            <div class="btn btn-secondary">En Proceso</div>
                                                        </c:when>
                                                        <c:when test="${proyecto.estudiante_id != null and proyecto.estado_calif_director == 'Aprobado'}">
                                                            <div class="btn btn-success">Aprobado</div>
                                                        </c:when>
                                                        <c:when test="${proyecto.estudiante_id != null and proyecto.estado_calif_director == 'Rechazado'}">
                                                            <div class="btn btn-danger">Rechazado</div>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${empty rsProjectsDir.rows}">
                            <div class="container-table mt-4">
                                    <h1>INFORMES DE ESTADO DE PROYECTOS EN DIRECTORES</h1>
                            </div>
                            <div class="alert alert-info mt-4">
                                <p>No se han asignado ante proyectos a directores aun.</p>
                            </div>
                        </c:if>

                        <sql:query var="rsProjectsEva" dataSource="${dbUtsProjects}">
                            SELECT *
                            FROM proyecto
                            INNER JOIN usuario ON proyecto.evaluador_id = usuario.identificacion
                            INNER JOIN docente ON proyecto.evaluador_id = docente.id_docente
                            INNER JOIN coordinacion ON proyecto.coordinacion_id = coordinacion.id_coordinacion
                            WHERE proyecto.coordinacion_id = ?;
                            <sql:param value="${id_coordinacion}" />
                        </sql:query>
                        <c:if test="${not empty rsProjectsEva.rows}">
                            <div class="container-table mt-4">
                                <h1>INFORMES DE ESTADO DE PROYECTOS EN EVALUADORES</h1>
                                <table class="table mt-4">
                                    <thead class="thead-light">
                                        <tr class="text-center">
                                            <th>Id</th>
                                            <th>Titulo</th>
                                            <th>Evaluador</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="proyecto" items="${rsProjectsEva.rows}">
                                            <tr>
                                                <td>${proyecto.id_proyecto}</td>
                                                <td>${proyecto.titulo}</td>
                                                <td>${proyecto.nombres}</td>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${proyecto.estudiante_id == null}">
                                                            <div class="btn btn-secondary">No Iniciado</div>
                                                        </c:when>
                                                        <c:when test="${proyecto.estudiante_id != null and proyecto.estado_calif_evaluador == null}">
                                                            <div class="btn btn-secondary">En Proceso</div>
                                                        </c:when>
                                                        <c:when test="${proyecto.estudiante_id != null and proyecto.estado_calif_evaluador == 'Aprobado'}">
                                                            <div class="btn btn-success">Aprobado</div>
                                                        </c:when>
                                                        <c:when test="${proyecto.estudiante_id != null and proyecto.estado_calif_evaluador == 'Rechazado'}">
                                                            <div class="btn btn-danger">Rechazado</div>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${empty rsProjectsEva.rows}">
                            <div class="container-table mt-4">
                                <h1>INFORMES DE ESTADO DE PROYECTOS EN EVALUADORES</h1>
                            </div>
                            <div class="alert alert-info mt-4">
                                <p>No se han asignado proyectos a evaluadores aun.</p>
                            </div>
                        </c:if>

                        <sql:query var="rsProjectsEst" dataSource="${dbUtsProjects}">
                            SELECT *
                            FROM proyecto
                            INNER JOIN usuario ON proyecto.estudiante_id = usuario.identificacion
                            INNER JOIN estudiante ON proyecto.estudiante_id = estudiante.id_estudiante
                            INNER JOIN coordinacion ON proyecto.coordinacion_id = coordinacion.id_coordinacion
                            WHERE proyecto.coordinacion_id = ?;
                            <sql:param value="${id_coordinacion}" />
                        </sql:query>
                        <c:if test="${not empty rsProjectsEst.rows}">
                            <div class="container-table mt-4">
                                <h1>INFORMES DE ESTADO DE PROYECTOS EN ESTUDIANTES</h1>
                                <table class="table mt-4">
                                    <thead class="thead-light">
                                        <tr class="text-center">
                                            <th>Id</th>
                                            <th>Titulo</th>
                                            <th>Estudiante</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="proyecto" items="${rsProjectsEst.rows}">
                                            <tr>
                                                <td>${proyecto.id_proyecto}</td>
                                                <td>${proyecto.titulo}</td>
                                                <td>${proyecto.nombres}</td>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${proyecto.estudiante_id == null}">
                                                            <div class="btn btn-secondary">No Iniciado</div>
                                                        </c:when>
                                                        <c:when test="${proyecto.estudiante_id != null and proyecto.estado_calif_evaluador == null}">
                                                            <div class="btn btn-secondary">En Proceso</div>
                                                        </c:when>
                                                        <c:when test="${proyecto.estudiante_id != null and proyecto.estado_calif_evaluador == 'Aprobado'}">
                                                            <div class="btn btn-success">Aprobado</div>
                                                        </c:when>
                                                        <c:when test="${proyecto.estudiante_id != null and proyecto.estado_calif_evaluador == 'Rechazado'}">
                                                            <div class="btn btn-danger">Rechazado</div>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        <c:if test="${empty rsProjectsEst.rows}">
                            <div class="container-table mt-4">
                                <h1>INFORMES DE ESTADO DE PROYECTOS EN ESTUDIANTES</h1>
                            </div>
                            <div class="alert alert-info mt-4">
                                <p>No se han asignado proyectos a estudiantes aun.</p>
                            </div>
                        </c:if>
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
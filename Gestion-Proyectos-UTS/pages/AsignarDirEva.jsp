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

                <body class="page-crud-service">
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
                        <div class="container-principal">
                            <h1>ASIGNAR DIRECTOR/EVALUADOR</h1>
                            <div class="container-form shadow-gray-container">
                                <form method="post">
                                    <div class="form-dates">
                                        <div class="form-group">
                                            <label for="identification">Identificacion del docente:</label>
                                            <input class="form-control" type="number" name="identification"
                                                id="identification" placeholder="1023868895" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="idea_project">Idea de Proyecto:</label>
                                            <select class="form-select" name="idea_project" id="idea_project" required>
                                                <option value="" disabled selected>Seleccione una idea</option>
                                                <sql:query var="rsIdeas" dataSource="${dbUtsProjects}">
                                                    SELECT * FROM proyecto
                                                </sql:query>
                                                <c:forEach var="idea" items="${rsIdeas.rows}">
                                                    <option value="${idea.id_proyecto}">${idea.titulo}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="asignation">Asignar como:</label>
                                            <select class="form-select" name="asignation" id="asignation" required>
                                                <option value="" disabled selected>Seleccione una opcion</option>
                                                <option value="director">Director</option>
                                                <option value="evaluator">Evaluador</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-submit mt-4">
                                        <input class="mb-4 btn btn-primary" type="submit" value="ASIGNAR">
                                    </div>
                                </form>
                                <c:if
                                    test="${not empty param.identification and not empty param.idea_project and not empty param.asignation}">
                                    <sql:query var="rsIdea" dataSource="${dbUtsProjects}">
                                        SELECT director_id, evaluador_id, estudiante_id, estado_calif_director FROM
                                        proyecto WHERE id_proyecto
                                        = ?
                                        <sql:param value="${param.idea_project}" />
                                    </sql:query>

                                    <c:choose>
                                        <c:when test="${param.asignation == 'director'}">
                                            <c:forEach var="ideaDirEva" items="${rsIdea.rows}">
                                                <c:if test="${ideaDirEva.estudiante_id != null}">
                                                    <c:choose>
                                                        <c:when
                                                            test="${param.identification != ideaDirEva.director_id && param.identification != ideaDirEva.evaluador_id}">
                                                            <sql:update var="asignacionDirector"
                                                                dataSource="${dbUtsProjects}">
                                                                UPDATE proyecto SET director_id = ? WHERE id_proyecto =
                                                                ?
                                                                <sql:param value="${param.identification}" />
                                                                <sql:param value="${param.idea_project}" />
                                                            </sql:update>
                                                            <c:choose>
                                                                <c:when test="${asignacionDirector > 0}">
                                                                    <div class="alert alert-success">Asignación
                                                                        realizada
                                                                        con éxito.</div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="alert alert-danger">Error: No se asignó
                                                                        correctamente. Error de actualización en base de
                                                                        datos.</div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:when
                                                            test="${param.identification == ideaDirEva.director_id}">
                                                            <div class="alert alert-danger">Error: Este docente ya fue
                                                                asignado como director en este proyecto.</div>
                                                        </c:when>
                                                        <c:when
                                                            test="${param.identification == ideaDirEva.evaluador_id}">
                                                            <div class="alert alert-danger">Error: Este docente ya fue
                                                                asignado como evaluador en este proyecto.</div>
                                                        </c:when>
                                                    </c:choose>
                                                </c:if>
                                                <c:if test="${ideaDirEva.estudiante_id == null}">
                                                    <div class="alert alert-danger">Error: El ante proyecto no ha sido
                                                        elegido todavia por algun estudiante. Hay que esperar a que un
                                                        estudiante lo elija para poder asignar un director</div>
                                                </c:if>
                                            </c:forEach>
                                        </c:when>

                                        <c:when test="${param.asignation == 'evaluator'}">
                                            <c:forEach var="ideaDirEva" items="${rsIdea.rows}">
                                                <c:if test="${ideaDirEva.estado_calif_director == 'Aprobado'}">
                                                    <c:choose>
                                                        <c:when
                                                            test="${param.identification != ideaDirEva.director_id && param.identification != ideaDirEva.evaluador_id}">
                                                            <sql:update var="asignacionEvaluador"
                                                                dataSource="${dbUtsProjects}">
                                                                UPDATE proyecto SET evaluador_id = ? WHERE id_proyecto =
                                                                ?
                                                                <sql:param value="${param.identification}" />
                                                                <sql:param value="${param.idea_project}" />
                                                            </sql:update>
                                                            <c:choose>
                                                                <c:when test="${asignacionEvaluador > 0}">
                                                                    <div class="alert alert-success">Asignación
                                                                        realizada
                                                                        con éxito.</div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="alert alert-danger">Error: No se asignó
                                                                        correctamente. Error de actualización en base de
                                                                        datos.</div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:when
                                                            test="${param.identification == ideaDirEva.director_id}">
                                                            <div class="alert alert-danger">Error: Este docente ya fue
                                                                asignado como director en este proyecto.</div>
                                                        </c:when>
                                                        <c:when
                                                            test="${param.identification == ideaDirEva.evaluador_id}">
                                                            <div class="alert alert-danger">Error: Este docente ya fue
                                                                asignado como evaluador en este proyecto.</div>
                                                        </c:when>
                                                    </c:choose>
                                                </c:if>
                                                <c:if test="${ideaDirEva.estado_calif_director != 'Aprobado'}">
                                                    <div class="alert alert-danger">Error: El ante proyecto todavia no ha sido aprobado por un director. El director debe aprobar primero el ante proyecto para poder asignar un evaluador al proyecto</div>
                                                </c:if>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                </c:if>

                                <a class="btn btn-green volver" href="./CoordinacionPrincipal.jsp">Volver</a>
                            </div>
                        </div>
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
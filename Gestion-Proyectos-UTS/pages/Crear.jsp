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
                </c:choose>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <meta http-equiv="X-UA-Compatible" content="ie=edge">
                    <meta name="Description" content="Enter your description here" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                    <link rel="stylesheet" href="../styles/style.css" />
                    <link rel="shortcut icon" href="../img/Logo_UTS_2.png" type="image/x-icon" />
                    <title>Gestion Proyectos UTS</title>
                </head>

                <body class="page-crud-service">
                    <header>
                        <figure>
                            <a href="../index.html"><img src="../img/Uts_Logo.png" alt="Logo UTS" /></a>
                        </figure>
                        <form class="sesion" action="../controllers/cerrarSesion.jsp" method="post">
                            <p>${usuario}</p>
                            <button type="submit" class="btn btn-danger">Cerrar Sesión</button>
                        </form>
                    </header>

                    <main>
                        <div class="container-principal">
                            <h1>CREAR
                                <c:out value="${servicio}" />
                            </h1>
                            <div class="container-form shadow-gray-container">
                                <form method="post">
                                    <c:choose>
                                        <c:when test="${servicio == 'estudiante'}">
                                            <div class="form-dates">
                                                <div class="form-group">
                                                    <label for="identificacion">Identificacion</label>
                                                    <input class="form-control" type="number" name="identification"
                                                        id="identification" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Nombre(s)</label>
                                                    <input class="form-control" type="text" name="name" id="name"
                                                        required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="lastname">Apellido(s)</label>
                                                    <input class="form-control" type="text" name="lastname"
                                                        id="lastname" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email">Correo Electronico</label>
                                                    <input class="form-control" type="email" name="email" id="email"
                                                        required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password">Contraseña</label>
                                                    <input class="form-control" type="text" name="password"
                                                        id="password" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="phone">Telefono</label>
                                                    <input class="form-control" type="number" name="phone" id="phone"
                                                        required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="career">Carrera</label>
                                                    <select class="form-select" name="career" id="career" required>
                                                        <option selected disabled>Seleccione una opcion</option>
                                                        <option value="Ingenieria de Sistemas">Ingenieria de Sistemas</option>
                                                        <option value="Ingenieria Ambiental">Ingenieria Ambiental</option>
                                                        <option value="Ingenieria Industrial">Ingenieria Industrial</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${servicio == 'docente'}">
                                            <div class="form-dates">
                                                <div class="form-group">
                                                    <label for="identificacion">Identificacion</label>
                                                    <input class="form-control" type="text" name="identification"
                                                        id="identification" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Nombre(s)</label>
                                                    <input class="form-control" type="text" name="name" id="name"
                                                        required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="lastname">Apellido(s)</label>
                                                    <input class="form-control" type="text" name="lastname"
                                                        id="lastname" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email">Correo Electronico</label>
                                                    <input class="form-control" type="email" name="email" id="email"
                                                        required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password">Contraseña</label>
                                                    <input class="form-control" type="text" name="password"
                                                        id="password" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="phone">Telefono</label>
                                                    <input class="form-control" type="text" name="phone" id="phone"
                                                        required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="career">Carrera</label>
                                                    <select class="form-select" name="career" id="career" required>
                                                        <option selected disabled>Seleccione una opcion</option>
                                                        <option value="Ingenieria de Sistemas">Ingenieria de Sistemas</option>
                                                        <option value="Ingenieria Ambiental">Ingenieria Ambiental</option>
                                                        <option value="Ingenieria Industrial">Ingenieria Industrial</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="especialidad">Especialidad</label>
                                                    <input class="form-control" type="text" name="especialidad"
                                                        id="especialidad" required>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${servicio == 'coordinacion'}">
                                            <div class="form-dates">
                                                <div class="form-group">
                                                    <label for="career">Carrera</label>
                                                    <select class="form-select" name="career" id="career" required>
                                                        <option selected disabled>Seleccione una opcion</option>
                                                        <option value="Ingeniera de Sistemas">Ingenieria de Sistemas
                                                        </option>
                                                        <option value="Ingeniera de Ambiental">Ingenieria Ambiental
                                                        </option>
                                                        <option value="Ingeniera Industrial">Ingenieria Industrial
                                                        </option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email">Correo Electronico</label>
                                                    <input class="form-control" type="email" name="email" id="email"
                                                        required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password">Contraseña</label>
                                                    <input class="form-control" type="text" name="password"
                                                        id="password" required>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${servicio == 'anteProyecto'}">
                                            <div class="form-dates">
                                                <div class="form-group">
                                                    <label for="title">Titulo</label>
                                                    <input class="form-control" type="text" name="title" id="title"
                                                        required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="description">Descripcion</label>
                                                    <textarea class="form-control" name="description"
                                                        id="description" required></textarea>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                    <div class="form-submit mt-4 mb-4">
                                        <input class="btn btn-primary" type="submit" value="CREAR">
                                    </div>
                                </form>
                                <c:choose>
                                    <c:when test="${servicio == 'estudiante'}">
                                        <c:if
                                            test="${not empty param.identification and not empty param.name and not empty param.lastname and not empty param.email and not empty param.password and not empty param.phone and not empty param.career}">
                                            <sql:update var="insertUser" dataSource="${dbUtsProjects}">
                                                INSERT INTO usuario (identificacion, nombres, apellidos, correo,
                                                contrasena,
                                                telefono, carrera)
                                                VALUES (?, ?, ?, ?, ?, ?, ?)
                                                <sql:param value="${param.identification}" />
                                                <sql:param value="${param.name}" />
                                                <sql:param value="${param.lastname}" />
                                                <sql:param value="${param.email}" />
                                                <sql:param value="${param.password}" />
                                                <sql:param value="${param.phone}" />
                                                <sql:param value="${param.career}" />
                                            </sql:update>
                                            <sql:update var="insertStudent" dataSource="${dbUtsProjects}">
                                                INSERT INTO estudiante (id_estudiante)
                                                VALUES (?)
                                                <sql:param value="${param.identification}" />
                                            </sql:update>
                                            <c:if test="${insertUser > 0 and insertStudent > 0}">
                                                <div class="alert alert-success">Creación realizada con éxito.
                                                </div>
                                            </c:if>
                                            <c:if test="${insertUser == 0 and insertStudent == 0}">
                                                <div class="alert alert-danger">Error: no se pudo crear el
                                                    estudiante.
                                                    Error de
                                                    inserción</div>
                                            </c:if>
                                        </c:if>
                                    </c:when>
                                    <c:when test="${servicio == 'docente'}">
                                        <c:if
                                            test="${not empty param.identification and not empty param.name and not empty param.lastname and not empty param.email and not empty param.password and not empty param.phone and not empty param.especialidad and not empty param.career}">
                                            <sql:update var="insertUser" dataSource="${dbUtsProjects}">
                                                INSERT INTO usuario (identificacion, nombres, apellidos, correo,
                                                contrasena, telefono, carrera)
                                                VALUES (?, ?, ?, ?, ?, ?, ?)
                                                <sql:param value="${param.identification}" />
                                                <sql:param value="${param.name}" />
                                                <sql:param value="${param.lastname}" />
                                                <sql:param value="${param.email}" />
                                                <sql:param value="${param.password}" />
                                                <sql:param value="${param.phone}" />
                                                <sql:param value="${param.career}" />
                                            </sql:update>
                                            <sql:update var="insertDocente" dataSource="${dbUtsProjects}">
                                                INSERT INTO docente (id_docente, especialidad)
                                                VALUES (?, ?)
                                                <sql:param value="${param.identification}" />
                                                <sql:param value="${param.especialidad}" />
                                            </sql:update>
                                            <c:if test="${insertUser > 0 and insertDocente > 0}">
                                                <div class="alert alert-success">Creación realizada con éxito.</div>
                                            </c:if>
                                            <c:if test="${insertUser == 0 and insertDocente == 0}">
                                                <div class="alert alert-danger">Error: no se pudo crear el docente.
                                                    Error de inserción</div>
                                            </c:if>
                                        </c:if>
                                    </c:when>
                                    <c:when test="${servicio == 'coordinacion'}">
                                        <c:if
                                            test="${not empty param.career and not empty param.email and not empty param.password}">
                                            <sql:update var="insertCoordinacion" dataSource="${dbUtsProjects}">
                                                INSERT INTO coordinacion (carrera, correo, contrasena)
                                                VALUES (?, ?, ?)
                                                <sql:param value="${param.career}" />
                                                <sql:param value="${param.email}" />
                                                <sql:param value="${param.password}" />
                                            </sql:update>
                                            <c:if test="${insertCoordinacion > 0}">
                                                <div class="alert alert-success">Creación realizada con éxito.</div>
                                            </c:if>
                                            <c:if test="${insertCoordinacion == 0}">
                                                <div class="alert alert-danger">Error: no se pudo crear la coordinación.
                                                    Error de inserción</div>
                                            </c:if>
                                        </c:if>
                                    </c:when>
                                    <c:when test="${servicio == 'anteProyecto'}">
                                        <c:if
                                            test="${not empty param.title and not empty param.description}">
                                            <sql:update var="insertAnteProyecto" dataSource="${dbUtsProjects}">
                                                INSERT INTO proyecto (titulo, descripcion, coordinacion_id, estado_proyecto)
                                                VALUES (?, ?, ?, ?)
                                                <sql:param value="${param.title}" />
                                                <sql:param value="${param.description}" />
                                                <sql:param value="${id_coordinacion}" />
                                                <sql:param value="No Asignado" />
                                            </sql:update>
                                            <c:if test="${insertAnteProyecto > 0}">
                                                <div class="alert alert-success">Creación realizada con éxito.</div>
                                            </c:if>
                                            <c:if test="${insertAnteProyecto == 0}">
                                                <div class="alert alert-danger">Error: no se pudo crear la idea de proyecto.
                                                    Error de inserción</div>
                                            </c:if>
                                        </c:if>
                                    </c:when>
                                </c:choose>

                                <a class="btn btn-green volver" href="${crudPage}">Volver</a>
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
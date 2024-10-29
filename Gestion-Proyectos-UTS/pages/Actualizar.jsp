<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <c:set var="servicio" value="${param.servicio}" />

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <meta name="Description" content="Enter your description here" />
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
                    <h1>ACTUALIZAR
                        <c:out value="${servicio}" />
                    </h1>
                    <div class="container-form shadow-gray-container">
                        <c:choose>
                            <c:when test="${servicio == 'estudiante'}">
                                <form method="post" action="../controllers/actualizarEstudiante.jsp">
                                    <div class="form-dates">
                                        <input type="hidden" name="identification" value="${param.identificacion}">
                                        <div class="form-group">
                                            <label for="name">Nombre(s)</label>
                                            <input class="form-control" type="text" name="name" id="name"
                                                placeholder="${param.nombres}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="lastname">Apellido(s)</label>
                                            <input class="form-control" type="text" name="lastname" id="lastname"
                                                placeholder="${param.apellidos}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Correo Electronico</label>
                                            <input class="form-control" type="email" name="email" id="email"
                                                placeholder="${param.correo}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Contraseña</label>
                                            <input class="form-control" type="text" name="password" id="password"
                                                placeholder="${param.contrasena}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Telefono</label>
                                            <input class="form-control" type="number" name="phone" id="phone"
                                                placeholder="${param.telefono}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="career">Carrera</label>
                                            <select class="form-select" name="career" id="career" required>
                                                <option value="" selected disabled>${param.carrera}</option>
                                                <option value="Ingenieria de Sistemas">Ingenieria de Sistemas</option>
                                                <option value="Ingenieria Ambiental">Ingenieria Ambiental</option>
                                                <option value="Ingenieria Industrial">Ingenieria Industrial</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-submit mt-4">
                                        <input class="mb-4 btn btn-primary" type="submit" value="ACTUALIZAR">
                                    </div>
                                </form>
                            </c:when>
                            <c:when test="${servicio == 'docente'}">
                                <form method="post" action="../controllers/actualizarDocente.jsp">
                                    <div class="form-dates">
                                        <input type="hidden" name="identification" value="${param.identificacion}">
                                        <div class="form-group">
                                            <label for="name">Nombre(s)</label>
                                            <input class="form-control" type="text" name="name" id="name"
                                                placeholder="${param.nombres}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="lastname">Apellido(s)</label>
                                            <input class="form-control" type="text" name="lastname" id="lastname"
                                                placeholder="${param.apellidos}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Correo Electronico</label>
                                            <input class="form-control" type="email" name="email" id="email"
                                                placeholder="${param.correo}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Contraseña</label>
                                            <input class="form-control" type="text" name="password" id="password"
                                                placeholder="${param.contrasena}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Telefono</label>
                                            <input class="form-control" type="number" name="phone" id="phone"
                                                placeholder="${param.telefono}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="especiality">Especialidad</label>
                                            <input class="form-control" type="text" name="especiality" id="especiality"
                                                placeholder="${param.especialidad}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="career">Carrera</label>
                                            <select class="form-select" name="career" id="career" required>
                                                <option value="" selected disabled>${param.carrera}</option>
                                                <option value="Ingenieria de Sistemas">Ingenieria de Sistemas</option>
                                                <option value="Ingenieria Ambiental">Ingenieria Ambiental</option>
                                                <option value="Ingenieria Industrial">Ingenieria Industrial</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-submit mt-4">
                                        <input class="mb-4 btn btn-primary" type="submit" value="ACTUALIZAR">
                                    </div>
                                </form>
                            </c:when>
                            <c:when test="${servicio == 'coordinacion'}">
                                <form action="../controllers/actualizarCoordinacion.jsp" method="post">
                                    <div class="form-dates">
                                        <input type="hidden" name="id" value="${param.id_coordinacion}">
                                        <div class="form-group">
                                            <label for="career">Carrera</label>
                                            <select class="form-select" name="career" id="career" required>
                                                <option value="" selected disabled>${param.carrera}</option>
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
                                            <input class="form-control" type="email" name="email" id="email" required
                                                placeholder="${param.correo}">
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Contraseña</label>
                                            <input class="form-control" type="text" name="password" id="password"
                                                required placeholder="${param.contrasena}">
                                        </div>
                                    </div>
                                    <div class="form-submit mt-4">
                                        <input class="mb-4 btn btn-primary" type="submit" value="ACTUALIZAR">
                                    </div>
                                </form>
                            </c:when>
                            <c:when test="${servicio == 'anteProyecto'}">
                                <form action="../controllers/actualizarIdea.jsp" method="post">
                                    <div class="form-dates">
                                        <input type="hidden" name="id" value="${param.id_proyecto}">
                                        <div class="form-group">
                                            <label for="title">Titulo</label>
                                            <input class="form-control" type="text" name="title" id="title" placeholder="${param.titulo}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="description">Descripcion</label>
                                            <textarea class="form-control" name="description" id="description"
                                                required placeholder="${param.descripcion}">${param.descripcion}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-submit mt-4">
                                        <input class="mb-4 btn btn-primary" type="submit" value="ACTUALIZAR">
                                    </div>
                                </form>
                            </c:when>
                        </c:choose>
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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
        </body>

        </html>
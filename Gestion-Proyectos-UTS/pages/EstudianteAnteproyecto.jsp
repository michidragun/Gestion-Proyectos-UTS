<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
            <%@ include file="../WEB-INF/connection/conexion.jspf" %>
                <!DOCTYPE html>
                <html lang="es">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Calificar Proyecto - Director</title>
                    <link rel="stylesheet"
                        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                    <link rel="stylesheet" href="../styles/style.css" />
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

                </head>

                <body>

                    <div class="container mt-5">

                        <header class="d-flex justify-content-between align-items-center p-3">
                            <figure>
                                <img src="../img/Logo_UTS_2.png" alt="Logo" class="img-fluid" style="height: 50px;">
                            </figure>
                            <form class="sesion" action="../controllers/cerrarSesion.jsp" method="post">
                                <p>
                                    <c:out value="${rol}" />
                                </p>
                                <button type="submit" class="btn btn-danger">Cerrar Sesión</button>
                            </form>
                        </header>

                        <div class="text-center mb-4">
                            <h1 class="text-uppercase">${param.tituloProyecto}</h1>
                        </div>

                        <!-- Contenido Principal -->
                        <div class="row">
                            <sql:query var="rsDirector" dataSource="${dbUtsProjects}">
                                SELECT * FROM proyecto INNER JOIN usuario ON proyecto.director_id =
                                usuario.identificacion WHERE
                                proyecto.id_proyecto = ?;
                                <sql:param value="${param.id_proyecto}" />
                            </sql:query>
                            <div class="col-md-4">
                                <div class="shadow-gray-container">
                                    <h4 class="text-center">INFORMACION DIRECTOR</h4>
                                    <form>
                                        <c:forEach var="director" items="${rsDirector.rows}">
                                            <div class="form-group">
                                                <label for="idEst1">Identificación</label>
                                                <input type="text" class="form-control"
                                                    value="${director.identificacion}" disabled />
                                            </div>
                                            <div class="form-group">
                                                <label for="nombreEst1">Nombres</label>
                                                <input type="text" id="nombreEst1" class="form-control"
                                                    value="${director.nombres}" disabled />
                                            </div>
                                            <div class="form-group">
                                                <label for="otrosDatosEst1">Apellidos</label>
                                                <input type="text" id="otrosDatosEst1" class="form-control"
                                                    value="${director.apellidos}" disabled />
                                            </div>
                                            <div class="form-group">
                                                <label for="carreraEst1">Carrera</label>
                                                <input type="text" id="carreraEst1" class="form-control"
                                                    value="${director.carrera}" disabled />
                                            </div>
                                        </c:forEach>
                                    </form>
                                </div>
                            </div>


                            <div class="col-md-5">
                                <div class="shadow-gray-container">
                                    <h5>Comentarios:</h5>
                                    <div class="p-3" style="background-color: #f8f9fa; border-radius: 10px;">
                                        <!-- Comentario Estudiante -->
                                        <div class="mb-2">
                                            <small><strong>Nombre Estudiante</strong> - 7/10/2024 - 9:00PM</small>
                                            <div class="bg-light p-2 rounded">Mensaje...</div>
                                        </div>
                                        <!-- Comentario Director -->
                                        <div class="mb-2">
                                            <small><strong>Nombre Director</strong> - 7/10/2024 - 9:10PM</small>
                                            <div class="bg-light p-2 rounded">Mensaje...</div>
                                        </div>
                                        <!-- Campo para Enviar Mensaje -->
                                        <div class="input-group mb-2">
                                            <input type="text" class="form-control" placeholder="Enviar mensaje">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary">
                                                    <i class="fa fa-paper-plane"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-3">
                                <div class="shadow-gray-container text-center p-3">
                                    <h5>ESTADO</h5>
                                    <button class="btn btn-secondary" disabled>En Proceso</button>
                                </div>
                            </div>
                        </div>

                        <div class="text-center mt-4">
                            <button class="btn btn-primary">Subir Ante Proyecto</button>
                            <button class="btn btn-secondary">Modificar Envío</button>
                        </div>

                        <footer>
                            <p>
                                Copyright &copy; 2024 <strong>Julian y Gabriela.</strong> All rights
                                reserved
                            </p>
                        </footer>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                </body>

                </html>
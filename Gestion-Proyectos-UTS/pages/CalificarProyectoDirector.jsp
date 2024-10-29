<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
      <%@ include file="../WEB-INF/connection/conexion.jspf" %>

        <c:set var="nombreProyecto" value="${param.proyectoTitulo}" />

        <!DOCTYPE html>
        <html lang="es">

        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Calificar Proyecto Evaluador</title>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
          <link rel="stylesheet" href="../styles/style.css" />
          <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        </head>

        <body>
          <header class="d-flex justify-content-between align-items-center p-3">
            <figure>
              <img src="../img/Logo_UTS_2.png" alt="Logo" class="img-fluid" style="height: 50px" />
            </figure>
            <div class="sesion">
              <form class="sesion" action="../controllers/cerrarSesion.jsp" method="post">
                <p>${usuario}</p>
                <button type="submit" class="btn btn-danger">Cerrar Sesión</button>
              </form>
            </div>
          </header>

          <main class="container-principal mt-5">
            <h1 class="text-center">${nombreProyecto}</h1>
            <div class="row mt-4">
              <sql:query var="rsPrimerEstudiante" dataSource="${dbUtsProjects}">
                SELECT * FROM proyecto INNER JOIN usuario ON proyecto.estudiante_id = usuario.identificacion WHERE
                proyecto.id_proyecto = ?;
                <sql:param value="${param.id_proyecto}" />
              </sql:query>
              <div class="col-md-7">
                <div class="shadow-gray-container rounded p-4">
                  <h2 class="text-center">INFORMACION ESTUDIANTE(S)</h2>
                  <div class="row">
                    <div class="col-md-6">
                      <c:forEach var="primerEstudiante" items="${rsPrimerEstudiante.rows}">
                        <h3 class="text-center">Estudiante 1</h3>
                        <div class="form-group">
                          <label for="idEst1">Identificación</label>
                          <input type="text" class="form-control" value="${primerEstudiante.identificacion}" disabled />
                        </div>
                        <div class="form-group">
                          <label for="nombreEst1">Nombres</label>
                          <input type="text" id="nombreEst1" class="form-control" value="${primerEstudiante.nombres}"
                            disabled />
                        </div>
                        <div class="form-group">
                          <label for="otrosDatosEst1">Apellidos</label>
                          <input type="text" id="otrosDatosEst1" class="form-control"
                            value="${primerEstudiante.apellidos}" disabled />
                        </div>
                        <div class="form-group">
                          <label for="carreraEst1">Carrera</label>
                          <input type="text" id="carreraEst1" class="form-control" value="${primerEstudiante.carrera}"
                            disabled />
                        </div>
                    </div>
                    </c:forEach>

                    <sql:query var="rsSegundoEstudiante" dataSource="${dbUtsProjects}">
                      SELECT * FROM proyecto INNER JOIN usuario ON proyecto.segundo_estudiante_id =
                      usuario.identificacion WHERE
                      proyecto.id_proyecto = ?;
                      <sql:param value="${param.id_proyecto}" />
                    </sql:query>
                    <c:if test="${rsSegundoEstudiante != null}">
                      <div class="col-md-6">
                        <c:forEach var="segundoEstudiante" items="${rsSegundoEstudiante.rows}">
                          <h3 class="text-center">Estudiante 2</h3>
                          <div class="form-group">
                            <label for="idEst1">Identificación</label>
                            <input type="text" class="form-control" value="${segundoEstudiante.identificacion}"
                              disabled />
                          </div>
                          <div class="form-group">
                            <label for="nombreEst1">Nombres</label>
                            <input type="text" id="nombreEst1" class="form-control" value="${segundoEstudiante.nombres}"
                              disabled />
                          </div>
                          <div class="form-group">
                            <label for="otrosDatosEst1">Apellidos</label>
                            <input type="text" id="otrosDatosEst1" class="form-control"
                              value="${segundoEstudiante.apellidos}" disabled />
                          </div>
                          <div class="form-group">
                            <label for="carreraEst1">Carrera</label>
                            <input type="text" id="carreraEst1" class="form-control"
                              value="${segundoEstudiante.carrera}" disabled />
                          </div>
                        </c:forEach>
                      </div>
                    </c:if>
                  </div>
                </div>
              </div>
              <div class="col-md-5">
                <div class="shadow-gray-container">
                  <h5>Comentarios:</h5>
                  <div class="p-3" style="background-color: #f8f9fa; border-radius: 10px">
                    <!-- Comentario Estudiante -->
                    <div class="mb-2">
                      <small><strong>Nombre Estudiante</strong> - 7/10/2024 -
                        9:00PM</small>
                      <div class="bg-light p-2 rounded">Mensaje...</div>
                    </div>
                    <!-- Comentario Director -->
                    <div class="mb-2">
                      <small><strong>Nombre Director</strong> - 7/10/2024 -
                        9:10PM</small>
                      <div class="bg-light p-2 rounded">Mensaje...</div>
                    </div>
                    <!-- Campo para Enviar Mensaje -->
                    <div class="input-group mb-2">
                      <input type="text" class="form-control" placeholder="Enviar mensaje" />
                      <div class="input-group-append">
                        <button class="btn btn-primary">
                          <i class="fa fa-paper-plane"></i>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <br />
            <br />
            <div class="buttons d-flex justify-content-center mt-4">
              <!-- Botón Aprobar -->
              <form method="post" class="d-inline">
                <input type="hidden" name="id_proyecto" value="${param.id_proyecto}">
                <input type="hidden" name="estado" value="Aprobado">
                <button type="submit" class="btn btn-success mx-2">Aprobar</button>
              </form>

              <!-- Botón Rechazar -->
              <form method="post" class="d-inline">
                <input type="hidden" name="id_proyecto" value="${param.id_proyecto}">
                <input type="hidden" name="estado" value="Rechazado">
                <button type="submit" class="btn btn-danger mx-2">Rechazar</button>
              </form>

              <c:if test="${param.estado != null}">
                <c:if test="${param.estado == 'Aprobado'}">
                  <sql:update var="aprobarProyecto" dataSource="${dbUtsProjects}">
                    UPDATE proyecto SET estado_calif_director = ? WHERE id_proyecto = ?
                    <sql:param value="${param.estado}" />
                    <sql:param value="${param.id_proyecto}" />
                  </sql:update>
                </c:if>
                <c:if test="${param.estado == 'Rechazado'}">
                  <sql:update var="aprobarProyecto" dataSource="${dbUtsProjects}">
                    UPDATE proyecto SET estado_calif_director = ? WHERE id_proyecto = ?
                    <sql:param value="${param.estado}" />
                    <sql:param value="${param.id_proyecto}" />
                  </sql:update>
                </c:if>
              </c:if>
              <a class="btn btn-primary mx-2">Ver Ante Proyecto</a>
              <a class="btn btn-green mx-2" href="./DocentePrincipal.jsp">Volver al portal</a>
            </div>
          </main>

          <footer>
            <p>
              Copyright &copy; 2024 <strong>Julian y Gabriela.</strong> All rights
              reserved
            </p>
          </footer>

          <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.6/dist/umd/popper.min.js"></script>
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        </body>

        </html>
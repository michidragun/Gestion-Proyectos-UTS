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
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
          <link rel="stylesheet" href="../styles/style.css" />
          <link rel="shortcut icon" href="../img/Logo_UTS_2.png" type="image/x-icon" />
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
              <h1>SELECCIONAR IDEA DE PROYECTO</h1>
              <div class="container-form shadow-gray-container">
                <form method="post">
                  <div class="form-dates">
                    <div class="form-group">
                      <label for="idea_project">Idea de Proyecto:</label>
                      <select class="form-select" name="idea_project" id="idea_project" required>
                        <option value="" disabled selected>
                          Seleccione una idea
                        </option>
                        <sql:query var="rsIdeas" dataSource="${dbUtsProjects}">
                          SELECT * FROM proyecto WHERE estudiante_id IS NULL
                        </sql:query>
                        <c:forEach var="idea" items="${rsIdeas.rows}">
                          <option value="${idea.id_proyecto}">${idea.titulo}</option>
                        </c:forEach>
                      </select>
                    </div>
                    <div class="form-group desactivate" id="secondStudent">
                      <label for="identificationSecondStudent">Identificacion Segundo Estudiante:</label>
                      <input class="form-control" type="number" name="identificationSecondStudent"
                        id="identificationSecondStudent" />
                    </div>
                  </div>
                  <div class="form-submit mt-4">
                    <input class="mb-4 btn btn-primary" type="submit" value="Seleccionar" />
                    <button type="button" class="mb-4 ml-4 btn btn-green activate" onclick="activarSegundoEstudiante()"
                      id="buttonActivateStudent">
                      Agregar otro estudiante
                    </button>
                    <button type="button" class="mb-4 ml-4 btn btn-green desactivate"
                      onclick="desactivarSegundoEstudiante()" id="buttonDesactivateStudent">
                      No agregar otro estudiante
                    </button>
                  </div>
                </form>
                <c:if test="${ not empty param.idea_project}">
                  <c:if test="${empty param.identificationSecondStudent}">
                    <sql:update var="actualizarIdea" dataSource="${dbUtsProjects}">
                      UPDATE proyecto SET estudiante_id = ?, estado_proyecto = ? WHERE id_proyecto = ?
                      <sql:param value="${identificacion}" />
                      <sql:param value="En Proceso" />
                      <sql:param value="${param.idea_project}" />
                    </sql:update>
                    <c:if test="${actualizarIdea > 0}">
                      <div class="alert alert-success mb-4">
                        La idea se selecciono correctamente.
                      </div>
                    </c:if>
                    <c:if test="${actualizarIdea == 0}">
                      <div class="alert alert-danger mb-4">
                        La idea no se selecciono correctamente.
                      </div>
                    </c:if>
                  </c:if>
                  <c:if test="${not empty param.identificationSecondStudent}">
                    <sql:query var="existeSegundoEstudiante" dataSource="${dbUtsProjects}">
                      SELECT * FROM estudiante WHERE id_estudiante = ?
                      <sql:param value="${param.identificationSecondStudent}" />
                    </sql:query>
                    <c:if test="${not empty existeSegundoEstudiante.rows}">
                      <sql:update var="actualizarIdea" dataSource="${dbUtsProjects}">
                        UPDATE proyecto SET estudiante_id = ?, segundo_estudiante_id =
                        ?, estado_proyecto = ? WHERE id_proyecto = ?
                        <sql:param value="${identificacion}" />
                        <sql:param value="${param.identificationSecondStudent}" />
                        <sql:param value="En Proceso" />
                        <sql:param value="${param.idea_project}" />
                      </sql:update>
                      <c:if test="${actualizarIdea > 0}">
                        <div class="alert alert-success mb-4">
                          La idea se selecciono correctamente.
                        </div>
                      </c:if>
                      <c:if test="${actualizarIdea == 0}">
                        <div class="alert alert-danger mb-4">
                          La idea no se selecciono correctamente.
                        </div>
                      </c:if>
                    </c:if>
                    <c:if test="${empty existeSegundoEstudiante.rows}">
                      <div class="alert alert-danger">
                        El segundo estudiante con ese numero de identificacion no
                        existe. Por favor elija uno valido.
                      </div>
                    </c:if>
                  </c:if>
                </c:if>
                <a class="btn btn-green volver" href="./EstudiantePrincipal.jsp">Volver</a>
              </div>
            </div>
          </main>
          <footer>
            <p>
              Copyright &copy; 2024 <strong>Julian y Gabriela.</strong> All rights
              reserved
            </p>
          </footer>

          <script src="../js/activarSegundoEstudiante.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
        </body>

        </html>
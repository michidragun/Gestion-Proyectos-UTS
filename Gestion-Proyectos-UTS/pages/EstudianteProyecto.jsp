<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
      <%@ include file="../WEB-INF/connection/conexion.jspf" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Estudiante Proyecto</title>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
          <link rel="stylesheet" href="../styles/style.css" />
        </head>

        <body>

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


          <div class="text-center mt-4">
            <h1 class="text-uppercase">${param.tituloProyecto}</h1>
          </div>


          <div class="row ml-5">
            <sql:query var="rsEvaluador" dataSource="${dbUtsProjects}">
              SELECT * FROM proyecto INNER JOIN usuario ON proyecto.evaluador_id =
              usuario.identificacion WHERE
              proyecto.id_proyecto = ?;
              <sql:param value="${param.id_proyecto}" />
            </sql:query>
            <div class="col-md-6">
              <br>
              <br>
              <div class="shadow-gray-container">
                <h3 class="font-weight-bold">INFORMACION EVALUADOR</h3>
                <form>
                  <c:forEach var="evaluador" items="${rsEvaluador.rows}">
                    <div class="form-group">
                      <label for="idEst1">Identificación</label>
                      <input type="text" class="form-control" value="${evaluador.identificacion}" disabled />
                    </div>
                    <div class="form-group">
                      <label for="nombreEst1">Nombres</label>
                      <input type="text" id="nombreEst1" class="form-control" value="${evaluador.nombres}" disabled />
                    </div>
                    <div class="form-group">
                      <label for="otrosDatosEst1">Apellidos</label>
                      <input type="text" id="otrosDatosEst1" class="form-control" value="${evaluador.apellidos}"
                        disabled />
                    </div>
                    <div class="form-group">
                      <label for="carreraEst1">Carrera</label>
                      <input type="text" id="carreraEst1" class="form-control" value="${evaluador.carrera}" disabled />
                    </div>
                  </c:forEach>
                </form>
              </div>
            </div>

            <div class="col-md-4 offset-mr-2">
              <br>
              <br>
              <div class="shadow-gray-container text-center">
                <h4 class="font-weight-bold">ESTADO DEL PROYECTO:</h4>
                <button class="btn btn-secondary mt-3">En Proceso</button>
              </div>
            </div>
          </div>


          <div class="text-center mt-5">
            <button class="btn btn-primary">Subir Proyecto</button>
            <button class="btn btn-secondary">Modificar Envío</button>
          </div>

          <footer>
            <p>
              Copyright &copy; 2024 <strong>Julian y Gabriela.</strong> All rights
              reserved
            </p>
          </footer>

          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </body>

        </html>
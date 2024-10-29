<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="../WEB-INF/connection/conexion.jspf" %>

<c:set var="rol" value="${param.rol}" />
<c:set var="correo" value="${param.email}" />
<c:set var="contrasena" value="${param.password}" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta name="Description" content="Enter your description here" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <link rel="stylesheet" href="../styles/style.css" />
    <link
      rel="shortcut icon"
      href="../img/Logo_UTS_2.png"
      type="image/x-icon"
    />
    <title>Gestion Proyectos UTS</title>
  </head>

  <body class="page-login">
    <main class="container-login">
      <div class="container-form">
        <figure>
          <img src="../img/Logo_UTS_2.png" alt="logo unidades" />
        </figure>
        <form method="post">
          <input type="hidden" name="rol" value="${rol}" />
          <div class="form-group">
            <label for="email">Correo Electronico:</label>
            <input
              class="form-control"
              type="email"
              name="email"
              id="email"
              placeholder="example@example.com"
              required
            />
          </div>
          <div class="form-group">
            <label for="email">Contraseña:</label>
            <input
              class="form-control"
              type="password"
              name="password"
              id="password"
              placeholder="*********"
              required
            />
          </div>
          <div class="form-submit mt-2">
            <input
              class="btn btn-primary"
              type="submit"
              value="Iniciar Sesion"
            />
          </div>
        </form>
        <a href="#">¿Ha olvidado su contraseña?</a>

        <c:if test="${not empty param.email and not empty param.password}">
          <c:choose>
            <c:when test="${rol == 'administrador'}">
              <sql:query var="rsAdmin" dataSource="${dbUtsProjects}">
                SELECT * FROM administrador WHERE correo = ? and contrasena = ?
                <sql:param value="${correo}" />
                <sql:param value="${contrasena}" />
              </sql:query>
              <c:if test="${not empty rsAdmin.rows}">
                <c:redirect url="./AdministracionPrincipal.jsp" />
              </c:if>
              <c:if test="${empty rsAdmin.rows}">
                <div class="alert alert-danger mb-2">
                  Credenciales Incorrectas.
                </div>
              </c:if>
            </c:when>

            <c:when test="${rol == 'coordinacion'}">
              <sql:query var="rsCoordinacion" dataSource="${dbUtsProjects}">
                SELECT * FROM coordinacion WHERE correo = ? and contrasena = ?
                <sql:param value="${correo}" />
                <sql:param value="${contrasena}" />
              </sql:query>
              <c:if test="${not empty rsCoordinacion.rows}">
                <c:set
                  var="usuario"
                  value="${rsCoordinacion.rows[0].carrera}"
                  scope="session"
                />
                <c:set
                  var="id_coordinacion"
                  value="${rsCoordinacion.rows[0].id_coordinacion}"
                  scope="session"
                />
                <c:redirect url="./CoordinacionPrincipal.jsp" />
              </c:if>
              <c:if test="${empty rsCoordinacion.rows}">
                <div class="alert alert-danger mb-2">
                  Credenciales Incorrectas.
                </div>
              </c:if>
            </c:when>

            <c:when test="${rol == 'docente'}">
              <sql:query var="rsDocente" dataSource="${dbUtsProjects}">
                SELECT * FROM usuario WHERE correo = ? and contrasena = ?
                <sql:param value="${correo}" />
                <sql:param value="${contrasena}" />
              </sql:query>
              <c:if test="${not empty rsDocente.rows}">
                <c:set
                  var="usuario"
                  value="${rsDocente.rows[0].nombres}"
                  scope="session"
                />
                <c:set
                  var="identificacion"
                  value="${rsDocente.rows[0].identificacion}"
                  scope="session"
                />
                <c:redirect url="./DocentePrincipal.jsp" />
              </c:if>
              <c:if test="${empty rsDocente.rows}">
                <div class="alert alert-danger mb-2">
                  Credenciales Incorrectas.
                </div>
              </c:if>
            </c:when>

            <c:when test="${rol == 'estudiante'}">
              <sql:query var="rsEstudiante" dataSource="${dbUtsProjects}">
                SELECT * FROM usuario WHERE correo = ? and contrasena = ?
                <sql:param value="${correo}" />
                <sql:param value="${contrasena}" />
              </sql:query>
              <c:if test="${not empty rsEstudiante.rows}">
                <c:set var="usuario" value="${rsEstudiante.rows[0].nombres}" scope="session"/>
                <c:set var="identificacion" value="${rsEstudiante.rows[0].identificacion}" scope="session"/>
                <c:redirect url="./EstudiantePrincipal.jsp" />  
              </c:if>
              <c:if test="${empty rsEstudiante.rows}">
                <div class="alert alert-danger mb-2">
                  Credenciales Incorrectas.
                </div>
              </c:if>
            </c:when>
          </c:choose>
        </c:if>

        <a class="btn btn-green" href="../index.jsp">Volver al Inicio</a>
      </div>
      <footer>
        <p>
          Copyright &copy; 2024 <strong>Julian y Gabriela.</strong> All rights
          reserved
        </p>
      </footer>
    </main>
    <div class="img-login"></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
  </body>
</html>

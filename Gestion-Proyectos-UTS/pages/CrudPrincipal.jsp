<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <c:set var="servicio" value="${param.crud}" />

        <c:choose>
            <c:when test="${rol == 'administracion'}">
                <c:set var="portal" value="./AdministracionPrincipal.jsp" />
            </c:when>
            <c:when test="${rol == 'coordinacion'}">
                <c:set var="portal" value="./CoordinacionPrincipal.jsp" />
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
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
            <link rel="stylesheet" href="../styles/style.css" />
            <link rel="shortcut icon" href="../img/Logo_UTS_2.png" type="image/x-icon">
            <title>Gestion Proyectos UTS</title>
        </head>

        <body class="page-crud-principal">
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
                    <figure>
                        <img src="../img/Hallowen.png" alt="IMAGEN DEL CRUD" style="width: 350px; height: auto;">
                    </figure>
                    <br/>
                    <br/>
                    <div class="buttons">
                        <a class="btn btn-primary" href="./Crear.jsp?servicio=${servicio}">Crear</a>
                        <a class="btn btn-primary" href="./Mostrar.jsp?servicio=${servicio}">Mostrar</a>
                    </div>
                    <a class="mt-4 btn btn-green" href="${portal}">Volver al Portal</a>
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
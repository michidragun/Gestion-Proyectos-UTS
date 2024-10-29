<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

        <body>
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
                    <h1>PROFESORES <br> DIRECTORES/EVALUADORES</h1>
                    <p class="text-center">¡Hola! Bienvenido al portal de <br>docentes. Elije que servicio deseas<br>
                        utilizar:</p>
                    <div class="buttons">
                        <a class="btn btn-primary" href="./Mostrar.jsp?servicio=director">Interfaz Director</a>
                        <a class="btn btn-primary" href="./Mostrar.jsp?servicio=evaluador">Interfaz Evaluador</a>
                        <a class="btn btn-primary"
                            href="https://www.uts.edu.co/sitio/wp-content/uploads/2019/10/ACUERDO-No.-03-019-CONSEJO-ACADEMICO-CALENDAIO-ACADEMICO-PRESENCIAL-II-SEMESTRE-2024.pdf"
                            target="_blank">Calendario Academico</a>
                        <a class="btn btn-primary"
                            href="https://www.dropbox.com/scl/fo/pudgcaq639agy7t06ahjs/AN084HnuyHffgYL5i--v_Ks/DOCUMENTOS%20DE%20GRADO?dl=0&rlkey=6s0b9ajweteyx2ang7ywvk6xm&subfolder_nav_tracking=1"
                            target="_blank">Formatos de Grado</a>
                        <a class="btn btn-primary" href="./HistorialDocente.jsp">Historial de Proyectos</a>
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
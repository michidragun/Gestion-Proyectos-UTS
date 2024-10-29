<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <link rel="stylesheet" href="styles/style.css" />
    <link rel="shortcut icon" href="./img/Logo_UTS_2.png" type="image/x-icon">
    <title>Gestion Proyectos UTS</title>
  </head>
  <body>
    <header>
      <figure>
        <a href="index.html"><img src="./img/Uts_Logo.png" alt="Logo UTS" /></a>
      </figure>
    </header>
    <main>
      <div class="container-principal">
        <h1>GESTION DE <br> PROYECTOS DE GRADO </h1>
        <p>Iniciar sesion como:</p>
        <div class="buttons">
          <a class="btn btn-primary" href="pages/Login.jsp?rol=administrador">Administrador</a>
          <a class="btn btn-primary" href="pages/Login.jsp?rol=coordinacion">Coordinacion</a>
          <a class="btn btn-primary" href="pages/Login.jsp?rol=estudiante">Estudiante</a>
          <a class="btn btn-primary" href="pages/Login.jsp?rol=docente">Docente</a>
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

function activarSegundoEstudiante() {
    document.getElementById("secondStudent").classList.add("activate");
    document.getElementById("secondStudent").classList.remove("desactivate");
    document.getElementById("buttonActivateStudent").classList.add("desactivate");
    document.getElementById("buttonActivateStudent").classList.remove("activate");
    document.getElementById("buttonDesactivateStudent").classList.add("activate");
    document.getElementById("buttonDesactivateStudent").classList.remove("desactivate");
}
function desactivarSegundoEstudiante() {
    document.getElementById("secondStudent").classList.add("desactivate");
    document.getElementById("secondStudent").classList.remove("activate");
    document.getElementById("buttonActivateStudent").classList.add("activate");
    document.getElementById("buttonActivateStudent").classList.remove("desactivate");
    document.getElementById("buttonDesactivateStudent").classList.add("desactivate");
    document.getElementById("buttonDesactivateStudent").classList.remove("active");
}
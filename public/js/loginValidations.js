window.onload = function() {




    let formulario = document.querySelector("#login-form");

    formulario.addEventListener("submit", function(event) {
        let errores = [];
    

        let fieldUsername = document.querySelector("input#username");

        if (fieldUsername.value == "") {
            errores.push({ param: "username", msg: "Ingrese un email o nombre de usuario" })
        }

        let fieldPassword = document.querySelector("input#password");

        if (fieldPassword.value == "") {
            errores.push({ param: "password", msg: "Ingrese la contraseña" })
        }

        let erroresUL = document.querySelector("#errors-ul")
        erroresUL.innerHTML = "";
        if (errores.length > 0) {
            event.preventDefault()

             // Se vacian los errores de todos los "error-msg"
             document.querySelectorAll(".error-msg").forEach(elem =>{
                elem.innerHTML = ""
            })

            errores.forEach(elemento => {
                erroresUL.innerHTML += "<li>" + "<i class='fas fa-exclamation-circle'></i>" + elemento.msg + "</li>"

            })
        }

    })




}
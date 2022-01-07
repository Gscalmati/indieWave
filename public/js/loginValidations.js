window.onload = function() {




    let formulario = document.querySelector("#login-form");

    formulario.addEventListener("submit", function(event) {
        let errores = [];
        console.log("Todo parado")

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
            errores.forEach(elemento => {
                erroresUL.innerHTML += "<li>" + "<i class='fas fa-exclamation-circle'></i>" + elemento.msg + "</li>"

            })
        }

    })




}
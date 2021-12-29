window.onload = function() {




    let formulario = document.querySelector("#register-form");

    formulario.addEventListener("submit", function(event) {
        let errores = [];
        console.log("Todo parado")

        let fieldName = document.querySelector("input#name");

        if (fieldName.value.length < 2) {
            errores.push({ param: "name", msg: "Ingrese un nombre mayor a 2 caracteres" })
        }

        let fieldSurname = document.querySelector("input#surname");

        if (fieldSurname.value.length < 2) {
            errores.push({ param: "surname", msg: "Ingrese un apellido mayor a 2 caracteres" })
        }

        let fieldEmail = document.querySelector("input#email");

        if (fieldEmail.value.length < 2) {
            errores.push({ param: "email", msg: "Ingrese un apellido mayor a 2 caracteres" })
        }

        let fieldUsername = document.querySelector("input#username");

        if (fieldUsername.value == "") {
            errores.push({ param: "username", msg: "El campo no puede estar vacío" })
        } else if (fieldUsername.value.length < 4) {
            errores.push({ param: "username", msg: "El username debe tener al menos 4 caracteres" })
        }

        let fieldPassword = document.querySelector("input#password");

        if (fieldPassword.value.length < 8) {
            errores.push({ param: "password", msg: "La contraseña debe tener al menos 8 caracteres" })
        }

        let fieldRepassword = document.querySelector("input#repassword");

        if (fieldRepassword.value != fieldPassword.value) {
            errores.push({ param: "repassword", msg: "Ambas contraseñas deben coincidir" })
        }

        console.log(errores)
        let erroresUL = document.querySelector("#errors-ul")
        if (errores.length > 0) {
            event.preventDefault()
            errores.forEach(elemento => {
                erroresUL.innerHTML += "<li>" + elemento.msg + "</li>"

            })
        }

    })




}
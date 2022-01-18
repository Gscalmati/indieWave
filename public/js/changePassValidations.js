window.onload = function () {

    let formulario = document.querySelector("#change-password-form");

    formulario.addEventListener("submit", function (event) {
        let errores = [];

        let fieldOldPass = document.querySelector("input#oldPass");

        if (fieldOldPass.value == "") {
            errores.push({ param: "oldPass", msg: "FRONT Ingrese la contraseña actual" })
        }

        let fieldNewPass = document.querySelector("input#newPass");

        if (fieldNewPass.value == "") {
            errores.push({ param: "newPass", msg: "FRONT Ingrese la contraseña nueva" })
        } else if (fieldNewPass.value.length < 8 || fieldNewPass.value.length > 12) {
            errores.push({ param: "newPass", msg: "FRONT La nueva contraseña debe tener entre 8 y 12 caracteres" })
        }

        let fieldConfirmPass = document.querySelector("input#confirmPass");

        if (fieldConfirmPass.value == "") {
            errores.push({ param: "confirmPass", msg: "FRONT Confirme la contraseña" })
        } else if (fieldNewPass.value != fieldConfirmPass.value) {
            errores.push({ param: "confirmPass", msg: "FRONT Las contraseñas deben coincidir" })
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
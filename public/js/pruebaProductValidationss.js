window.onload = function () {



    let form = document.querySelector("#create-form");
    console.log(form);
    let spanName = document.querySelector("#error-name")
    let spanDev = document.querySelector("#developer")
    let spanMail = document.querySelector("#email")


    console.log(spanDev);


    form.addEventListener("submit", function (e) {
        e.preventDefault();
        
        console.log("estoy en la consola");
        let errors = {};
        
        /*Validaciones nombre*/
        let campoName = document.querySelector("#name");
        if (campoName.game_name.value.length == 0) {
            errors.game_name = "El nombre del producto no puede estar vacío "
            spanName.innerHTML = errors.game_name;
        } else if (campoName.game_name.value.length < 5) {
            errors.game_name = "El nombre del producto debe tener como mínimo 5 caracteres "
            spanName.innerHTML = errors.game_name;
        } else {
            delete errors.game_name;
        }
        
        /*Validaciones desarrollador*/

        if (form.developer.value.length == 0) {
            errors.developer = "El nombre del desarrollador no puede estar vacío "
            spanDev.innerHTML = errors.developer;
        } else if (form.developer.value.length < 5) {
            errors.developer = "El nombre del producto debe tener como mínimo 5 caracteres "
            spanDev.innerHTML = errors.developer;
        } else {
            delete errors.developer;
        }

        /*Validaciones mail*/

        if (form.email.value.length == "") {
            errors.email = "Ingrese un email"   //revisar
            spanMail.innerHTML = errors.email;
        } else {
            let regex = new RegExp("\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b");
            if (!regex.match(form.email.value)) {
                errors.email = "El email no puede estar vacío"
                spanMail.innerHTML = errors.email;
            }
        }

        console.log(Object.keys(errors));

        if (errors.length > 0) {
            e.preventDefault()
            console.log(errors)
            errors.forEach(elemento => {
                let error = document.querySelector("#errors-" + elemento.param);
                error.innerHTML = "<span>" + "<i class='fas fa-exclamation-circle'></i>" + elemento.msg + "</span>";
            })
        }

    })


}


let inputPic = document.querySelector("input#profilePic");
        let picData = inputPic.value;
     
        if (picData != ""){
            console.log("Se eligió una foto")
            let picExtension = picData.substring(
                picData.lastIndexOf('.') + 1).toLowerCase();
            if (picExtension != "jpg" && picExtension != "png" && picExtension != "jpeg"){
                errors.push({ param: "profilePic", msg: "La imagen debe ser de formato JPG/JPEG/PNG o ninguna" })
            } else {
                console.log("Cumple con los formatos")

            }
        }
window.onload = function() {
    
    let form = document.querySelector("#create-form");

    form.addEventListener("submit", function(e) {
        console.log("Estoy en la consola")
        
        let errors = [];

        /*Validaciones nombre*/
        let inputName = document.querySelector("#name");

        console.log(inputName);
        if (inputName.value == "") {
            errors.push({ param: "name", msg: " El nombre no puede estar vacío" })
        }else if(inputName.value.length < 5){
            errors.push({ param: "name", msg: " El nombre debe tener como mínimo 5 caracteres" })
        }

        /*Validaciones desarrollador*/
        let inputDeveloper = document.querySelector("#developer");

        if (inputDeveloper.value.length == 0 ) {
            errors.push({ param: "developer", msg: " El nombre del desarrollador no puede estar vacío" })
        }

        /*Validaciones mail*/
        let inputEmail = document.querySelector("#email");

        if (inputEmail.value.length == 0) {
            errors.push({ param: "email", msg: " Ingrese un email" })
        } else {
            let regex = new RegExp("\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b");
            if (!regex.match(inputEmail.value)) {
            errors.push({ param: "email", msg: " Ingrese un email válido" }
            )}
        }

        /*Validaciones precio*/
        let inputPrice = document.querySelector("#price");

        if (inputPrice.value == "") {
            errors.push({ param: "price", msg: " El precio no puede estar vacío" })
        //} else if () { si no es entero
        //    errors.push({ param: "price", msg: "El precio debe ser un número entero" })
        }

        /*Validaciones requisito mininmo */
        let inputMinRequeriment = document.querySelector("#min_requirements");

        if (inputMinRequeriment.value.length < 20) {
            errors.push({ param: "min_requirements", msg: " Mínimo 20 caracteres" })
        }

        /*Validaciones requisito recomendado */
        let inputRecRequeriment = document.querySelector("#rec_requirements");

        if (inputRecRequeriment.value.length < 20) {
            errors.push({ param: "rec_requirements", msg: " Mínimo 20 caracteres" })
        }

        /*Validaciones descripcion */
        let inputDescription = document.querySelector("#description");

        if (inputDescription.value < 50) {
            errors.push({ param: "description", msg: " Mínimo 50 caracteres" })
        }

        console.log(errors);

            
        if (errors.length > 0) {
            e.preventDefault()
            console.log(errors)
            errors.forEach(elemento => {
                let error = document.querySelector("#error-" + elemento.param);
                error.innerHTML = "<span>" + "<i class='fas fa-exclamation-circle'></i>" + elemento.msg + "</span>";
            })
        }

    })




}
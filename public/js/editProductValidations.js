window.onload = function() {
    
    let form = document.querySelector("#edit-form");

    form.addEventListener("submit", function(e) {
        
        
        let errors = [];

        /*Validaciones nombre*/
        let inputName = document.querySelector("#name");

        
        if (inputName.value == "") {
            errors.push({ param: "name", msg: " El nombre no puede estar vacío" })
        }else if(inputName.value.length < 5){
            errors.push({ param: "name", msg: " El nombre debe tener como mínimo 5 caracteres" })
        }

        /*Validación desarrollador*/
        let inputDeveloper = document.querySelector("#developer");

        if (inputDeveloper.value.length == 0 ) {
            errors.push({ param: "developer", msg: " El nombre del desarrollador no puede estar vacío" })
        }

        /*Validaciones logo*/
        let inputLogo = document.querySelector("#logo");
        let picLogo = inputLogo.value;
        
        if (picLogo == ""){
            
            let picLogoExtension = picLogo.substring(
                picLogo.lastIndexOf('.') + 1).toLowerCase();
            if (picLogoExtension != "jpg" && picLogoExtension != "png" && picLogoExtension != "jpeg"){
                errors.push({ param: "logo", msg: "El logo debe ser de formato JPG/JPEG/PNG o ninguna" })
            } 
        }

        /*Validaciones mail*/
        let inputEmail = document.querySelector("#email");
        
        if (inputEmail.value.length == 0) {
            errors.push({ param: "email", msg: "Ingrese un email" })
        } else {
            let regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!regex.test(inputEmail.value)) {
                errors.push({ param: "email", msg: "Ingrese un email válido" }
            )} 
        }

        /*Validación fecha de lanzamiento*/
        let inputDate = document.querySelector("#release_date");

        if (inputDate.value.length == "" ) {
            errors.push({ param: "release_date", msg: " La fecha de lanzamiento no puede estar vacía" })
        }


        /*Validaciones precio*/
        let inputPrice = document.querySelector("#price");
        (inputPrice.value);
        if (inputPrice.value == "") {
            errors.push({ param: "price", msg: " El precio no puede estar vacío" })
        }else if(inputPrice.value <= 0 && inputPrice.value >= 0 ){
            errors.push({ param: "price", msg: " El precio debe ser un numero entero positivo" })
        }

        /*Validaciones imagen*/
        let inputImages = document.querySelector("#images");
        let picData = inputImages.value;
        
        if (picData == ""){
            
            let picExtension = picData.substring(
                picData.lastIndexOf('.') + 1).toLowerCase();
            if (picExtension != "jpg" && picExtension != "png" && picExtension != "jpeg"){
                errors.push({ param: "images", msg: "La imagen debe ser de formato JPG/JPEG/PNG o ninguna" })
            } 
        }

        /*Validación requisito mininmo */
        let inputMinRequeriment = document.querySelector("#min_requirements");

        if (inputMinRequeriment.value.length < 20) {
            errors.push({ param: "min_requirements", msg: " Mínimo 20 caracteres" })
        }

        /*Validación requisito recomendado */
        let inputRecRequeriment = document.querySelector("#rec_requirements");

        if (inputRecRequeriment.value.length < 20) {
            errors.push({ param: "rec_requirements", msg: " Mínimo 20 caracteres" })
        }

        /*Validación descripcion */
        let inputDescription = document.querySelector("#description");

        if (inputDescription.value < 50) {
            errors.push({ param: "description", msg: " Mínimo 50 caracteres" })
        }

    

            
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
const db = require("../../database/models")
const { body } = require("express-validator");


const validations = [
    body("name").notEmpty().withMessage("El campo no puede estar vacío")
    .isLength({ min: 3 }).withMessage("Ingrese un nombre mayor a 2 caracteres")
    .isAlpha('es-ES', { ignore: '\s' }).withMessage("Ingrese un nombre válido"),

    body("surname").notEmpty().withMessage("El campo no puede estar vacío")
    .isLength({ min: 2 }).withMessage("Ingrese un apellido mayor a 2 caracteres")
    .isAlpha('es-ES', { ignore: '\s' }).withMessage("Ingrese un apellido válido"),

    body("email").notEmpty().withMessage("El campo no puede estar vacío")
    .isEmail().withMessage("Ingrese un email con formato válido").bail()
    .custom((value, {req}) => {
        console.log(value)
        console.log(req.session.userLogged)
        if(value != req.session.userLogged.email){
        return db.Users.findOne({
                where: {
                    email: value
                },
            })
            .then(result => {
                if (result) {
                    return Promise.reject("Ya existe un usuario asociado a este email");
                }
                //No poner CATCH porque sobreescribe el "reject" y evita que se cree un error para la vista.
            })
        } else {
            console.log("Es el mismo email")
            return true
        }

    }),
    body("username").notEmpty().withMessage("El campo no puede estar vacío")
    .isLength({ min: 4 }).withMessage("Ingrese un nombre de usuario mayor a 4 caracteres")
    .custom((value, {req}) => {
        if (value != req.session.userLogged.username){
        return db.Users.findOne({
                where: {
                    username: value
                }
            })
            .then(function(result) {
                if (result) {
                    return Promise.reject("Ya existe un usuario con ese nombre");
                }
                //No poner CATCH porque sobreescribe el "reject" y evita que se cree un error para la vista.
            })
        } else {
            console.log("Es el mismo usuario");
            return true
        }
    }),
    body("password").notEmpty().withMessage("Ingrese contraseña")
    .isLength({ min: 8 }).withMessage("La contraseña debe mínimo 8 caracteres"),
    body("repassword").notEmpty().withMessage("El campo no puede estar vacío")
    .custom((pass, { req }) => { //Validacion para confirmar constraseña, traigo al "req" con el deconstructor
        return (pass == req.body.password)
    }).withMessage("Las contraseñas no coinciden"),

    body("profilePic")
    .custom((image, { req }) => {
        if (!req.file){
            return true
        } else if(req.file.mimetype === "image/png" || req.file.mimetype === "image/jpeg" || req.file.mimetype === "image/jpg"){
                return true
        }
        return false
    })
    .withMessage("La imagen debe ser de formato JPG/JPEG/PNG o ninguna")
    //De todas formas, la imagen se sigue subiendo a la carpeta USERS
]

module.exports = validations
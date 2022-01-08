// Configuracion para JSON Database
/*const path = require("path");
const fs = require("fs");

let jsonUsers = fs.readFileSync(path.resolve(__dirname, '../data/users.json'), 'utf-8');
let users = JSON.parse(jsonUsers);
*/

const db = require("../../../database/models")
const { body } = require("express-validator");
const { connect } = require("../../routes/users");

const validations = [
    body("name").notEmpty().withMessage("El campo no puede estar vacío")
    .isLength({ min: 3 }).withMessage("Ingrese un nombre mayor a 2 caracteres")
    .isAlpha('es-ES', { ignore: '\s' }).withMessage("Ingrese un nombre válido"),
    body("surname").notEmpty().withMessage("El campo no puede estar vacío")
    .isLength({ min: 2 }).withMessage("Ingrese un apellido mayor a 2 caracteres")
    .isAlpha('es-ES', { ignore: '\s' }).withMessage("Ingrese un apellido válido"),
    body("email").notEmpty().withMessage("El campo no puede estar vacío")
    .isEmail().withMessage("Ingrese un email con formato válido").bail()
    .custom((value) => {
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

    }),
    body("username").notEmpty().withMessage("El campo no puede estar vacío")
    .isLength({ min: 4 }).withMessage("Ingrese un nombre de usuario mayor a 4 caracteres")
    .custom((value) => {
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
    }),
    body("password").notEmpty().withMessage("Ingrese contraseña")
    .isLength({ min: 8 }).withMessage("La contraseña debe mínimo 8 caracteres"),
    body("repassword").notEmpty().withMessage("El campo no puede estar vacío")
    .custom((pass, { req }) => { //Validacion para confirmar constraseña, traigo al "req" con el deconstructor
        return (pass == req.body.password)
    }).withMessage("Las contraseñas no coinciden"),

    body("profilePic")
    .custom((image, { req }) => {
        if(req.file.mimetype === "image/png" || req.file.mimetype === "image/jpeg" || req.file.mimetype === "image/jpg"){
            return true
        }
    })
    .withMessage("La imagen debe ser de formato JPG/JPEG/PNG")
    //De todas formas, la imagen se sigue subiendo a la carpeta USERS
]

/* Validaciones de JSON
const validations = [
    body("username").custom(username => {
        return users.find(user => user.username == username) == undefined
    }).withMessage("Ya existe un usuario con este nombre de usuario"),
    body("email").isEmail().withMessage("Ingrese un email válido").bail().custom(email => {
        return users.find(user => user.email == email) == undefined
    }).withMessage("Ya existe un usuario asociado a este email"),
    body("name").isAlpha('es-ES', { ignore: '\s' }).withMessage("Ingrese un nombre y un apellido válidos"),
    body("surname").isAlpha().withMessage("Ingrese un nombre y un apellido válidos"),
    body("password").isLength({ min: 8, max: 12 }).withMessage("La contraseña debe tener entre 8 y 12 caracteres"),
    body("repassword").custom((pass, { req }) => { //Validacion para confirmar constraseña, traigo al "req" con el deconstructor
        return (pass == req.body.password)
    }).withMessage("Las contraseñas no coinciden")
]*/



module.exports = validations
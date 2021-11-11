/* Config Express Validator */

/* Añadir validaciones de registro */
const { check } = require("express-validator");
const validations = [
    check("username").isEmpty().withMessage("Ingrese un Email o Usuario Válido"),
    check("password").isEmpty().withMessage("Ingrese su contraseña"),
    
]

module.exports = validations
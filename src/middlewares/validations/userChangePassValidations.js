const db = require("../../../database/models");
const { body } = require("express-validator");

const validations = [
    body("oldPass").notEmpty().withMessage("Ingrese la contraseña actual").bail(),
    body("newPass").notEmpty().withMessage("Ingrese la contraseña nueva").bail()
    .isLength({ min: 8, max: 12 }).withMessage("La nueva contraseña debe tener entre 8 y 12 caracteres"),
    body("confirmPass").notEmpty().withMessage("Confirme la contraseña").bail()
    .custom((pass, { req }) => { 
        return (pass == req.body.newPass)
    }).withMessage("Las contraseñas no coinciden")
]

module.exports = validations
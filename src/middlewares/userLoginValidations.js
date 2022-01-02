const db = require("../../database/models");
const { body } = require("express-validator");
const { Op } = require("sequelize");

const validations = [
    body("username").notEmpty().withMessage("Ingrese un email o nombre de usuario").bail()
    .custom((value, { req }) => {
        return db.Users.findOne({
                where: {
                    [Op.or]: [{ username: req.body.username }, { email: req.body.username }]
                },
                raw: true
            })
            .then(function(result) {
                if (!result) {
                    return Promise.reject("No encontramos un usuario con ese nombre/email");
                }
            })
    }),
    body("password").notEmpty().withMessage("Ingrese la contraseña")
]

module.exports = validations
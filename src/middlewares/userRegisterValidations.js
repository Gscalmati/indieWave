const path = require ("path");
const fs = require("fs");

let jsonUsers = fs.readFileSync(path.resolve(__dirname, '../data/users.json'), 'utf-8');
let users = JSON.parse(jsonUsers);

const { check } = require("express-validator");
const validations = [
    check("username").custom(username => {
        return users.find(user => user.username == username) != undefined
    }).withMessage("Ya existe un usuario con este nombre de usuario"),
    check("email").isEmail().withMessage("Ingrese un email válido").custom(email => {
        return users.find(user => user.email == email) != undefined
    }).withMessage("Ya existe un usuario asociado a este email"),,
    check("name").isAlpha().withMessage("Ingrese un nombre y un apellido válidos"),
    check("surname").isAlpha().withMessage("Ingrese un nombre y un apellido válidos"),
    check("password").isLength({min: 8, max: 12}).withMessage("La contraseña debe tener entre 8 y 12 caracteres"),
]

module.exports = validations
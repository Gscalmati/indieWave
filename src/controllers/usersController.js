const path = require("path");

const fs = require("fs");

const bcryptjs = require("bcryptjs")

let jsonUsers = fs.readFileSync(path.resolve(__dirname, '../data/users.json'), 'utf-8');
let users = JSON.parse(jsonUsers); //Convertimos el json a array

/* Config Express Validator */
const { check } = require("express-validator");
const validations = [
    check("username").isEmpty().withMessage("Ingrese un Email o Usuario Válido"),
    check("password").isEmpty().withMessage("Ingrese su constraseña"),
]


let usersController = {
    register: (req, res) => {
        res.render("users/register");
    },

    login: (req, res) => {
        res.render("users/login");
    },

    logged: (req, res) => { /* Es importante modificar de NAME a USERNAME*/
        let userFound = users.find(user => ((user.email === req.body.username) || (user.name === req.body.username)) &&
            (bcryptjs.compareSync(req.body.password, user.password)));
        if (userFound != undefined) {
            delete userFound.password;
            req.session.userLogged = userFound;
            return res.redirect("/");
        }
        res.render("users/login", { errors: "Usuario o contraseña incorrecta" });
    },

    logout: (req, res) => {
        req.session.destroy();
        res.redirect("/")
    }
}

module.exports = usersController;
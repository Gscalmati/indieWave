<<<<<<< HEAD
const path = require ("path");
const fs = require("fs");
const bcrypt = require("bcryptjs")
=======
const path = require("path");

const fs = require("fs");

const bcryptjs = require("bcryptjs")
>>>>>>> 8446b016f852d444c72790bcc5f0266da198562a

let jsonUsers = fs.readFileSync(path.resolve(__dirname, '../data/users.json'), 'utf-8');
let users = JSON.parse(jsonUsers); //Convertimos el json a array

/* Función para conseguir el nuevo ID */
const newId = function () {
    let idNum = 0;
    users.forEach(user => {
        if (user.id > idNum) {
            idNum = user.id
        }
    })
    return idNum + 1;
}
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

    store: function (req, res) {
        console.log(req.file)
        let newUser = {
            id: newId(),
            name: req.body.name,
            surname: req.body.surname,
            email: req.body.email,
            password: bcrypt.hashSync(req.body.password, 10),
            profilepic: `/img/users/${req.file.filename}`,
            newsletter: req.body.newsletter
        }

        users.push(newUser);
        let newJson = JSON.stringify(users);

        fs.writeFileSync(path.resolve(__dirname, '../data/users.json'), newJson)
        res.redirect("/users/login");
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
const path = require("path");
const fs = require("fs");
const bcryptjs = require("bcryptjs");
const { validationResult } = require('express-validator');

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

let usersController = {
    register: (req, res) => {
        res.render("users/register");
    },

    store: function (req, res) {
        let errors = validationResult(req);
        console.log("req.body antes de cualquier falopa " + req.body.username)

        if (errors.isEmpty()){
            let newUser = {
                id: newId(),
                username: req.body.username,
                name: req.body.name,
                surname: req.body.surname,
                email: req.body.email,
                password: bcryptjs.hashSync(req.body.password, 10),
                profilepic: req.file != undefined ? `/img/users/${req.file.filename}` : "/img/users/default.png",
                news: req.body.news != undefined
            }

            users.push(newUser);
            let newJson = JSON.stringify(users);

            fs.writeFileSync(path.resolve(__dirname, '../data/users.json'), newJson)
            res.redirect("/users/login");
        } else {
            console.log(errors.mapped())
            console.log(req.body)
            res.render('users/register', {errors: errors.mapped(), old: req.body})
        }
    },

    login: (req, res) => {
        res.render("users/login");
    },

    logged: (req, res) => { /* Es importante modificar de NAME a USERNAME*/
        let userFound = users.find(user => ((user.email === req.body.email) || (user.username === req.body.username)) &&
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
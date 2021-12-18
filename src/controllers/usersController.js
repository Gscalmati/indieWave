const path = require("path");
const fs = require("fs");
const bcryptjs = require("bcryptjs");
const { validationResult } = require('express-validator');
const { createBrotliCompress } = require("zlib");

let jsonUsers = fs.readFileSync(path.resolve(__dirname, '../data/users.json'), 'utf-8');
let users = JSON.parse(jsonUsers); //Convertimos el json a array

// Traer la DB
let db = require("../../database/models");
const { Sequelize } = require("../../database/models");
const { Op } = require("sequelize");

/* Función para conseguir el nuevo ID */
const newId = function() {
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

    store: function(req, res) {
        let errors = validationResult(req);


        if (errors.isEmpty()) {

            let file = req.file != undefined ? `/img/users/${req.file.filename}` : undefined;

            db.Users.create({
                    username: req.body.username,
                    name: req.body.name,
                    surname: req.body.surname,
                    email: req.body.email,
                    profile_pic: file,
                    password: bcryptjs.hashSync(req.body.password, 10),
                    admin: false
                })
                .then(user => {
                    db.Shoppingcarts.create({
                        user_id: user.get("id")
                    })

                })

            res.redirect("/users/login");
        } else {
            res.render('users/register', { errors: errors.mapped(), old: req.body })
        }
    },

    login: (req, res) => {


        /*if (req.cookies.usuario) {
            return res.render("users/login", { usuario: req.cookies.usuario });
        }*/

        res.render("users/login");
    },

    logged: (req, res) => { /* Es importante modificar de NAME a USERNAME*/
        let userFound;
        (async function() { // Creo un IIFE - Immediately Invoked Function Expression
            try {
                userFound = await db.Users.findOne({
                    where: {
                        [Op.or]: [{ username: req.body.username }, { email: req.body.username }]
                    },
                    raw: true
                });

                if (bcryptjs.compare(req.body.password, userFound.password)) {
                    delete userFound.password
                    req.session.userLogged = userFound;

                    // Seteo de cookies
                    if (req.body.remember != undefined) {
                        res.cookie('email', userFound.email, { maxAge: 6000 * 100 * 10 })
                    }


                    return res.redirect("/");
                } else {
                    res.render("users/login", { errors: "Usuario o contraseña incorrecta" });
                }
            } catch (error) {
                console.log(error);
            }
        })()
    },

    logout: (req, res) => {
        req.session.destroy();
        //res.clearCookie("usuario")  Esto va a utilizarse cuando hagamos un Autologin una vez realizad la BD
        res.redirect("/")
    },

    profile: (req, res) => {
        res.render("users/profile");
    }
}

module.exports = usersController;
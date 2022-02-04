const path = require("path");
const fs = require("fs");
const bcryptjs = require("bcryptjs");
const { validationResult } = require('express-validator');
const { createBrotliCompress } = require("zlib");

let jsonUsers = fs.readFileSync(path.resolve(__dirname, '../data/users.json'), 'utf-8');
let users = JSON.parse(jsonUsers); //Convertimos el json a array

// Traer la DB
let db = require("../database/models");
const { Sequelize } = require("../database/models");
const { Op } = require("sequelize");
const { log } = require("console");

/* Función para conseguir el nuevo ID */
/*
const newId = function() {
    let idNum = 0;
    users.forEach(user => {
        if (user.id > idNum) {
            idNum = user.id
        }
    })
    return idNum + 1;
}
*/

let usersController = {
    register: (req, res) => {
        res.render("users/register");
    },

    store: function (req, res) {
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

            res.render("users/login", { registerSuccess: true});
        } else {

            if (req.file) {

                fs.unlink(req.file.path, (err => {
                    if (err) console.log(err);
                }))
            }
            res.render('users/register', { errors: errors.mapped(), old: req.body})
        }
    },

    login: (req, res) => {

        res.render("users/login");
    },

    logged: (req, res) => { /* Es importante modificar de NAME a USERNAME*/

        (async function () { // Creo un IIFE - Immediately Invoked Function Expression
            try {
                let errors = validationResult(req);
                if (errors.isEmpty()) {
                    let userFound = await db.Users.findOne({
                        where: {
                            [Op.or]: [{ username: req.body.username }, { email: req.body.username }]
                        },
                        raw: true
                    });

                    if (await bcryptjs.compare(req.body.password, userFound.password)) {

                        delete userFound.password
                        req.session.userLogged = userFound;

                        // Seteo de cookies
                        if (req.body.remember != undefined) {
                            res.cookie('email', userFound.email, { maxAge: 6000 * 100 * 10 })
                        }


                        return res.redirect("/");
                    } else {

                        return res.render("users/login", { errors: { password: { msg: "Contraseña incorrecta" } } });
                    }
                } else {
                    return res.render("users/login", { errors: errors.mapped() });
                }
            } catch (error) {
                console.log(error);
            }
        })()
    },

    logout: (req, res) => {
        req.session.destroy();
        res.clearCookie("email") //Esto va a utilizarse cuando hagamos un Autologin una vez realizad la BD
        res.redirect("/")
    },

    profile: async (req, res) => {
        try {

            let loggedUser = await db.Users.findByPk(req.session.userLogged.id);
            return res.render("users/profile", { user: loggedUser })

        } catch (error) {
            console.log(error);
        }
    },

    profileById: async (req, res) => {
        try {
            let user = await db.Users.findByPk(req.params.id);
            return res.render("users/profile", { user: user })

        } catch (error) {
            console.log(error);
        }
    },

    editProfile: (req, res) => {

        (async function () {
            try {

                editUser = await db.Users.findByPk(req.session.userLogged.id);

                return res.render("users/edit", { userLogged: editUser })

            } catch (error) {
                console.log(error);
            }
        })()

    },

    saveProfile: (req, res) => {

        (async () => {
            try {

                let errors = validationResult(req);

                if (errors.isEmpty()) {
                    let file;
                    if (req.file != undefined) {
                        // RUTA CORRECTA path.resolve(__dirname + "/../../public" + req.session.userLogged.profile_pic)
                        //Con esto funciona, porque sí fs.unlink(__dirname + req.session.userLogged.profile_pic, (err => {
                        fs.unlink(path.resolve(__dirname + "/../../public" + req.session.userLogged.profile_pic), (err => {
                            if (err) console.log(err);
                        }));

                        file = `/img/users/${req.file.filename}`
                    } else {
                        file = await db.Users.findByPk(req.session.userLogged.id);
                        file = file.profile_pic;

                    }


                    await db.Users.update({
                        username: req.body.username,
                        name: req.body.name,
                        surname: req.body.surname,
                        email: req.body.email,
                        password: req.body.password,
                        profile_pic: file
                    }, { where: { id: req.session.userLogged.id } })


                    let sessionId = req.session.userLogged.id;

                    req.session.userLogged = await db.Users.findByPk(sessionId, { raw: true });


                    // res.render("users/profile"); Usamos REDIRECT en cambio, porque necesitamos iniciar un nuevo request. Para actualiar LOCALS, mediante loggedUserMiddleware
                    res.redirect("/users/profile")
                } else {

                    if (req.file) {
                        fs.unlink(req.file.path, (err => {
                            if (err) console.log(err);
                        }))
                    }
                    return res.render("users/edit", { errors: errors.mapped() });
                }
            } catch (error) {
                console.log(error)
            }

        })()

    },

    changePassword: (req, res) => {
        res.render("users/changePassword")
    },

    updatePassword: (req, res) => {
        (async () => {
            try {
                let errors = validationResult(req);
                if (errors.isEmpty()) {
                    let currentUser = await db.Users.findByPk(req.session.userLogged.id);

                    if (await bcryptjs.compare(req.body.oldPass, currentUser.password)) {

                        await db.Users.update({
                            password: await bcryptjs.hash(req.body.newPass, 10)
                        }, { where: { id: currentUser.id } })

       
                        return res.redirect("/users/profile")

                    } else {
                        return res.render("users/changePassword", { errors: { oldPass: { msg: "La contraseña actual ingresada es incorrecta" } } });
                    }
                } else {
                    return res.render("users/changePassword", { errors: errors.mapped() });
                }

            } catch (error) {
                console.log(error)
            }
        })()
    }
}

module.exports = usersController;
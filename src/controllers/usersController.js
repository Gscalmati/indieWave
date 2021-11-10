const path = require ("path");
const fs = require("fs");
const bcrypt = require("bcryptjs")

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
    register : (req, res) =>{
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
    
    login : (req, res) =>{
        res.render("users/login");
    }
}

module.exports = usersController;
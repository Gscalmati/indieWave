const path = require ("path");

let usersController = {
    register : (req, res) =>{
        res.sendFile(path.resolve(__dirname, "../views/users/register.html"));
    },
    
    login : (req, res) =>{
        res.sendFile(path.resolve(__dirname, "../views/users/login.html"));
    }
}

module.exports = usersController;
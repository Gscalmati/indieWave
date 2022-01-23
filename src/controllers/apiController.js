const path = require('path');
const db = require("../database/models");
let mainController = {
   
    getUsers: async (req,res) => {
        res.send("Estoy vivo");
    }
}



module.exports = mainController;



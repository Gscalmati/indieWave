const path = require('path');

let mainController = {
    home : function (req, res){
        res.sendFile(path.resolve(__dirname, "../views/home.html"));
    },

    home2: (req,res) => {
        res.sendFile(path.resolve(__dirname, "../views/home-dos.html"));
    },

    homeAlt: (req,res) =>{
        res.sendFile(path.resolve(__dirname, "../views/home.html"));
    }


}

module.exports = mainController;
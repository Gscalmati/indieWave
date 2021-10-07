const path = require('path');

let mainController = {
    home : function (req, res){
        res.render("main/home");
    },

    home2: (req,res) => {
        res.render("main/home-dos");
    },

    homeAlt: (req,res) =>{
        res.render("main/home");
    }


}

module.exports = mainController;
const path = require('path');
const db = require("../database/models");
let mainController = {
    home: (req,res) => {



        db.Products.findAll({ limit: 4 , raw:true})
        .then(gameFeatured => {
           return res.render("main/home",{productsFeatured: gameFeatured});
        })
        .catch(error =>{
            console.log(error);
        })


        db.Products.findAll({ limit: 5 , raw:true})
        .then(gameFresh =>{
            return res.render("main/home", {productsFresh: gameFresh});
        })
        .catch(error =>{
            console.log(error);
        })



        
    },
}

module.exports = mainController;



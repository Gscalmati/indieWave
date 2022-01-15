const { log } = require('console');
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

    homeAsync: async(req,res) => {



         let gameFeatured = await db.Products.findAll({ limit: 4 , raw:true});
        


         let gameFresh = await db.Products.findAll({ limit: 5 , raw:true});
         console.log(gameFresh)


        return res.render("main/home", {productsFeatured : gameFeatured, productsFresh: gameFresh});
        
    }
}



module.exports = mainController;



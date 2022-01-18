const { log } = require('console');
const path = require('path');
const db = require("../database/models");
let mainController = {
   
    home: async (req,res) => {


         let gameFeatured = await db.Products.findAll({ limit: 4 , raw:true});
        


         let gameFresh = await db.Products.findAll({ limit: 5, offset:10 , raw:true});
        


        return res.render("main/home", {productsFeatured : gameFeatured, productsFresh: gameFresh});
        
    }
}



module.exports = mainController;



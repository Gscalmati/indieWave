const { log } = require('console');
const path = require('path');
const db = require("../database/models");
let mainController = {
   
    home: async (req,res) => {


         let gameFeatured = await db.Products.findAll({ limit: 4 , raw:true});
        


         let gameFresh = await db.Products.findAll({order:[['release_date','DESC']], limit: 5, raw:true});
        


         //let slider = await db.Products.findAll({ limit: 4 , raw:true});productsSlider : slider



        return res.render("main/home", {productsFeatured : gameFeatured, productsFresh: gameFresh });
        
    }
}



module.exports = mainController;



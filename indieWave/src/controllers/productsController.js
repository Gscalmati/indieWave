const path = require("path");

/*

let jsonProducts = fs.readFileSync(path.resolve(__dirname, '../db/products.json'), 'utf-8');
let products = JSON.parse(jsonProducts); //Convertimos el json a array

*/

productsController = {
    categories: function (req, res){
        res.render("products/categories"); 
    },
    categorygames: function (req, res){
        let category = req.params.category;

        /* Me guarto el array de esa categoria 
        
        let categoryGames = json[category]
        
        */

        res.render("products/categoryGames", /*el array con los juegos de esa categoria*/); 
    },
    detail: function (req, res){
        res.render("products/productDetail");
    },

    cart: function(req, res){
        res.render("products/shoppingCart");
    },
    edit: function(req, res){
        res.render("products/productEdit");
    },
    create: function(req, res){
        res.render("products/productCreate")
    },
    createdArt: function(req, res){
        res.send("Artículo creado")
    },
    editArt: function(req, res){
        res.send("Artículo editado")
    }
}

module.exports = productsController;
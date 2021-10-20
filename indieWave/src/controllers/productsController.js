const path = require("path");

productsController = {
    categories: function (req, res){
        res.render("products/categories"); 
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
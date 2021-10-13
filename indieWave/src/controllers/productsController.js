const path = require("path");

productsController = {
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
    }
}

module.exports = productsController;
const path = require("path");

productsController = {
    detail: function (req, res){
        res.render("products/productDetail");
    },

    cart: function(req, res){
        res.render("products/shoppingCart")
    }

}

module.exports = productsController;
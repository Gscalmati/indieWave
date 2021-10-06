const path = require("path");

productsController = {
    detail: function (req, res){
        res.sendFile(path.resolve(__dirname, "../views/products/productDetail.html"));
    },

    cart: function (req, res){
        res.sendFile(path.resolve(__dirname, "../views/products/shoppingCart.html"))
    }
}

module.exports = productsController;
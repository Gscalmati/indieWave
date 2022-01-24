const db = require("../database/models");
const sequelize = require("sequelize");
const { response } = require("express");
const op = db.Sequelize.Op;


apiProductsController = {
    /*productControler APIs */
    list: function (req, res) {
        db.Products.findAll()
        .then(products =>{
            return res.json({
                total: products.length,
                data:products
            })
        })
    },
    show: function (req, res) {
        db.Products.findByPk(req.params.id)
        .then(product =>{
            return res.json({
                data:product
            })
        })
    }
}
module.exports = apiProductsController;
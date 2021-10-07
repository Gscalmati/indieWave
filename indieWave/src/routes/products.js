const express = require("express");
const router = express.Router();

const productsController = require("../controllers/productsController");

router.get("/productDetail", productsController.detail);

router.get("/shoppingCart", productsController.cart);

module.exports = router;
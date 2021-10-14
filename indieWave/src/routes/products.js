const express = require("express");
const router = express.Router();

const productsController = require("../controllers/productsController");

router.get("/productDetail", productsController.detail);

router.get("/shoppingCart", productsController.cart);

router.get("/edit", productsController.edit);

router.post("/edit", productsController.edit);

router.get("/create", productsController.create);

router.post("/create", productsController.create);

module.exports = router;
const express = require("express");
const router = express.Router();

const productsController = require("../controllers/productsController");

router.get("/", productsController.categories);
router.post("/", productsController.createdArt);

router.get("/productDetail", productsController.detail);

router.get("/shoppingCart", productsController.cart);

router.get("/edit", productsController.edit);

router.post("/edit", productsController.edit);

router.get("/create", productsController.create);



router.get("/:category", productsController.categorygames);


module.exports = router;
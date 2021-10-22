const express = require("express");
const router = express.Router();

const productsController = require("../controllers/productsController");

router.get("/", productsController.categories);
router.post("/", productsController.store);

router.get("/dashboard", productsController.dashboard);

router.get("/shoppingCart", productsController.cart);

router.get("/edit", productsController.edit);

router.post("/edit", productsController.edit);

router.get("/create", productsController.create);


router.get("/:id", productsController.detail);

router.get("/categories/:category", productsController.categorygames);


module.exports = router;
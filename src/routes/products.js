const express = require("express");
const router = express.Router();

const productsController = require("../controllers/productsController");

router.get("/", productsController.categories);
router.post("/", productsController.store);

/* CRUD */
router.get("/dashboard", productsController.dashboard);

/* Carrito */
router.get("/shoppingCart", productsController.cart);

/* Editar producto */
router.get("/edit/:id", productsController.edit);

router.post("/edit", productsController.edit);

/* Crear Producto*/
router.get("/create", productsController.create);

/* Detalle de producto*/
router.get("/:id", productsController.detail);

router.get("/categories/:category", productsController.categorygames);


module.exports = router;
const express = require('express');
const router = express.Router();

const apiController = require("../controllers/apiController");

/*Listado de usuarios */
router.get("/users", apiController.getUsers);

/*Obtener usuario por id */
router.get("/users/:id", apiController.getUserById);


/*API products */
/*Lista de productos de a 10 por página*/
router.get("/products", apiController.getProducts);

/*Detalle del producto*/
router.get("/products/:id", apiController.getProductById);


module.exports = router;
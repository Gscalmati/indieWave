const express = require("express");
const router = express.Router();
const path = require("path");
const apiProductsController = require("../controllers/apiProductsController");



/*API products */
router.get("/products", apiProductsController.list);

router.get("/products/:id", apiProductsController.show);

module.exports = router;
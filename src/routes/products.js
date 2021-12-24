const express = require("express");
const router = express.Router();
const path = require("path");
const fs = require('fs');

/* Configuración de Multer  */
const multer = require("multer");
const storageProducts = multer.diskStorage({
    destination: (req, file, cb) => {
        if (!fs.existsSync(path.resolve(__dirname, `../../public/img/products/${req.body.game_name}-imgs`))) {
            fs.mkdirSync(path.resolve(__dirname, `../../public/img/products/${req.body.game_name}-imgs`));
        }
        cb(null, path.resolve(__dirname, `../../public/img/products/${req.body.game_name}-imgs`));
    },
    filename: (req, file, cb) => {
        let newFilename
        if (file.fieldname === "logo") {
            newFilename = "Logo" + req.body.game_name + Date.now() + path.extname(file.originalname)
        } else {
            newFilename = "Img" + req.body.game_name + Date.now() + path.extname(file.originalname)
        }
        cb(null, newFilename)
    }
})
const uploadProduct = multer({ storage: storageProducts });

const productsController = require("../controllers/productsController");

/* Middleware */
const authMiddleware = require("../middlewares/authMiddleware");
const authAdminMiddleware = require("../middlewares/authAdminMiddleware");

/* Lista de productos por categoría */
router.get("/", productsController.categories); //authAdMinddleware


/* CRUD */
router.get("/dashboard", authAdminMiddleware, productsController.dashboard);

/* Carrito */
router.get("/shoppingCart", authMiddleware, productsController.cart);

/* Vista editar producto */
router.get("/edit/:id", authAdminMiddleware, productsController.edit);

router.post("/", authAdminMiddleware, uploadProduct.fields([{ name: "logo" }, { name: "images" }]), productsController.store);

/*Actualizar producto */
router.put("/edit/:id", authAdminMiddleware, uploadProduct.fields([{ name: "logo" }, { name: "images" }]), productsController.update);

/* Vista crear Producto*/
router.get("/create", authAdminMiddleware, productsController.create);

/* Vista de resultado de búsqueda de productos */
router.get("/search", authMiddleware, productsController.search);

/* Detalle de producto*/
router.get("/:id", authMiddleware, productsController.detail);

/* Lista de productos de la categoría "category" */
router.get("/categories/:category", authMiddleware, productsController.categorygames);

/*Borrar producto */
router.delete('/dashboard/:id', authAdminMiddleware, productsController.delete);

module.exports = router;
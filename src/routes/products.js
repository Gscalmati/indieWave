const express = require("express");
const router = express.Router();
const path = require("path");
const fs = require('fs');

/* Configuración de Multer  */
const multer = require("multer");
const storageProducts = multer.diskStorage({
    destination: (req, file, cb) => {
        //if (file.extname == "jpg") ... si no, "enviar NEXT"
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
//Auth
const authMiddleware = require("../middlewares/authentication/authMiddleware");
const authAdminMiddleware = require("../middlewares/authentication/authAdminMiddleware");
//Validations
const productCreateValidation = require("../middlewares/validations/productCreateValidation");
const productEditValidation = require("../middlewares/validations/productEditValidation");

/* Lista de productos por categoría */
router.get("/", productsController.categories); //authAdMinddleware


/* CRUD */
router.get("/dashboard", authAdminMiddleware, productsController.dashboard);

/* Carrito */
router.get("/shoppingCart", authMiddleware, productsController.cart);
/* Agregar al carrito */
router.post("/shoppingCart", authMiddleware, productsController.addToCart);
/* Quitar articulo del carrito */
router.get("/shoppingCart/delete/:id", authMiddleware, productsController.deleteFromCart);

/* Vista editar producto */
router.get("/edit/:id", authAdminMiddleware,  productsController.edit);

/*Actualizar producto */
router.put("/edit/:id", authAdminMiddleware, uploadProduct.fields([{ name: "logo" }, { name: "images" }]), productEditValidation, productsController.update);

/* Vista crear Producto*/
router.get("/create", authAdminMiddleware, productsController.create);

/* Guardar producto */
router.post("/", authAdminMiddleware, uploadProduct.fields([{ name: "logo" }, { name: "images" }]), productCreateValidation, productsController.store);

/* Vista de resultado de búsqueda de productos */
router.get("/search", productsController.search);

/* Detalle de producto*/
router.get("/:id", productsController.detail);

/* Lista de productos de la categoría "category" */
router.get("/categories/:category", productsController.categorygames);

/*Borrar producto */
router.delete('/dashboard/:id', authAdminMiddleware, productsController.delete);




module.exports = router;
const express = require("express");
const router = express.Router();
const path = require("path");
const fs = require('fs');

/* Configuración de Multer  */
const multer = require("multer");
const storage = multer.diskStorage({
    destination : (req, file, cb) =>{               
        if (!fs.existsSync(path.resolve(__dirname, `../../public/img/${req.body.game_name}-imgs`))){
            fs.mkdirSync(path.resolve(__dirname, `../../public/img/${req.body.game_name}-imgs`));
        }
        cb(null, path.resolve(__dirname, `../../public/img/${req.body.game_name}-imgs`));
    },
    filename: (req, file, cb) => {
        let newFilename
        if (file.fieldname === "logo"){
            newFilename = "Logo" + req.body.game_name + Date.now() + path.extname(file.originalname)
        } else{
            newFilename = "Img"+ req.body.game_name + Date.now() + path.extname(file.originalname)
        }
        cb(null, newFilename )
    }
})
const upload = multer({storage});

const productsController = require("../controllers/productsController");


router.get("/", productsController.categories);
router.post("/", upload.fields([{name: "logo"},{name: "images"}]), productsController.store);

/* CRUD */
router.get("/dashboard", productsController.dashboard);

/* Carrito */
router.get("/shoppingCart", productsController.cart);

/* Editar producto */
router.get("/edit/:id", productsController.edit);

router.post("/edit", productsController.edit);
/*Actualizar producto */
router.put("/edit/:id", upload.fields([{name: "logo"},{name: "images"}]), productsController.update);
/* Crear Producto*/
router.get("/create", productsController.create);

/* Detalle de producto*/
router.get("/:id", productsController.detail);

router.get("/categories/:category", productsController.categorygames);
/*Borrar producto */
router.delete('/dashboard/:id', productsController.delete);

module.exports = router;
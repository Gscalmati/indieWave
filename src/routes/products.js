const express = require("express");
const router = express.Router();
const path = require("path");
const fs = require('fs');

/* Configuración de Multer  */
const multer = require("multer");
const storage = multer.diskStorage({
    destination : (req, file, cb) =>{
        console.log(req.body);
        if (!fs.existsSync(path.resolve(__dirname, `../../public/img/${req.body.productName}-imgs`))){
            fs.mkdirSync(path.resolve(__dirname, `../../public/img/${req.body.productName}-imgs`));
        }
        cb(null, path.resolve(__dirname, `../../public/img/${req.body.productName}-imgs`));
    },
    filename: (req, file, cb) => {
        let newFilename
        if (file.fieldname === "logo"){
            newFilename = "Logo" + req.body.productName + Date.now() + path.extname(file.originalname)
        } else{
            newFilename = "Img"+ req.body.productName + Date.now() + path.extname(file.originalname)
        }
        cb(null, newFilename )
    }
})
const upload = multer({storage});

const productsController = require("../controllers/productsController");

/* Middlewares req.body=vacio????*/
function makeDirectory (req, res, next){
    console.log(req.body)
    fs.mkdirSync(path.resolve(__dirname, `../../public/img/${req.body.productName}-imgs`));
    next();
}



router.get("/", productsController.categories);
router.post("/", upload.fields([{name: "logo"},{name: "image"}]), productsController.store);

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
const express = require("express");
const router = express.Router();
const path = require("path");
const fs = require('fs');

/* Configuración de Multer  */
const multer = require("multer");
const storageUsers = multer.diskStorage({
    destination : (req, file, cb) =>{              
        cb(null, path.resolve(__dirname, `../../public/img/users`));
    },
    filename: (req, file, cb) => {
        let newFilename = "prueba" + path.extname(file.originalname)
        cb(null, newFilename )
    }
})
const uploadUser = multer({storageUsers});
const usersController = require("../controllers/usersController");

/* Vista registro de usuarios */ 
router.get("/register", usersController.register);

/* Registrar Usuario */
router.post("/register",uploadUser.single("profile-pic") ,usersController.store);

/*Vista login*/
router.get("/login", usersController.login);

module.exports = router;
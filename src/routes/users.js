const express = require("express");
const router = express.Router();
const path = require("path");
const fs = require('fs');

/* Configuración de Multer  */
const multer = require("multer");
const storageUsers = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, path.resolve(__dirname, `../../public/img/users`));
    },
    filename: (req, file, cb) => {
<<<<<<< HEAD
        let newFilename = "prueba" + path.extname(file.originalname)
        cb(null, newFilename)
    }
})
const uploadUser = multer({ storageUsers });
=======
        let newFilename = req.body.email + path.extname(file.originalname)
        cb(null, newFilename )
    }
})
const uploadUser = multer({storage: storageUsers});

>>>>>>> 66d3941bd8fdcd9869e6e39577981df89e3aef20
const usersController = require("../controllers/usersController");

const loggedRoutesMiddleware = require("../middlewares/loggedRoutesMiddleware");


router.get("/register", loggedRoutesMiddleware, usersController.register);

router.get("/login", loggedRoutesMiddleware, usersController.login);

router.post("/login", usersController.logged);

router.get("/logout", usersController.logout);

module.exports = router;
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
        let newFilename = req.body.email + path.extname(file.originalname)
        cb(null, newFilename)
    }
})
const uploadUser = multer({ storage: storageUsers });

const usersController = require("../controllers/usersController");

const loggedRoutesMiddleware = require("../middlewares/loggedRoutesMiddleware");


router.get("/register", loggedRoutesMiddleware, usersController.register);

router.get("/login", loggedRoutesMiddleware, usersController.login);

router.post("/login", usersController.logged);

router.get("/logout", usersController.logout);

module.exports = router;
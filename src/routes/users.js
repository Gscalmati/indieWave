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

/* Middleware */
const loggedRoutesMiddleware = require("../middlewares/loggedRoutesMiddleware");
const guestRoutesMiddleware = require('../middlewares/guestRoutesMiddleware');
const userRegisterValidations = require('../middlewares/userRegisterValidations');
const authMiddleware = require('../middlewares/authMiddleware');


router.get("/register", guestRoutesMiddleware, usersController.register);

router.post("/register", loggedRoutesMiddleware, uploadUser.single("profile-pic"), userRegisterValidations, usersController.store);
/* Galicia routes */
router.get("/login", guestRoutesMiddleware, usersController.login);
router.post("/login", loggedRoutesMiddleware, usersController.logged);


router.get("/logout", usersController.logout);

router.get('/profile', authMiddleware, usersController.profile);

module.exports = router;
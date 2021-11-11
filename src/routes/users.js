const express = require("express");
const router = express.Router();

const usersController = require("../controllers/usersController");

const loggedMiddleware = require("../middlewares/loggedRoutesMiddleware");


router.get("/register", loggedMiddleware, usersController.register);

router.get("/login", loggedMiddleware, usersController.login);

router.post("/login", usersController.logged);

router.get("/logout", usersController.logout);

module.exports = router;
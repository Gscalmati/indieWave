const express = require('express');
const router = express.Router();

const mainController = require("../controllers/mainController");


router.get("/", mainController.home);

router.get("/home", mainController.homeAlt);

router.get("/home2", mainController.home2);

module.exports = router;

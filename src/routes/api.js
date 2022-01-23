const express = require('express');
const router = express.Router();

const mainController = require("../controllers/mainController");

/*Listado de usuarios */
router.get("/users", apiController.getUsers);

module.exports = router;
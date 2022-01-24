const express = require('express');
const router = express.Router();

const apiController = require("../controllers/apiController");

/*Listado de usuarios */
router.get("/users", apiController.getUsers);

/*Obtener usuario por id */
router.get("/users/:id", apiController.getUserById);

module.exports = router;
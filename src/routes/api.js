const express = require('express');
const router = express.Router();

const apiController = require("../controllers/apiController");

/*Listado de usuarios */
router.get("/users", apiController.getUsers);

module.exports = router;
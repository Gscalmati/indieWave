const express = require('express');
const router = express.Router();

const mainController = require("../controllers/mainController");


router.get("/", mainController.home);
router.get('/ip', async (req, res) => {
    const ip = await fetch('https://api.ipify.org?format=json').then(r => r.json());
    res.send(`IP pública detectada desde Render: ${ip.ip}`);
  });
router.get("/cordoba", mainController.cordoba);

module.exports = router;

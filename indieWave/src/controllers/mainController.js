const path = require('path');

let mainController = {
    home: (req,res) => {
        res.render("main/home");
    },
}

module.exports = mainController;
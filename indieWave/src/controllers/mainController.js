const path = require('path');

let mainController = {
    home: (req,res) => {
        res.render(path.resolve(__dirname, "main/home"));
    },
}

module.exports = mainController;
const path = require('path');

let mainController = {
    home: (req,res) => {
        res.render(path.resolve(__dirname, "home"));
    },
}

module.exports = mainController;
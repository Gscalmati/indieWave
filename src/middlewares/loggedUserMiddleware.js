let db = require("../../database/models");

module.exports = function loggedUserMiddleware(req, res, next) {
    //Se puede hacer un "async" adelante de la "function" directamente sin tener que usar la linea 8 y 27
    res.locals.loggedSession = false;

    (async function() {

        if (req.session.userLogged == undefined && (req.cookies != undefined && req.cookies.email != undefined)) {
            res.locals.loggedSession = true;

            res.locals.userLogged = await db.Users.findOne({
                where: {
                    email: req.cookies.email
                }
            })
        }

        if (req.session.userLogged) {

            res.locals.loggedSession = true;
            res.locals.userLogged = req.session.userLogged
        }

        next()
    })()
}
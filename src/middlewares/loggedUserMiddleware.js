let db = require("../../database/models");

module.exports = function loggedUserMiddleware(req, res, next) {
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
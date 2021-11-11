module.exports = function loggedUserMiddleware(req, res, next) {
    res.locals.loggedSession = false;
    if (req.session.userLogged) {
        res.locals.loggedSession = true;
        res.locals.userLogged = req.session.userLogged
    }
    next()
}
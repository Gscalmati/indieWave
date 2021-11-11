module.exports = function guestRoutesMiddleware(req, res, next) {
    if (!req.session.userLogged) {
        return res.redirect("/users/login");
    }
    next()
}
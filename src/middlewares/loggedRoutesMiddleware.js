module.exports = function loggedMiddleware(req, res, next) {
    if (req.session.userLogged != undefined) {
        return res.redirect("/products");
    }
    next()
}
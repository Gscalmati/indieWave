module.exports = function authAdminMiddleware(req, res, next) {
    if (req.session.userLogged == undefined || req.session.userLogged.admin === undefined) {
        return res.redirect("/");
    }
    next()
}
module.exports = function authAdminMiddleware(req, res, next) {
    if (!req.session.userLogged && req.body.admin ) { 
        return res.redirect("/products/dashboard");// redirect login o register
    }
    next()
}
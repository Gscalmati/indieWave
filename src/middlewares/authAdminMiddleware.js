module.exports = function guestRoutesMiddleware(req, res, next) {
    if (!req.session.userLogged ) { //&& req.body.email === fmblanco97@gmail.com &&
        return res.redirect("/users/login");// redirect login o register
    }
    next()
}
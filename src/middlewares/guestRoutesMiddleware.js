module.exports = function guestRoutesMiddleware(req, res, next) {
    if (req.session.userLogged) {
        return res.redirect("/users/profile");// Redirigir al perfil
    }
    next()
}
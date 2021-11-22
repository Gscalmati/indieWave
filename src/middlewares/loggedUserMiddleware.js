module.exports = function loggedUserMiddleware(req, res, next) {
    res.locals.loggedSession = false;

    /*if(req.cookies.usuario){
        buscar en BD con dato de la cookie y asignarle a req.session.userlogged
        Esto es para hacer un AUTOLOGIN
    }
    */
    if (req.session.userLogged) {
        res.locals.loggedSession = true;
        res.locals.userLogged = req.session.userLogged
    }
    next()
}
module.exports = function authAdminMiddleware(req, res, next) {
    console.log(req.session.userLogged );
    if(req.session.userLogged == undefined || req.session.userLogged.admin === undefined){
        return res.redirect("/");
    }
    next()
}
const path = require('path');
const db = require("../database/models");
const sequelize = require("sequelize");


let apiController = {

    getUsers: async (req, res) => {
        try {

            let userCount = await db.Users.count();
            let lastPage = Math.floor(userCount / 10);

            console.log("userCount : " + userCount)
            console.log("lastPage:" + lastPage)


            if (!(req.query.page == undefined || req.query.page == "" || isNaN(req.query.page))) {
                page = parseInt(req.query.page)
            } else {
                res.redirect("/api/users?page=0")
            }

            if (page > lastPage) {
                res.redirect(`/api/users?page=${lastPage}`)
            }

            let users = await db.Users.findAll({
                attributes: ["id", "email", "username"],
                order: [['id', 'ASC']],
                limit: 10,
                offset: page * 10,
            })

            console.log(req.query)
            console.log("page:" + page)

            res.json({
                prev: page > 0 ? `localhost:3000/api/users?page=${page - 1}` : null,
                count: userCount,
                users: users,
                next: page != lastPage ? `localhost:3000/api/users?page=${page + 1}` : null
            });
        }
        catch (error) {
            console.log(error)
        }
    },
    getUserById: async (req, res) => {
        try {
            let user = await db.Users.findByPk(req.params.id, options = { attributes: { exclude: ['password', 'admin'] } });
            res.json(user);
        }
        catch (error) {
            console.log(error)
        }
    }
}



module.exports = apiController;



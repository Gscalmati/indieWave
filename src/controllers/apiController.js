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


            if (!(req.query.page == undefined || req.query.page == "" || isNaN(req.query.page) || req.query.page < 0)) {
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
                raw: true
            })

            users.forEach(user => {
                user.detail = `localhost:3000/users/profile/${user.id}`
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
            user.profile_pic = `localhost:3000${user.profile_pic}`
            res.json(user);
        }
        catch (error) {
            console.log(error)
        }
    },

    
    /*product APIs */
    
    getProducts: async (req, res) => {
        try {
            let productCount = await db.Products.count();
            let lastPage = Math.floor(productCount / 10);


            if (!(req.query.page == undefined || req.query.page == "" || isNaN(req.query.page) || req.query.page < 0)) {
                page = parseInt(req.query.page)
            } else {
                res.redirect("/api/products?page=0")
            }

            if (page > lastPage) {
                res.redirect(`/api/products?page=${lastPage}`)
            }

            let products = await db.Products.findAll( {
                attributes: ['id', 'name', 'description','genre_id'],
                order: [['id', 'ASC']],
                limit: 10, //no toma limit 10
                offset: page * 10,
                raw: true });
            
            let productsImages = await db.Images.findAll( {
                include : ["products"],
                limit:10
            });
            
            let productsByGenre = {}
            let genres = await db.Genres.findAll();
            genres.forEach(genre => {
                let count = 0;
                products.forEach(element => {
                    if(element.genre_id == genre.id ){
                        count ++
                    }   
                });
                productsByGenre[genre.name] = count
             });


            
            products = await db.Products.findAll( {attributes: ['id', 'name', 'description'], raw : true });
            products.forEach(product =>{
                product["detail"] = `localhost:3000/products/${product.id}`
            })
            

            res.json({
                prev: page > 0 ? `localhost:3000/api/products?page=${page - 1}` : null,
                count: productCount,
                data:products,
                images: productsImages,
                countByGenre:productsByGenre,
                next: page != lastPage ? `localhost:3000/api/products?page=${page + 1}` : null
            })
        }
        catch (error) {
           console.log(error)
        }
    },


    getProductById:  async (req, res) => {
        try {
            /*Detalle de un producto */
            let product = await db.Products.findByPk(req.params.id);

            /*un array de uno a muchos */
            //,options = { attributes: { exclude: ['id', 'name','developer','email', 'release_date','price','logo','min_requirements','rec_requirements','description'] } }
            let productImages = await db.Products.findByPk(req.params.id, {include: [{ association: "images" }]});
            
            /*URL del logo */
            /*Se imprime la URL en la api pero no encuentra la ruta*/
            console.log(product.logo);
            let productUrl = `localhost:3000/public${product.logo}`
            
            res.json({
                data:productImages,
                url: productUrl
            })
        }
        catch (error) {
            console.log(error)
        }
    }
}

module.exports = apiController;



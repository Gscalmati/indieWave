const path = require("path");
const fs = require("fs");

//Requiere la base de datos
const db = require("../../database/models")

let jsonProducts = fs.readFileSync(path.resolve(__dirname, '../data/products.json'), 'utf-8');
let products = JSON.parse(jsonProducts);

/*
// Función para conseguir el nuevo ID 
const newId = function () {
    let idNum = 0;
    products.forEach(product => {
        if (product.id > idNum) {
            idNum = product.id
        }
    })
    return idNum + 1;
}
*/

productsController = {
    categories: function (req, res) {
        /*Creo un array por cada género*/
        let arcade = products.filter((game) => game.genre == "arcade")
        let action = products.filter((game) => game.genre == "action")
        let sports = products.filter((game) => game.genre == "sports")
        let strategy = products.filter((game) => game.genre == "strategy")
        let adventure = products.filter((game) => game.genre == "adventure")

        res.render("products/categories", { arcade, action, sports, strategy, adventure });
    },

    categorygames: function (req, res) {
        let category = req.params.category;

        let categoryGames = products.filter((game) => game.genre == category)

        let title = ""
        switch (category) {
            case "arcade":
                title = "Arcade";
                break;
            case "action":
                title = "Acción"
                break;
            case "strategy":
                title = "Estrategia"
                break;
            case "adventure":
                title = "Aventura"
                break;
            case "sports":
                title = "Deportes"
                break;

        }
        res.render("products/categoryGames", { categoryGames, category, title });
    },
    detail: function (req, res) {
        db.Products.findByPk(req.params.id, {
            include: [{ association: "genres" }, { association: "images" }, { association: "platforms" }]
        })
            .then(function (product) {
                res.render("products/productDetail", { product: product })
            })
    },

    delete: function (req, res) {

        db.Products.destroy({
            where: {
                id: req.params.id
            }
        })
        res.redirect('/products/dashboard');
    },

    list: function (req, res) {
        db.Products.findAll({
            include: [{ association: "genres" }]
        })
            .then(function (products) {
                res.render("products/categoryGames", { products: products })
            })
    },

    dashboard: function (req, res) {

        (async () => {
            
            let productsDb = await db.Products.findAll({include: [{association: "genre"}]});
            res.render("products/dashboard", { products: productsDb })
            
        })()

    },

    cart: function (req, res) {
        res.render("products/shoppingCart");
    },

    edit: function (req, res) {
        let productoEdit = products.find(product => {
            return (product.id == req.params.id)
        })
        res.render("products/productEdit", { producto: productoEdit });
    },

    create: function (req, res) {
        res.render("products/productCreate")
    },

    store: function (req, res) {

        let imagesArray = [];

        if (req.files["images"]) {
            req.files["images"].forEach((image) => {
                imagesArray.push(`/img/products/${req.body.game_name}-imgs/${image.filename}`)
            })
        }


        //let date = req.body.release_date.split("-").reverse(); <---- ¿Qué corno hacía esto?

        (async () => {

            /*Busco el id del género al que pertenece el producto*/

            let genre = await db.Genres.findOne({
                where: { name: req.body.genre }
            });

            /*Creo una entrada en la tabla de productos*/

            let newProduct = await db.Products.create({
                name: req.body.game_name,
                developer: req.body.developer,
                email: req.body.email,
                release_date: req.body.release_date,
                price: req.body.price,
                logo: req.files["logo"] != undefined ? `/img/products/${req.body.game_name}-imgs/${req.files["logo"][0].filename}` : undefined,
                min_requirements: req.body.min_requirements,
                rec_requirements: req.body.rec_requirements,
                description: req.body.description,
                genre_id: genre.id,
            })

            /*Creo una entrada en la tabla de imágenes por cada imagen*/
            if (imagesArray.length != 0) {
                for (image of imagesArray) {
                    await db.Images.create({
                        product_id: newProduct.id,
                        image: image,
                    })
                };
            }

            /*Creo una entrada en la tabla product_platform por cada plataforma*/
            if (req.body.linux) {
                await db.Products_platforms.create({
                    product_id: newProduct.id,
                    platform_id: 1,
                })
            };
            if (req.body.macos) {
                await db.Products_platforms.create({
                    product_id: newProduct.id,
                    platform_id: 2,
                })
            };
            if (req.body.windows) {
                await db.Products_platforms.create({
                    product_id: newProduct.id,
                    platform_id: 3,
                })
            };

        })()


        res.redirect("/products/dashboard");
    },

    editArt: function (req, res) {
        res.send("Artículo editado")
    },
    update(req, res) {

        let imagesArray = [];

        if (req.files["images"]) {
            req.files["images"].forEach((image) => {
                imagesArray.push(`/img/products/${req.body.game_name}-imgs/${image.filename}`)
            })
        }


        (async () => {

            /*Busco el id del género al que pertenece el producto*/

            let genre = await db.Genres.findOne({
                where: { name: req.body.genre }
            });

            //Editos campos del producto
            await db.Products.update({
                name: req.body.game_name,
                developer: req.body.developer,
                email: req.body.email,
                release_date: req.body.release_date,
                price: req.body.price,
                logo: req.files["logo"] != undefined ? `/img/products/${req.body.game_name}-imgs/${req.files["logo"][0].filename}` : undefined,
                min_requirements: req.body.min_requirements,
                rec_requirements: req.body.rec_requirements,
                description: req.body.description,
                genre_id: genre.id,
            },
                { where: { id: req.params.id } });

            //Borro todas las entradas del producto en Product_platforms y las vulevo a definir según lo ingresado por el usuario al editar
            await db.Products_platforms.destroy({ where: { product_id: req.params.id } });

            if (req.body.linux) {
                await db.Products_platforms.create({
                    product_id: req.params.id,
                    platform_id: 1,
                })
            };
            if (req.body.macos) {
                await db.Products_platforms.create({
                    product_id: req.params.id,
                    platform_id: 2,
                })
            };
            if (req.body.windows) {
                await db.Products_platforms.create({
                    product_id: req.params.id,
                    platform_id: 3,
                })
            };

            /*Creo una entrada en la tabla de imágenes por cada imagen nueva (por ahora, no borramos las viejas)*/
            if (imagesArray.length != 0) {
                for (image of imagesArray) {
                    await db.Images.create({
                        product_id: newProduct.id,
                        image: image,
                    })
                };
            }
        })()

        products.forEach(producto => {
            if (producto.id == req.params.id) {
                producto.game_name = req.body.game_name
                producto.developer = req.body.developer
                producto.genre = req.body.genre
                producto.email = req.body.email
                if (req.body.release_date) {
                    let date = req.body.release_date.split("-").reverse().join("-");
                    producto.release_date = date;
                };
                producto.platform = [];
                if (req.body.windows) {
                    producto.platform.push("Windows")
                };
                if (req.body.macos) {
                    producto.platform.push("macOS")
                };
                if (req.body.linux) {
                    producto.platform.push("Linux")
                };
                producto.price = req.body.price
                // Reviso si se subieron nuevas imágenes al editar
                if (req.files["logo"] != undefined) {
                    producto.logo = `/img/${req.body.game_name}-imgs/${req.files["logo"][0].filename}`
                }
                if (req.files['images'] != undefined) {
                    let imagesArray = [];
                    req.files["images"].forEach((image) => {
                        imagesArray.push(`/img/${req.body.game_name}-imgs/${image.filename}`)
                    })
                    producto.images = imagesArray
                }
                producto.min_requirements = req.body.min_requirements
                producto.rec_requirements = req.body.rec_requirements
                producto.description = req.body.description
            }
        })

        // Pasamos a json todos los productos y sobreescribimos la db
        let jsonDeProductos = JSON.stringify(products, null, 4);
        fs.writeFileSync(path.resolve(__dirname, '../data/products.json'), jsonDeProductos);

        res.redirect('/products/dashboard');

    }

}

module.exports = productsController;
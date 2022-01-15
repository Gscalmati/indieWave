const path = require("path");
const fs = require("fs");
const sequelize = require("sequelize");

//Requiere la base de datos
const db = require("../database/models");
const { validationResult } = require("express-validator");
const { log } = require("console");

//Creo un objeto de referencia para las categorías
//TODO

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

        (async () => {
            try {
                /* Obtengo todos los géneros definidos en la base de datos */
                let genres = await db.Genres.findAll();

                /* Creo un array de arrays donde el primer elemento es el nombre del género y los siguientes son los productos pertenecientes a ese género */
                let productsByGenre = [];
                for (genre of genres) {
                    let genreData = []
                    let products = await db.Products.findAll({ include: [{ association: "genre", where: { name: genre.name } }] });
                    genreData.push(genre.name);
                    for (product of products) {
                        genreData.push(product);
                    }
                    productsByGenre.push(genreData);
                }
                res.render("products/categories", { productsByGenre });
            } catch (error) {
                console.log(error)
            }
        })()
        
    },

    categorygames: function (req, res) {
        (async () => {
            try {
                let categoryGames = await db.Products.findAll({ include: [{ association: "genre", where: { name: req.params.category } }] });
                res.render("products/categoryGames", { categoryGames, category: req.params.category });
            } catch (error) {
                console.log(error)
            }
        })()
    },

    detail: function (req, res) {
        (async () => {
            try {
                let product = await db.Products.findByPk(req.params.id, {
                    include: [{ association: "genre" }, { association: "platforms" }]
                });

                let productPlatforms = [];
                for (platform of product.platforms) {
                    productPlatforms.push(platform.name);
                }

                /* Limito la búsqueda a 5 imágenes por ahora */
                let productImages = []
                let images = await db.Images.findAll({ limit: 5, where: { product_id: product.id } });
                for (image of images) {
                    productImages.push(image.image);
                }

                res.render("products/productDetail", { product, productPlatforms, productImages });

            } catch (error) {
                console.log(error)
            }
        })()
    },

    delete: function (req, res) {
        // Destruyo las relaciones en las plataformas tambien
        try {
            db.Products_platforms.destroy({
                where: {
                    product_id : req.params.id
                }
            })


            db.Products.destroy({
                where: {
                    id: req.params.id
                }
            })
            res.redirect('/products/dashboard');
        } catch (error) {
            console.log(error)
        }
    },


    /*Este método no se ejecuta nunca

    list: function (req, res) {
        db.Products.findAll({
            include: [{ association: "genre" }]
        })
            .then(function (products) {
                res.render("products/categoryGames", { products: products })
            })
    },

    */

    dashboard: function (req, res) {

        (async () => {
            try {
                let productsDb = await db.Products.findAll({ include: [{ association: "genre" }] });
                res.render("products/dashboard", { products: productsDb })
            } catch (error) {
                console.log(error)
            }

        })()

    },

    cart: function (req, res) {
        res.render("products/shoppingCart");
    },

    edit: function (req, res) {
        (async () => {
            try {

                /* Busco el producto a editar */
                let productToEdit = await db.Products.findByPk(req.params.id, {
                    include: [{ association: "genre" }, { association: "platforms" }]
                });

                /* Por comodidad, me guardo las plataformas del producto */
                let productPlatforms = [];
                for (platform of productToEdit.platforms) {
                    productPlatforms.push(platform.name);
                }
                res.render("products/productEdit", { product: productToEdit, productPlatforms });
            } catch (error) {
                console.log(error)
            }
        })()

    },

    create: function (req, res) {
        res.render("products/productCreate")
    },

    store: function (req, res) {
        let errors = validationResult(req);
        if(errors.isEmpty()){

        
        let imagesArray = [];

        if (req.files["images"]) {
            req.files["images"].forEach((image) => {
                imagesArray.push(`/img/products/${req.body.game_name}-imgs/${image.filename}`)
            })
        }


        //let date = req.body.release_date.split("-").reverse(); <---- ¿Qué corno hacía esto?

        (async () => {
            try {

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
            } catch (error) {
                console.log(error)
            }

        })()

    
        res.redirect("/products/dashboard");
        }else{
            console.log(errors)
            if (req.files){
                if(req.files.logo != undefined){
                    req.files.logo.forEach(image => {
                        fs.unlink(image.path, (err => {
                            if (err) console.log(err);
                                else {
                                      console.log("Deleted logo")
                                }
                        }))
                    })
                }
            }
            // URIQUESTIONS Se crea carpeta igual, buscar forma de borrar carpeta
            if ((req.body.windows == undefined) && (req.body.macos == undefined) && (req.body.linux == undefined)){
                errors.errors.push({param: "checkbox", msg: "Ingrese al menos una plataforma"});
                console.log("No se seleccionó nada")
            }
            res.render('products/productCreate', { errors: errors.mapped(), old: req.body })
        }
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

            try {

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

                res.redirect('/products/dashboard');
            } catch (error) {
                console.log(error)
            }
        })()
    },

    search: function (req, res) {
        (async () => {
            try {
                let query = req.query.query;
                /* Busco productos cuyo nombre incluya la búsqueda del usuario*/
                let products = await db.Products.findAll({ include: [{ association: "genre"}], order: [['name', 'ASC']], where: { name : sequelize.where(sequelize.fn('LOWER', sequelize.col('Products.name')), 'LIKE', `%${query}%`) } } );
                if (products.length > 0) {
                    res.render("products/searchResults", { products, notfound: false });
                } else {
                    res.render("products/searchResults", { notfound: true })
                }
            } catch (error) {
                console.log(error)
            }
        })()
    }

}

module.exports = productsController;
const path = require("path");
const fs = require("fs");
const sequelize = require("sequelize");

//Requiere la base de datos
const db = require("../database/models");
const { validationResult } = require("express-validator");
const { log } = require("console");
const { config } = require("process");

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

                if (req.query.repeated){
                    res.render("products/productDetail", { product, productPlatforms, productImages, repeated: true });
                } else {
                    res.render("products/productDetail", { product, productPlatforms, productImages });
                }

            } catch (error) {
                console.log(error)
            }
        })()
    },

    delete: async function (req, res) {
        // Destruyo las relaciones en las plataformas tambien
        try {
            await db.Products_platforms.destroy({
                where: {
                    product_id: req.params.id
                }
            })


            await db.Shopping_products.destroy({
                where: {
                    product_id: req.params.id
                }
            })

            await db.Images.destroy({
                where: {
                    product_id: req.params.id
                }
            })

            await db.Products.destroy({
                where: {
                    id: req.params.id
                }
            })
            res.redirect('/products/dashboard?deleted=true');
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
                if (req.query.updated) {
                    res.render("products/dashboard", { products: productsDb, updatedProduct: true })
                } else if (req.query.deleted) {
                    res.render("products/dashboard", { products: productsDb, deletedProduct: true })
                } else if (req.query.created) {
                    res.render("products/dashboard", { products: productsDb, createdProduct: true })
                } else {
                    res.render("products/dashboard", { products: productsDb })
                }
            } catch (error) {
                console.log(error)
            }

        })()

    },

    cart: function (req, res) {
        (async () => {
            try {

                //Traigo el carrito con los productos asociados del usuario loggeado
                let comprasUser = await db.Shoppingcarts.findAll({
                    include: [{ association: "products" }],
                    where: { user_id: req.session.userLogged.id }, raw: true, nest: true
                })

                let total = 0

                for (compra of comprasUser) {
                    
                    total += parseInt(compra.products.price);
                }
                res.render("products/shoppingCart", { comprasUser: comprasUser, total: total });
            }
            catch (error) {
                console.log(error)
            }
        })()

        /*VERSION FRONT
        if(sessionStorage != undefined){
            console.log(sessionStorage)
        } else {
            console.log("No hay carrito")
        }*/
    },

    addToCart: function (req, res) {
        (async () => {

            try {
                //Encontrar el ID del carrito en base al usuario loggeado
                let sessionCart = await db.Shoppingcarts.findOne({
                    where: {
                        user_id: req.session.userLogged.id
                    }, raw: true
                })
                let idCart = sessionCart.id
                // Extraigo productos agregados por el usuario Loggeado
                let repe = await db.Shopping_products.findAll({
                    shopping_cart_id: idCart,
                    //product_id: req.body.cartValue,
                    raw: true
                })


                // Reviso si ya existe ese articulo en el carrito
                let artRepeated = repe.find(elem => {

                    return (elem.product_id == req.body.cartValue)
                })

                // Si existe, no hace el "create" y redirecciona al mismo articulo
                if (artRepeated != undefined) {
                    return res.redirect(`/products/${req.body.cartValue}?repeated=true`)
                } else {
                    //Agregar al carrito con el ID del carrito
                    await db.Shopping_products.create({
                        shopping_cart_id: idCart,
                        product_id: req.body.cartValue
                    })
                    return res.redirect("/products/shoppingCart")
                }
                /*// Intente cambiar el nombre del NAME en el HTML y se rompe
                console.log(req.body.cartValue)
                let productFound = await db.Products.findByPk(req.body.cartValue, {raw:true});
                console.log(productFound)
                return res.render("products/shoppingCart", {productFound : productFound})*/
            }
            catch (error) {
                console.log(error)
            }
        })()
    },

    deleteFromCart: function (req, res) {
        (async () => {
            try {

                //Encontrar el ID del carrito en base al usuario loggeado
                let sessionCart = await db.Shoppingcarts.findOne({
                    where: {
                        user_id: req.session.userLogged.id
                    }, raw: true
                })
                let idCart = sessionCart.id

                await db.Shopping_products.destroy({
                    where: {
                        shopping_cart_id: idCart,
                        product_id: req.params.id
                    }
                })

                return res.redirect("/products/shoppingCart")
            }
            catch (error) {
                console.log(error)
            }
        })()
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

        if ((req.body.windows == undefined) && (req.body.macos == undefined) && (req.body.linux == undefined)) {
            errors.errors.push({ param: "checkbox", msg: "Ingrese al menos una plataforma" });

        }
        if (errors.isEmpty()) {


            let imagesArray = [];
            
            if (req.files["images"]) {
                req.files["images"].forEach((image) => {
                    imagesArray.push(`/img/products/${req.body.game_name.replace(/\s/g, '')}-imgs/${image.filename}`)
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
                        logo: req.files["logo"] != undefined ? `/img/products/${req.body.game_name.replace(/\s/g, '')}-imgs/${req.files["logo"][0].filename}` : undefined,
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


            res.redirect("/products/dashboard?created=true");
        } else {
            console.log(errors)
            if (req.files) {
                if (req.files.logo != undefined) {
                    req.files.logo.forEach(image => {
                        fs.unlink(image.path, (err => {
                            if (err) console.log(err);
                        }))
                    })
                }
            }
            console.log(req.body)
            // URIQUESTIONS Se crea carpeta igual, buscar forma de borrar carpeta

            res.render('products/productCreate', { errors: errors.mapped(), old: req.body })
        }
    },

    update: async (req, res) => {
        try {

            let errors = validationResult(req);

            if ((req.body.windows == undefined) && (req.body.macos == undefined) && (req.body.linux == undefined)) {
                errors.errors.push({ param: "checkbox", msg: "Ingrese al menos una plataforma" });

            }

            if (errors.isEmpty()) {

                let imagesArray = [];

                if (req.files["images"]) {
                    req.files["images"].forEach((image) => {
                        imagesArray.push(`/img/products/${req.body.game_name}-imgs/${image.filename}`)
                    })
                }


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
                            product_id: req.params.id,
                            image: image,
                        })
                    };
                }
                res.redirect('/products/dashboard?updated=true');

            } else {

                /* Busco el producto a editar */
                let productToEdit = await db.Products.findByPk(req.params.id, {
                    include: [{ association: "genre" }, { association: "platforms" }]
                });

                /* Por comodidad, me guardo las plataformas del producto */
                let productPlatforms = [];
                for (platform of productToEdit.platforms) {
                    productPlatforms.push(platform.name);
                }

                if (req.files) {
                    if (req.files.logo != undefined) {
                        req.files.logo.forEach(image => {
                            fs.unlink(image.path, (err => {
                                if (err) console.log(err);
                            }))
                        })
                    }
                }
                // URIQUESTIONS Se crea carpeta igual, buscar forma de borrar carpeta

                res.render('products/productEdit', { product: productToEdit, productPlatforms, errors: errors.mapped(), old: req.body })
            }
        } catch (error) {
            console.log(error)
        }
    },

    search: function (req, res) {
        (async () => {
            try {
                let query = req.query.query;
                /* Busco productos cuyo nombre incluya la búsqueda del usuario*/
                let products = await db.Products.findAll({ include: [{ association: "genre" }], order: [['name', 'ASC']], where: { name: sequelize.where(sequelize.fn('LOWER', sequelize.col('Products.name')), 'LIKE', `%${query}%`) } });
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
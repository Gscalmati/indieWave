const path = require("path");
const fs = require("fs");

let jsonProducts = fs.readFileSync(path.resolve(__dirname, '../data/products.json'), 'utf-8');
let products = JSON.parse(jsonProducts); //Convertimos el json a array

/* Función para conseguir el nuevo ID */
const newId = function () {
    let idNum = 0;
    products.forEach(product => {
        if (product.id > idNum) {
            idNum = product.id
        }
    })
    return idNum + 1;
}


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
        let detallado = products.find(product => {
            return (product.id == req.params.id);
        })

        let category = ""
        switch (detallado.genre) {
            case "arcade":
                category = "Arcade";
                break;
            case "action":
                category = "Acción"
                break;
            case "strategy":
                category = "Estrategia"
                break;
            case "adventure":
                category = "Aventura"
                break;
            case "sports":
                category = "Deportes"
                break;
        }
        res.render("products/productDetail", { detallado: detallado, category: category });
        /* No imprime en el EJS */
    },

    dashboard: function (req, res) {
        res.render("products/dashboard", { products })
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

        let imagesArray = []

        req.files["images"].forEach((image) => {
            imagesArray.push(`/img/${req.body.game_name}-imgs/${image.filename}`)
        })

        let newProduct = {
            id: newId(),
            game_name: req.body.game_name,
            developer: req.body.developer,
            genre: req.body.genre,
            email: req.body.email,
            release_date: req.body.release_date,
            platform: [],
            price: req.body.price,
            logo: `/img/${req.body.game_name}-imgs/${req.files["logo"][0].filename}`,
            images: imagesArray,
            min_requirements: req.body.min_requirements,
            rec_requirements: req.body.rec_requirements,
            description: req.body.description
        }
        /* Array de Plataformas */
        if (req.body.windows) {
            newProduct.platform.push("Windows")
        };
        if (req.body.macos) {
            newProduct.platform.push("macOS")
        };
        if (req.body.linux) {
            newProduct.platform.push("Linux")
        };

        products.push(newProduct);
        let jsonNuevo = JSON.stringify(products);

        fs.writeFileSync(path.resolve(__dirname, '../data/products.json'), jsonNuevo)

        res.redirect("/products");
    },

    editArt: function (req, res) {
        res.send("Artículo editado")
    },
    update(req, res) {

        // Reviso si se subieron nuevas imágenes al editar
        let imagesArray = []
        if (req.files['images'] != undefined) {
            req.files["images"].forEach((image) => {
                imagesArray.push(image.filename)
            })
        }

        let logo;
        if (req.files["logo"] != undefined) {
            logo = req.files["logo"][0].filename
        }

        // Editamos el producto buscandolo con una condición
        products.forEach(producto => {
            if (producto.id == req.params.id) {
                producto.game_name = req.body.game_name
                producto.developer = req.body.developer
                producto.genre = req.body.genre
                producto.email = req.body.email
                producto.release_date = req.body.release_date
                producto.platform = []
                producto.price = req.body.price
                producto.logo = logo
                producto.images = imagesArray
                producto.min_requirements = req.body.min_requirements
                producto.rec_requirements = req.body.rec_requirements
                producto.description = req.body.description
            }
        })

        // Pasamos a json todos los productos y sobreescribimos la db
        let jsonDeProductos = JSON.stringify(products, null, 4);
        fs.writeFileSync(path.resolve(__dirname, '../data/products.json'), jsonDeProductos);

        res.redirect('/products/dashboard');
    },
    delete (req, res) {

        let productosRestantes = products.filter(producto => {
            return producto.id != req.params.id;
        })

        let jsonDeProductos = JSON.stringify(productosRestantes, null, 4);
        fs.writeFileSync(path.resolve(__dirname, '../data/products.json'), jsonDeProductos);
        
        res.redirect('/products/dashboard');
    }
}

module.exports = productsController;
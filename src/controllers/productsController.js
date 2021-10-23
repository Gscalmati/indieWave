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

console.log(newId());


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
        let detallado = products.filter(product => {
            return (product.id == req.params.id);
        })

        res.render("products/productDetail", { detallado: detallado[0] });
        /* No imprime en el EJS */
    },

    dashboard: function (req, res) {
        res.render("products/dashboard", {products})
    },

    cart: function (req, res) {
        res.render("products/shoppingCart");
    },

    edit: function (req, res) {
        let productoEdit = products.filter(product =>{
            return (product.id == req.params.id)
        })
        console.log(productoEdit)
        res.render("products/productEdit", {producto: productoEdit[0]});
    },
    
    create: function (req, res) {
        res.render("products/productCreate")
    },

    store: function (req, res) {
        let newProduct = {
            id: newId(),
            game_name: req.body.productName,
            developer: req.body.dev,
            genre: req.body.categoria,
            email: req.body.email,
            release_date: req.body.date,
            platform: [],
            price: req.body.price,
            images: req.body.image,
            min_requirements: req.body.requerimentMin,
            rec_requirements: req.body.requeriment,
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
    }
}

module.exports = productsController;
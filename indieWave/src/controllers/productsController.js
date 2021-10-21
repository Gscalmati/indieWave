const path = require("path");
const fs = require("fs");

/*const { privateDecrypt } = require("crypto");
const { json } = require("stream/consumers");
*/

let jsonProducts = fs.readFileSync(path.resolve(__dirname, '../data/products.json'), 'utf-8');
let products = JSON.parse(jsonProducts); //Convertimos el json a array

/* Función para conseguir el nuevo ID */
const newId = function(){
    let idNum = 0;
    products.forEach(product => {
        if (product.id > idNum) {
            idNum=product.id
        }
    })
    return idNum+1;
}

console.log(newId());


productsController = {
    categories: function (req, res){
        res.render("products/categories"); 
    },
    categorygames: function (req, res){
        let category = req.params.category;

        /* Me guarto el array de esa categoria 
        
        let categoryGames = json[category]
        
        */

        res.render("products/categoryGames", /*el array con los juegos de esa categoria*/); 
    },

    detail: function (req, res){
        let detallado = products.filter(product =>{
            return (product.id == req.params.id);
        }) 
        
        res.render("products/productDetail", {detallado: detallado[0]});
        /* No imprime en el EJS */
    },

    cart: function(req, res){
        res.render("products/shoppingCart");
    },
    edit: function(req, res){
        res.render("products/productEdit");
    },
    create: function(req, res){
        res.render("products/productCreate")
    },

    store: function(req, res){
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
            newProduct.platform.push("windows")
        };
        if (req.body.macos) {
            newProduct.platform.push("macos")
        };
        if (req.body.linux) {
            newProduct.platform.push("linux")
        };

        products.push(newProduct);
        let jsonNuevo = JSON.stringify(products);

        fs.writeFileSync(path.resolve(__dirname, '../data/products.json'), jsonNuevo)

        res.redirect("/products");
    },

    editArt: function(req, res){
        res.send("Artículo editado")
    }
}

module.exports = productsController;
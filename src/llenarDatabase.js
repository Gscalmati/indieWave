let db = require("../database/models");

(async() => {
    let products = await db.Products.findAll();

    let genres = await db.Genres.findAll();

    console.log("Productos");
    console.log(products);
    console.log("Generos");
    console.log(genres);



})()
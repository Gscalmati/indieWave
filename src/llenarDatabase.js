let db = require("../database/models");

(async() => {
    let products = await db.Products.findAll({ raw: true });

    for (product of products) {
        await db.Products_platforms.create({
            product_id: product.id,
            platform_id: 1
        })
    }




})()
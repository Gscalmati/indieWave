module.exports= (sequelize, dataTypes) => {
    let alias = "Shopping_products";
    let cols = {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey:true,
            allowNull: false
        },
        shopping_cart_id:{
            type: dataTypes.INTEGER.UNSIGNED,
            //FK shopping_cart_id --> shopping_product referencia a la tabla shoppingcart
        },
        product_id:{
            type: dataTypes.INTEGER.UNSIGNED,
            //FK product_id --> shopping_product referencia a la tabla products
        }
    };
    let config = {
        tableName: "shopping_products",
        timestamps:false
    }

    const Shopping_product= sequelize.define(alias,cols, config);

    return Shopping_product;
}
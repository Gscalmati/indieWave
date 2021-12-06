module.exports= (sequelize, dataTypes) => {
    let alias = "Users_products";
    let cols = {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            primaryKey:true,
            allowNull: false,
            autoIncrement:true
        },
        product_id:{
            type: dataTypes.INTEGER.UNSIGNED,
            //FK product_id --> user_product referencia a la tabla products
        },
        user_id:{
            type: dataTypes.INTEGER.UNSIGNED,
            //FK user_id --> user_product referencia a la tabla users
        }
    };
    let config = {
        tableName: "users_products",
        timesTamps:false
    }

    const User_product= sequelize.define(alias,cols, config);

    return User_product;
}
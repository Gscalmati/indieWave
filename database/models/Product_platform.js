module.exports= (sequelize, dataTypes) => {
    let alias = "Products_platforms";
    let cols = {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey:true,
            allowNull: false
        },
        product_id:{
            type: dataTypes.INTEGER,
            allowNull: false
            //FK product_id --> Product_platform referencia a la tabla products
        },
        platform_id:{
            type: dataTypes.INTEGER,
            allowNull: false
            //FK platform_id --> Product_platform referencia a la tabla platforms
        }
    };
    let config = {
        tableName: "products_platforms",
        timestamps:false
    }

    const Product_platform= sequelize.define(alias,cols, config);

    return Product_platform;
}
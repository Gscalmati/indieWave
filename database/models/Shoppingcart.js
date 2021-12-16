module.exports = (sequelize, dataTypes) => {
    let alias = "Shoppingcarts";
    let cols = {
        id: {
            type: dataTypes.INTEGER.UNSIGNED,
            primaryKey: true,
            allowNull: false,
            autoIncrement: true
        },
        user_id: {
            type: dataTypes.INTEGER.UNSIGNED,
            unique: true,
            fields: ['user_id']
        }
    };
    let config = {
        tableName: "shoppingcart",
        timestamps: false
    }

    let Shoppingcart = sequelize.define(alias, cols, config);

    /*Shoppingcart.associate = function(models) {
        Shoppingcart.belongsTo(models.Users, {
            as: "users",
            foreignKey: "user_id"
        });
        Shoppingcart.belongsToMany(models.Products, {
            as: "products",
            through: "shopping_products",
            foreignKey: "shopping_cart_id",
            otherKey: "product_id",
            timestamps: false
        })
    }*/

    return Shoppingcart;
}
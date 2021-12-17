module.exports = (sequelize, dataTypes) => {
    let alias = "Products";
    let cols = {
        id: {
            type: dataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey: true,
            allowNull: false
        },
        name: {
            type: dataTypes.STRING,
            allowNull: false
        },
        developer: {
            type: dataTypes.STRING,
            allowNull: false
        },
        email: {
            type: dataTypes.STRING,
            unique: true,
            fields: ['email'],
            allowNull: true,
            defaultValue: null
        },
        release_date: {
            type: dataTypes.DATE,
            allowNull: false
        },
        price: {
            type: dataTypes.INTEGER.UNSIGNED,
            allowNull: false
        },
        logo: {
            type: dataTypes.STRING,
            allowNull: true,
            defaultValue: null
        },
        min_requirements: {
            type: dataTypes.TEXT,
            allowNull: false
        },
        rec_requirements: {
            type: dataTypes.TEXT,
            allowNull: false
        },
        description: {
            type: dataTypes.TEXT,
            allowNull: false
        },
        genre_id: {
            type: dataTypes.INTEGER.UNSIGNED,
            allowNull: false
                //FK genre_id --> product referencia a la tabla genres
        }
    };
    let config = {
        tableName: "products",
        timestamps: false
    }

    const Product = sequelize.define(alias, cols, config);

    Product.associate = function(models) {
        Product.belongsTo(models.Genres, {
            as: "genre",
            foreignKey: "genre_id"
        });
        Product.hasMany(models.Images, {
            as: "images",
            foreignKey: "product_id"
        });
        Product.belongsToMany(models.Platforms, {
            as: "platforms",
            through: "products_platforms",
            foreignKey: "product_id",
            otherKey: "platform_id",
            timestamps: false
        });
        Product.belongsToMany(models.Shoppingcarts, {
            as: "shoppingcart",
            through: "shopping_products", //shopping_product?
            foreignKey: "product_id",
            otherKey: "shopping_cart_id",
            timestamps: false
        });
        Product.belongsToMany(models.Users, {
            as: "users",
            through: "users_products",
            foreignKey: "product_id",
            otherKey: "user_id",
            timestamps: false
        })
    }

    return Product;
}
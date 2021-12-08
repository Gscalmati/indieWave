module.exports= (sequelize, dataTypes) => {
    let alias = "Products";
    let cols = {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey:true,
            allowNull: false
        },
        name:{
            type: dataTypes.STRING,
            allowNull: false
        },
        developer:{
            type: dataTypes.STRING,
            allowNull: false
        },
        email:{
            type: dataTypes.STRING,
            unique:true,
            fields:['email'],
            allowNull: true,
            defaultValue: null
        },
        release_date:{
            type: dataTypes.DATE,
            allowNull: false
        },
        price:{
            type: dataTypes.INTEGER.UNSIGNED,
            allowNull: false
        },
        logo:{
            type: dataTypes.STRING,
            allowNull: true,
            defaultValue: null
        },
        min_requiremen:{
            type: dataTypes.TEXT,
            allowNull: false
        },
        rec_requiremen:{
            type: dataTypes.TEXT,
            allowNull: false
        },
        description:{
            type: dataTypes.TEXT,
            allowNull: false
        },
        genre_id:{
            type: dataTypes.INTEGER.UNSIGNED,
            allowNull: false
            //FK genre_id --> product referencia a la tabla genres
        }
    };
    let config = {
        tableName: "products",
        timesTamps:false
    }

    const Product= sequelize.define(alias,cols, config);

    Product.associate = function(models){
        Product.belongsTo(models.Genres,{
            as: "genres",
            foreignKey: "genre_id"
        });
        Product.belongsTo(models.Images,{
            as: "images",
            foreignKey: "prduct_id"
        });
        Product.belongsToMany(models.Platforms,{
            as: "platforms",
            through: "products_platform",
            foreignKey: "product_id",
            otherKey: "platform_id",
            timesTamps: false
        });
        Product.belongsToMany(models.Shoppingcart,{
            as: "shoppingcart",
            through: "shopping_products",
            foreignKey: "product_id",
            otherKey: "shopping_cart_id",
            timesTamps: false
        });
        Product.belongsToMany(models.Users,{
            as: "users",
            through: "Users_products",
            foreignKey: "product_id",
            otherKey: "user_id",
            timesTamps: false
        })
    }

    return Product;
}
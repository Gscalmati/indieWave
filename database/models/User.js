module.exports = (sequelize, dataTypes) => {
    let alias = "Users";
    let cols = {
        id: {
            type: dataTypes.INTEGER.UNSIGNED,
            primaryKey: true,
            allowNull: false,
            autoIncrement: true
        },
        username: {
            type: dataTypes.STRING,
            unique: true,
            fields: ['username'],
            allowNull: true,
            defaultValue: null,
        },
        name: {
            type: dataTypes.STRING,
        },
        surname: {
            type: dataTypes.INTEGER,
        },
        email: {
            type: dataTypes.STRING,
            unique: true,
            fields: ['email'],
            allowNull: true,
            defaultValue: null
        },
        profile_pic: {
            type: dataTypes.STRING,
            defaultValue: "/img/users/default.png"
        },
        password: {
            type: dataTypes.INTEGER,
        },
        admin: {
            type: dataTypes.INTEGER.UNSIGNED,
            allowNull: true
        },
    };
    let config = {
        tableName: "users",
        timestamps: false
    }

    const Users = sequelize.define(alias, cols, config);

    /*Users.associate = function(models) {
        Users.belongsTo(models.Shoppingcarts, {
            as: "shoppingcart",
            foreignKey: "user_id"
        });
        Users.belongsToMany(models.Products, {
            as: "products",
            through: "users_products",
            foreignKey: "user_id",
            otherKey: "product_id",
            timestamps: false
        })
    }*/

    return Users;
}
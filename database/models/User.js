module.exports= (sequelize, dataTypes) => {
    let alias = "Users";
    let cols = {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            primaryKey:true,
            allowNull: false,
            autoIncrement:true
        },
        username:{
            type: dataTypes.STRING,
            unique:true,
            fields:['username'],
            allowNull: true,
            defaultValue: null,
        },
        name:{
            type: dataTypes.STRING,
        },
        surname:{
            type: dataTypes.INTEGER,
        },
        email:{
            type: dataTypes.INTEGER,
            type: dataTypes.STRING,
            unique:true,
            fields:['email'],
            allowNull: true,
            defaultValue: null
        },
        profile_pic:{
            type: dataTypes.INTEGER,
            defaultValue: true
        },
        password:{
            type: dataTypes.INTEGER,
        },
        admin:{
            type: dataTypes.INTEGER.UNSIGNED,
            allowNull: true
        },
    };
    let config = {
        tableName: "users",
        timesTamps:false
    }

    const Users= sequelize.define(alias,cols, config);

    Users.associate = function(models){
        Users.belongsTo(models.Shoppingcart,{
            as: "shoppingcart",
            foreignKey: "user_id"
        });
        Users.belongsToMany(models.Products,{
            as: "products",
            through: "users_products",
            foreignKey: "user_id",
            otherKey: "product_id",
            timesTamps: false
        })
    }

    return Users;
}
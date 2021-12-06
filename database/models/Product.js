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

    return Product;
}
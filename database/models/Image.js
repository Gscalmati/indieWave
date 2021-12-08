module.exports= (sequelize, dataTypes) => {
    let alias = "Images";
    let cols = {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            primaryKey:true,
            allowNull: false,
            autoIncrement:true
        },
        product_id:{
            type: dataTypes.INTEGER.UNSIGNED,
            
            //FK images --> products_id referencia a la tabla products
        },
        image:{
            type: dataTypes.STRING,
            inique:true,
            fields:['image'],
            allowNull: false
        }
    };
    let config = {
        tableName: "images",
        timesTamps:false
    }

    const Image= sequelize.define(alias,cols, config);

    Image.associate = function(models){
        Image.hasMany(models.Products,{
            as: "products",
            foreignKey: "prduct_id"
        })
    }

    return Image;
}
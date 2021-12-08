module.exports= (sequelize, dataTypes) => {
    let alias = "Platforms";
    let cols = {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey:true,
            allowNull: false
        },
        name:{
            type: dataTypes.STRING,
            unique:true,
            fields:['name']
        }
    };
    let config = {
        tableName: "platforms",
        timestamps:false
    }

    const Platform= sequelize.define(alias,cols, config);

    Platform.associate = function(models){
        Platform.belongsToMany(models.Products,{
            as: "products",
            through: "products_platform",
            foreignKey: "platform_id",
            otherKey: "product_id",
            timestamps: false
        })
    }

    return Platform;
}
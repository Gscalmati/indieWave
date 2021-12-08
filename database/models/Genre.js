module.exports= (sequelize, dataTypes) => {
    let alias = "Genres";
    let cols = {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey:true,
            allowNull: false
        },
        name:{
            type: dataTypes.STRING,
            allowNull: false,
            inique:true,
            fields:['name'],
        }
    };
    let config = {
        tableName: "genres",
        timestamps:false
    }

    const Genre= sequelize.define(alias,cols, config);

    Genre.associate = function(models){
        Genre.hasMany(models.Products,{
            as: "products",
            foreignKey: "genre_id"
        })
    }

    return Genre;
}

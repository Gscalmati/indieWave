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
        timesTamps:false
    }

    const Genre= sequelize.define(alias,cols, config);

    return Genre;
}

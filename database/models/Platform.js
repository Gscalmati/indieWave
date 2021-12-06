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
        timesTamps:false
    }

    const Platform= sequelize.define(alias,cols, config);

    return Platform;
}
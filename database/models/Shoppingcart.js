module.exports= (sequelize, dataTypes) => {
    let alias = "Shoppingcart";
    let cols = {
        id:{
            type: dataTypes.INTEGER.UNSIGNED,
            primaryKey:true,
            allowNull: false,
            autoIncrement:true
        },
        user_id:{
            type: dataTypes.INTEGER.UNSIGNED,
            unique: true,
            fields:['user_id']
        }
    };
    let config = {
        tableName: "shoppingcart",
        timesTamps:false
    }

    const Shoppingcart= sequelize.define(alias,cols, config);

    return Shoppingcart;
}
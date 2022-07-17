const Sequelize = require("sequelize");
const connection = require("../database/database");

const User = connection.define('users',{
    login:{
        type: Sequelize.STRING,
        allowNull: false
    },
    password:{
        type: Sequelize.STRING,
        allowNull: false
    },
    user:{
        type: Sequelize.STRING,
        allowNull: false
    },
    active:{
        type: Sequelize.BOOLEAN,
        allowNull: false
    }
})

User.sync({force:false});

module.exports = User;
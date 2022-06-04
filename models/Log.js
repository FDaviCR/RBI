const Sequelize = require("sequelize");
const connection = require("../database/database");

const Component = connection.define('log',{
	userId:{
		type: Sequelize.INTEGER,
		allowNull: false
	},
    elementId: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    type:{
        type: Sequelize.STRING,
        allowNull: false
    },
	data:{
        type: Sequelize.DATE,
        allowNull: false
    },
});

Component.sync({force:false});

module.exports = Component;
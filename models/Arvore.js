const Sequelize = require("sequelize");
const connection = require("../database/database");

const Equipment = connection.define('equipment',{
	equipment:{
		type: Sequelize.STRING,
		allowNull: false,
		unique:true,
	},
	equipmentType:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	siteId:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	ativo:{
        type: Sequelize.BOOLEAN,
        allowNull: false
    }
});

Equipment.sync({force:false});

module.exports = Equipment;
const Sequelize = require("sequelize");
const connection = require("../database/database");

const InventoryGroup = connection.define('inventory_group',{
	inventoryGroupName:{
		type: Sequelize.STRING,
		allowNull: false,
		unique:true,
	},

	inventoryGroupMass:{
		type: Sequelize.REAL,
	},

	ativo:{
        type: Sequelize.BOOLEAN,
        allowNull: false
    }
});

InventoryGroup.sync({force:false});

module.exports = InventoryGroup;
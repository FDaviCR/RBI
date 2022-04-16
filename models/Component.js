const Sequelize = require("sequelize");
const connection = require("../database/database");

const Component = connection.define('component',{
	component:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	componentType:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	equipmentType:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	equipmentId:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	siteId:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	equipmentComponent:{
		type: Sequelize.STRING,
		allowNull: false,
		unique: true,
	},
	inventoryGroupId:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	ativo:{
        type: Sequelize.BOOLEAN,
        allowNull: false,
    },
	equipmentAtivo:{
        type: Sequelize.BOOLEAN,
        allowNull: false,
    },
	siteAtivo:{
        type: Sequelize.BOOLEAN,
        allowNull: false,
    },
});

Component.sync({force:false});

module.exports = Component;
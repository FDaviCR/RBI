const Sequelize = require("sequelize");
const connection = require("./database");

const Component = connection.define('component',{
	equipment:{
		type: Sequelize.STRING,
		allowNull: false
	},
	equipmentType:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	component:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	componentType:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	/*
	site:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	fms:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	detectionSystem:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	isolationSystem:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	mitigationSystem:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	invetoryGroup:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	invetoryGroupMass:{
		type: Sequelize.REAL,
		allowNull: false,
	},*/
});

Component.sync({force:false}).then(()=>{});

module.exports = Component;
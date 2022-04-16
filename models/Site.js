const Sequelize = require("sequelize");
const connection = require("../database/database");

const Site = connection.define('site',{
	site:{
		type: Sequelize.STRING,

	},
	siteUppercase:{
		type: Sequelize.STRING,
		allowNull: false,
		unique:true,
	},
	FMS:{
		type: Sequelize.REAL,
	},
	ativo:{
        type: Sequelize.BOOLEAN,
        allowNull: false
    }
});

Site.sync({force:false});

module.exports = Site;
const sequelize = require("sequelize");
const connection = new sequelize({
	dialect: 'sqlite',
	storage: './database/Reman.db'
});

module.exports = connection;
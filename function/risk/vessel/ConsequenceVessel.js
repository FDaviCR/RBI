const express = require("express");
//const router = express.Router();
//const { Op } = require("sequelize");
const Tables = require("../../../database/Tables");
const vessel = require("../../../controller/ResultController");
//const ConsequenceVessel = require("../models/ConsequenceVessel");

async function step_1_3(representativeFluid, operatingPressure){
	const fluidProperties =  await Tables.P3_T4_2.findOne({ where:{fluid:representativeFluid},raw:true}).then(fluid=>{

		return {
			Liquid_Density: fluid.Liquid_Density,
		//	Vapor_Density:,
			MW: fluid.MW,
		//	k,
			Cp: fluid.Cp,
			AIT: fluid.AIT_GC,
		}
		
	});
	
	return fluidProperties;
}




module.exports = {
//	router,
	step_1_3,
	};
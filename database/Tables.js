const Sequelize = require("sequelize");
const connection = require("./database");

const P2_T3_1 = connection.define('Part 2 - Table 3_1',{
	EquipmentType:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	ComponentType:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	gff_Small:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	gff_Medium:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	gff_Large:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	gff_Rupture:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	gff_Total:{
	type: Sequelize.TEXT,
	allowNull: false,
	},
});

const P2_T4_8 = connection.define('Part 2 - Table 4_8',{
	ThinningMechanism_fom:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	KeyProcessAndProbes:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	KeyProcess:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	ElectricalResistanceProbes:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	CorrosionCoupons:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	None:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
});

const P3_T4_1 = connection.define('Part 3 - Table 4_1',{
	Representative_Fluid:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	FluidType:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Examples_of_Applicable_Materials:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
});

const P3_T4_2 = connection.define('Part 3 - Table 4_2',{
	Fluid:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	MW:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Liquid_Density:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	NBP_GC:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Ambient_State:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Note_Cp:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Ideal_Gas_Constant_A:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Ideal_Gas_Constant_B:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Ideal_Gas_Constant_C:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Ideal_Gas_Constant_D:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Ideal_Gas_Constant_E:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIT_GC:{
		type: Sequelize.REAL,
		allowNull: false,
	},
});

const P3_T4_7 = connection.define('Part 3 - Table 4_7',{
	Detection_System_Rating:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Isolation_System_Rating:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Concatenar:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	ld_max1:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	ld_max2:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	ld_max3:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	ld_max4:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
});

const P3_T4_8 = connection.define('Part 3 - Table 4_8',{
	Fluid:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Fluid_Type:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	AINL_CONT_Gas_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_CONT_Gas_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_CONT_Liquid_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_CONT_Liquid_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_CONT_Gas_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_CONT_Gas_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_CONT_Liquid_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_CONT_Liquid_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_INST_Gas_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_INST_Gas_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_INST_Liquid_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_INST_Liquid_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_INST_Gas_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_INST_Gas_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_INST_Liquid_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_INST_Liquid_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
});

const P3_T4_9 = connection.define('Part 3 - Table 4_9',{
	Fluid:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Fluid_Type:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	AINL_CONT_Gas_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_CONT_Gas_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_CONT_Liquid_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_CONT_Liquid_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_CONT_Gas_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_CONT_Gas_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_CONT_Liquid_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_CONT_Liquid_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_INST_Gas_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_INST_Gas_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_INST_Liquid_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AINL_INST_Liquid_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_INST_Gas_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_INST_Gas_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_INST_Liquid_a:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AIL_INST_Liquid_b:{
		type: Sequelize.REAL,
		allowNull: false,
	},
});

const P3_T4_11 = connection.define('Part 3 - Table 4_11',{
	Continuous_Releases_Duration_minutes:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	HF_Acid_c:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	HF_Acid_d:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	H2S_c:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	H2S_d:{
		type: Sequelize.REAL,
		allowNull: false,
	},
});

const P3_T4_12 = connection.define('Part 3 - Table 4_12',{
	Continuous_Releases_Duration_minutes:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	Ammonia_e:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Ammonia_f:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Chlorine_e:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Chlorine_f:{
		type: Sequelize.REAL,
		allowNull: false,
	},
});

const P3_T4_13 = connection.define('Part 3 - Table 4_13',{
	Chemical:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Release_Duration_Minutes:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	Gas_Release_Constants_e:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Gas_Release_Constants_f:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Liquid_Release_Constants_e:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Liquid_Release_Constants_f:{
		type: Sequelize.REAL,
		allowNull: false,
	},
});

const P3_T4_14 = connection.define('Part 3 - Table 4_14',{
	Toxic_Component:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Probit_Parameters_A:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Probit_Parameters_B:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	Probit_Parameters_N:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	IDLH_ppm:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	AEGL3_10_ppm:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AEGL3_30_ppm:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	AEGL3_60_ppm:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	EPA_Toxic_Endpoint:{
		type: Sequelize.REAL,
		allowNull: false,
	},
	ERPG_3:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
});

const P3_T4_15 = connection.define('Part 3 - Table 4_15',{
	Equipment_Type:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Component_Type:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	holecost_Small:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	holecost_Medium:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	holecost_Large:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	holecost_Rupture:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
});

const P3_T4_16 = connection.define('Part 3 - Table 4_16',{
	Material:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	matcost:{
		type: Sequelize.REAL,
		allowNull: false,
	},
});

const P3_T4_17 = connection.define('Part 3 - Table 4_17',{
	Equipment_Type:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	Component_Type:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	outage_Small:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	outage_Medium:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	outage_Large:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
	outage_Rupture:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
});

const P3_T4_18 = connection.define('Part 3 - Table 4_18',{
	Fluid:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	fract_evap:{
		type: Sequelize.REAL,
		allowNull: false,
	},
});

const P3B_T3B_2_1 = connection.define('Part 3B - Table 3B_2_1',{
	Conversion_Factor:{
		type: Sequelize.TEXT,
		allowNull: false,
	},
	SI_Units:{
		type: Sequelize.REAL,
		allowNull: false,
	},
});

P2_T3_1.sync({force:false});
P2_T4_8.sync({force:false});

P3_T4_1.sync({force:false});
P3_T4_2.sync({force:false});
P3_T4_7.sync({force:false});
P3_T4_8.sync({force:false});
P3_T4_9.sync({force:false});
P3_T4_11.sync({force:false});
P3_T4_12.sync({force:false});
P3_T4_13.sync({force:false});
P3_T4_14.sync({force:false});
P3_T4_15.sync({force:false});
P3_T4_16.sync({force:false});
P3_T4_17.sync({force:false});
P3_T4_18.sync({force:false});
P3B_T3B_2_1.sync({force:false});

module.exports = {
	
	P2_T3_1,
	P2_T4_8,
	
	P3_T4_1,
	P3_T4_2,
	P3_T4_7,
	P3_T4_8,
	P3_T4_9,
	P3_T4_11,
	P3_T4_12,
	P3_T4_13,
	P3_T4_14,
	P3_T4_15,
	P3_T4_17,
	P3_T4_18,
	P3B_T3B_2_1,
	
}
const Sequelize = require("sequelize");
const connection = require("../database/database");

const Vessel = connection.define('vessel',{
/*	equipment:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	equipmentType:{
		type: Sequelize.STRING,
		allowNull: false,
	},
*/	equipmentId:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
/*	component:{
		type: Sequelize.STRING,
		allowNull: false,
	},
	componentType:{
		type: Sequelize.STRING,
		allowNull: false,
	},
*/	componentId:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
/*	site:{
		type: Sequelize.STRING,
		allowNull: false,
	},
*/	siteId:{
		type: Sequelize.INTEGER,
		allowNull: false,
	},
/*	FMS:{
		type: Sequelize.REAL,
	},
*/	detectionSystem:{type: Sequelize.STRING,},
	isolationSystem:{type: Sequelize.STRING,},
	mitigationSystem:{type: Sequelize.REAL,},
	userInventoryGroupMass:{type: Sequelize.REAL,},
	operatingPressure:{type: Sequelize.REAL,},
	operatingTemperature:{type: Sequelize.REAL,},
	insideDiameter:{type: Sequelize.REAL,},
	volumeComponent:{type: Sequelize.REAL,},
	representativeFluid:{type: Sequelize.STRING,},
	storedFluidPhase:{type: Sequelize.STRING,},
	percentLiquid:{type: Sequelize.REAL,},
	reynolds:{type: Sequelize.REAL,},
	toxicComposition:{type: Sequelize.STRING,},
	percentToxicFluid:{type: Sequelize.REAL,},
	idlh:{type: Sequelize.BOOLEAN,},
//////////////////////////// DADOS DE INSPEÇÃO ///////////////////////////////////////////////////////
	installationDate:{type: Sequelize.DATE,},
	lastInspectionInterna:{type: Sequelize.DATE,},
	rbiDate:{type: Sequelize.DATE,},
	planDate:{type: Sequelize.DATE,},
	turnaroundDate1:{type: Sequelize.DATE,},
	turnaroundDate2:{type: Sequelize.DATE,},
	prazoMax:{type: Sequelize.INTEGER,},
	maximumProcessTemperature:{type: Sequelize.REAL,},
	steamTrace:{type: Sequelize.STRING,},
	steamOut:{type: Sequelize.STRING,},
	pwht:{type: Sequelize.STRING,},

//////////////////////////// MECANISMOS DE DANO //////////////////////////////////////////

	thinning:{type: Sequelize.BOOLEAN,},
	lining:{type: Sequelize.BOOLEAN,},
	sccCaustic:{type: Sequelize.BOOLEAN,},
	sccAmine:{type: Sequelize.BOOLEAN,},
	sccSulfide:{type: Sequelize.BOOLEAN,},
	hicSohicH2S:{type: Sequelize.BOOLEAN,},
	acscc:{type: Sequelize.BOOLEAN,},
	pascc:{type: Sequelize.BOOLEAN,},
	sccChloride:{type: Sequelize.BOOLEAN,},
	hscHF:{type: Sequelize.BOOLEAN,},
	hicSohicHF:{type: Sequelize.BOOLEAN,},
	externalFerritic:{type: Sequelize.BOOLEAN,},
	cuiFerritic:{type: Sequelize.BOOLEAN,},
	extclsccAustenitic:{type: Sequelize.BOOLEAN,},
	cuiExtclsccAustenitic:{type: Sequelize.BOOLEAN,},
	htha:{type: Sequelize.BOOLEAN,},
	brittleFracture:{type: Sequelize.BOOLEAN,},
	lowAlloySteelEmbrittlement:{type: Sequelize.BOOLEAN,},
	embrittlement885F:{type: Sequelize.BOOLEAN,},
	sigmaPhaseEmbrittlement:{type: Sequelize.BOOLEAN,},
	pipingMechanicalFatigue:{type: Sequelize.BOOLEAN,},

/////////////////////////////////// DADOS THINNING ///////////////////////////////////////////////////

	furnishedThickness:{type: Sequelize.REAL,},
	minimumRequiredThickness:{type: Sequelize.REAL,},
	minimumStructuralThickness:{type: Sequelize.REAL,},
	hasClad:{type: Sequelize.BOOLEAN,},
	cladThickness:{type: Sequelize.REAL,},
	lastInspectionThinning:{type: Sequelize.DATE,},
	trdi:{type: Sequelize.REAL,},
	cr_Bm:{type: Sequelize.REAL,},
	cr_Cm:{type: Sequelize.REAL,},
	corrosionType:{type: Sequelize.STRING,},
	confidenceData:{type: Sequelize.STRING,},
	shapeFactor:{type: Sequelize.STRING,},
	yieldStrength:{type: Sequelize.REAL,},
	tensileStrength:{type: Sequelize.REAL,},
	jointEfficiency:{type: Sequelize.REAL,},
	allowableStress:{type: Sequelize.REAL,},
	thinningMechanism:{type: Sequelize.STRING,},
	adjustmentFactorsThinning:{type: Sequelize.STRING,},
	fipThinning:{type: Sequelize.INTEGER,},
	fdlhinning:{type: Sequelize.INTEGER,},
	N_A_Thinning:{type: Sequelize.INTEGER,},
	N_B_Thinning:{type: Sequelize.INTEGER,},
	N_C_Thinning:{type: Sequelize.INTEGER,},
	N_D_Thinning:{type: Sequelize.INTEGER,},

/////////////////////////////////// DADOS LINING ///////////////////////////////////////////////////



/////////////////////////////////// DADOS hicSohicH2S ///////////////////////////////////////////////////



///////////////////////////////////HISTÓRICO DE INSPEÇÃO ///////////////////////////////////////////////////


});

Vessel.sync({force:false});

module.exports = Vessel;
const express = require("express");
const router = express.Router();
const Vessel = require("../models/Vessel");
const Component = require("../models/Component");
const Equipment = require("../models/Equipment");
const Site = require("../models/Site");
const Tables = require("../database/Tables");
const InventoryGroup = require("../models/InventoryGroup");
const { Op } = require("sequelize");
//const { step_1_3 } = require("../function/risk/vessel/ConsequenceVessel");

// const ConsequenceVessel = require("../function/risk/vessel/ConsequenceVessel");

router.get("/resultado/site/:siteId/equipment/:equipmentType/:equipmentId/component/:componentId", (req, res) => {
	let siteId = req.params.siteId;
	let equipment = req.params.equipment;
	let equipmentType = req.params.equipmentType;
	let equipmentId = req.params.equipmentId
	let component = req.params.component;
	let componentId = req.params.componentId;

	if (equipmentType == "Heat_Exchanger" || equipmentType == "Tank650") {
		res.send(equipmentType + " ainda não disponível");
	} else {

		Vessel.findOne({
			where: {
				componentId: componentId,
			},
			raw: true
		}).then(vessel => {

			if (!vessel) {	//se não existe
				console.log("Não existe");
				res.redirect("/resultado");
			} else {
				res.redirect("/resultado/site/" + siteId + "/equipment/" + equipmentType + "/" + equipmentId + "/component/" + componentId + "/vesselrisk");
			}
		});

	}
});

// Rota para Risco dos Vasos etc.

router.get("/resultado/site/:siteId/equipment/:equipmentType/:equipmentId/component/:componentId/vesselrisk", (req, res) => {
	let siteId = req.params.siteId;
	let equipmentType = req.params.equipmentType;
	let equipmentId = req.params.equipmentId;
	let componentId = req.params.componentId;



	async function ConsequenceVessel() {

		async function unidade() { return await Site.findByPk(siteId) };
		async function equipamento() { return await Equipment.findByPk(equipmentId) };
		async function componente() { return await Component.findByPk(componentId) };
		async function todasUnidades() { return await Site.findAll({ where: { ativo: 1 }, raw: true, order: [['site', 'ASC']] }) };
		async function todosEquipamentos() { return await Equipment.findAll({ where: { ativo: 1 }, raw: true, order: [['equipment', 'ASC']] }) };
		async function todosComponentes() { return await Component.findAll({ where: { ativo: 1 }, raw: true, order: [['component', 'ASC']] }) };
		async function vaso() { return await Vessel.findOne({ where: { componentId: componentId }, raw: true }) };

		const site = await unidade();
		const equipment = await equipamento();
		const component = await componente();
		const siteAll = await todasUnidades();
		const equipmentAll = await todosEquipamentos();
		const componentAll = await todosComponentes();
		const vessel = await vaso();
		const representativeFluid = vessel.representativeFluid;
		const operatingPressure = vessel.operatingPressure * 98.067 + 101.33; //converter para kPa absoluta
		const operatingTemperature = vessel.operatingTemperature + 273.15; //converter para Kelvin

		// Constantes Gerais

		const R = 8.314;			// Gases ideais
		const Kelvin = 273.15;		// Converção °C para K
		const gc = 1;				// Gravidade
		const Patm = 101.33			// Patm em kpa
		const Kvn = 1				// Kv,n conservativo

		async function constantesParte3B(cte) { return await Tables.P3B_T3B_2_1.findOne({ where: { Conversion_Factor: cte }, raw: true }) }
		const C1 = await constantesParte3B("C1").then(cte => { return cte.SI_Units });
		const C2 = await constantesParte3B("C2").then(cte => { return cte.SI_Units });
		const C4A = await constantesParte3B("C4A").then(cte => { return cte.SI_Units });
		const C5 = await constantesParte3B("C5").then(cte => { return cte.SI_Units });
		const C6 = await constantesParte3B("C6").then(cte => { return cte.SI_Units });
		const C8 = await constantesParte3B("C8").then(cte => { return cte.SI_Units });
		const C9 = await constantesParte3B("C9").then(cte => { return cte.SI_Units });
		const C10 = await constantesParte3B("C10").then(cte => { return cte.SI_Units });
		const C4B = await constantesParte3B("C4B").then(cte => { return cte.SI_Units });

		// Consequence STEP 1.3

		async function step_1_3(representativeFluid, operatingPressure) {
			return await Tables.P3_T4_2.findOne({ where: { fluid: representativeFluid }, raw: true })
		};

		const fluidProperties = await step_1_3(representativeFluid, operatingPressure);
		const liquidDensity = fluidProperties.Liquid_Density;
		const MW = fluidProperties.MW;
		const vaporDensity = operatingPressure * MW / (R * operatingTemperature);
		const noteCp = fluidProperties.Note_Cp;
		const AIT_table = fluidProperties.AIT_GC + Kelvin;
		const AIT = isNaN(AIT_table) ? 0 : AIT;
		const Cp = await calculoCp(noteCp);
		const k = await (Cp / (Cp - R))

		async function calculoCp(note) {

			let A = fluidProperties.Ideal_Gas_Constant_A;
			let B = fluidProperties.Ideal_Gas_Constant_B;
			let C = fluidProperties.Ideal_Gas_Constant_C;
			let D = fluidProperties.Ideal_Gas_Constant_D;
			let E = fluidProperties.Ideal_Gas_Constant_E;
			let T = operatingTemperature;
			let x;

			switch (note) {
				case "Note 1":
					x = A + B * T + C * Math.pow(T, 2) + D * Math.pow(T, 3);
					return await x;
					break;
				case "Note 2":
					x = A + B * Math.pow((C / T) / Math.sinh(C / T), 2) + D * Math.pow((E / T) / Math.sinh(E / T), 2);
					return await x;
					break;
				case "Note 3":
					x = A + B * T + C * Math.pow(T, 2) + D * Math.pow(T, 3) + E * Math.pow(T, 4);
					return await x;
					break;
				default:
					return await false;
					break;
			}
		}

		// Consequence STEP 1.4
		const storedFluidPhase = vessel.storedFluidPhase;
		const ambientState = fluidProperties.Ambient_State;
		const isModelAsGas = await modelAsGas(storedFluidPhase, ambientState);

		async function modelAsGas(stored, ambient) {

			if (stored == "Gas") {
				return true;
			} else if (ambient == "Liquid") {
				return false;
			} else if ((operatingTemperature - Kelvin) < 26.67) {
				return true;
			} else {
				return false;
			}
		}

		// Consequence STEP 2.1

		const diameterVessel = vessel.insideDiameter;
		const smallHoleSize = 6.4;
		const mediumHoleSize = Math.min(diameterVessel, 25);
		const largeHoleSize = Math.min(diameterVessel, 102);
		const ruptureHoleSize = Math.min(diameterVessel, 406);
		const dn = [smallHoleSize, mediumHoleSize, largeHoleSize, ruptureHoleSize];


		// Consequence STEP 2.2

		async function step_2_2(componentType) {
			return await Tables.P2_T3_1.findOne({ where: { ComponentType: componentType }, raw: true });
		};

		const componentType = await component.componentType;
		const gff_bd = await step_2_2(componentType);

		const gff = [gff_bd.gff_Small, gff_bd.gff_Medium, gff_bd.gff_Large, gff_bd.gff_Rupture];
		const gffTotal = [gff_bd.gff_Total];

		// Consequence STEP 3.2

		const area_n = dn.map(el => { return (Math.PI * Math.pow(el, 2) / 4) });

		// Consequence STEP 3.3, STEP 3.4 e STEP 4.5 --> Não coloquei o cálculo do Kv,n

		const Ptrans = Patm * Math.pow((k + 1) / 2, k / (k - 1));
		const Ps = operatingPressure;
		const Ts = operatingTemperature;

		async function releaseRateCalculation(An) {
			if (storedFluidPhase == "Liquid") {
				return await (0.61 * Kvn * liquidDensity * (An / C1) * Math.sqrt(2 * gc * (Ps - Patm) / liquidDensity))
			} else if (Ps > Ptrans) {
				return await ((0.9 / C2) * An * Ps * Math.sqrt((k * MW * gc / (R * Ts)) * Math.pow(2 / (k + 1), ((k + 1) / (k - 1)))))
			} else {
				return await ((0.9 / C2) * An * Ps * Math.sqrt(((MW * gc) / (R * Ts)) * ((2 * k) / (k - 1)) * Math.pow((Patm / Ps), (2 / k)) * (1 - Math.pow((Patm / Ps), ((k - 1) / k)))))
			}
		}

		const areaMax = Math.min(32480, area_n[3]); 	// 32480mm² = Área para um furo de 8 in.


		let Wn = [await releaseRateCalculation(area_n[0]), await releaseRateCalculation(area_n[1]), await releaseRateCalculation(area_n[2]), await releaseRateCalculation(areaMax)];


		// Consequence STEP 4.2		

		const volume = vessel.volumeComponent;
		const liquidPercent = vessel.percentLiquid / 100;

		const massComp = liquidDensity * volume * liquidPercent + vaporDensity * volume * (1 - liquidPercent);

		// Consequence STEP 4.3


		// Consequence STEP 4.4

		async function inventoryGroupMass() { return await InventoryGroup.findOne({ where: { id: component.inventoryGroupId }, raw: true }) };

		const massInv = await inventoryGroupMass().then(inv => { return inv.inventoryGroupMass });


		// Consequence STEP 4.6

		let massAdd = [180 * Wn[0], 180 * Wn[1], 180 * Wn[2], 180 * Wn[3]];

		// Consequence STEP 4.7

		let massAvail = [Math.min(massComp + massAdd[0], massInv), Math.min(massComp + massAdd[1], massInv), Math.min(massComp + massAdd[2], massInv), Math.min(massComp + massAdd[3], massInv)];


		// Consequence STEP 5.1

		function isContinuous(dn, massAvail, Wn) {
			if (dn <= 6.35) {
				return true;
			} else if (massAvail <= 4536) {
				return true;
			} else if (Wn <= 25.22) {
				return true;
			} else {
				return false;
			}
		}

		let releaseType1 = await isContinuous(dn[0], massAvail[0], Wn[0]);
		let releaseType2 = await isContinuous(dn[1], massAvail[1], Wn[1]);
		let releaseType3 = await isContinuous(dn[2], massAvail[2], Wn[2]);
		let releaseType4 = await isContinuous(dn[3], massAvail[3], Wn[3]);

		let releaseType = [releaseType1, releaseType2, releaseType3, releaseType4];


		// Consequence STEP 6.1

		const detectionSystem = vessel.detectionSystem;
		const isolationSystem = vessel.isolationSystem;
		const systemClass = detectionSystem + isolationSystem;

		// Consequence STEP 6.4

		function STEP_6_4() {
			switch (systemClass) {
				case "AA": return 0.25; break;
				case "AB": return 0.20; break;
				case "AC": return 0.10; break;
				case "BC": return 0.10; break;
				case "BB": return 0.15; break;
				default: return 0; break;
			}
		};

		const factDi = await STEP_6_4();


		// Consequence STEP 6.5

		async function STEP_6_5() { return await Tables.P3_T4_7.findOne({ where: { Concatenar: systemClass }, raw: true }) };

		const ldMax1 = await STEP_6_5().then(ld => { return ld.ld_max1 });
		const ldMax2 = await STEP_6_5().then(ld => { return ld.ld_max2 });
		const ldMax3 = await STEP_6_5().then(ld => { return ld.ld_max3 });
		const ldMax4 = await STEP_6_5().then(ld => { return ld.ld_max4 });

		const ldMax = [ldMax1, ldMax2, ldMax3, ldMax4];


		// Consequence STEP 7.1

		let rate = Wn.map(wn => { return (wn * (1 - factDi)) });


		// Consequence STEP 7.2

		async function step_7_2(massAvail, rate, ldMax) {
			return await (Math.min(massAvail / rate, 60 * ldMax));
		}

		let ld1 = await step_7_2(massAvail[0], rate[0], ldMax[0]);
		let ld2 = await step_7_2(massAvail[1], rate[1], ldMax[1]);
		let ld3 = await step_7_2(massAvail[2], rate[2], ldMax[2]);
		let ld4 = await step_7_2(massAvail[3], rate[3], ldMax[3]);

		let ld = [ld1, ld2, ld3, ld4];

		// Consequence STEP 7.3

		async function step_7_3(massAvail, rate, ld) {
			return await (Math.min(rate * ld, massAvail));
		}

		let mass1 = await step_7_3(massAvail[0], rate[0], ld[0]);
		let mass2 = await step_7_3(massAvail[1], rate[1], ld[1]);
		let mass3 = await step_7_3(massAvail[2], rate[2], ld[2]);
		let mass4 = await step_7_3(massAvail[3], rate[3], ld[3]);

		let mass = [mass1, mass2, mass3, mass4];


		// Consequence STEP 8.1

		const factMit = vessel.mitigationSystem;


		// Consequence STEP 8.2

		/*	async function isEneffContinuous(releaseType, mass){
				
			}
			*/
		async function isReleaseTypeContinuous(type, mass) {
			return type ? 1 : await (4 * Math.log10(C4A * mass) - 15);
		}

		const eneff1 = await isReleaseTypeContinuous(releaseType[0], mass[0]);
		const eneff2 = await isReleaseTypeContinuous(releaseType[1], mass[1]);
		const eneff3 = await isReleaseTypeContinuous(releaseType[2], mass[2]);
		const eneff4 = await isReleaseTypeContinuous(releaseType[3], mass[3]);

		let eneff = [eneff1, eneff2, eneff3, eneff4]


		// Consequence STEP 8.3

		async function step_8_3(fluid) {
			return await Tables.P3_T4_1.findOne({ where: { Representative_Fluid: fluid }, raw: true })
		};

		const fluidType = await step_8_3(vessel.representativeFluid).then(fluid => { return fluid.FluidType });


		// Consequence STEP 8.4 - 8.11


		// CONSTANTES CMD
		async function constantP3_T4_8() { return await Tables.P3_T4_8.findOne({ where: { Fluid: representativeFluid }, raw: true }) }
		const P3_T4_8 = await constantP3_T4_8();

		let AINL_CONT_Gas_a = P3_T4_8.AINL_CONT_Gas_a;
		let AINL_CONT_Gas_b = P3_T4_8.AINL_CONT_Gas_b;
		let AINL_CONT_Liquid_a = P3_T4_8.AINL_CONT_Liquid_a;
		let AINL_CONT_Liquid_b = P3_T4_8.AINL_CONT_Liquid_b;
		let AIL_CONT_Gas_a = P3_T4_8.AIL_CONT_Gas_a;
		let AIL_CONT_Gas_b = P3_T4_8.AIL_CONT_Gas_b;
		let AIL_CONT_Liquid_a = P3_T4_8.AIL_CONT_Liquid_a;
		let AIL_CONT_Liquid_b = P3_T4_8.AIL_CONT_Liquid_b;
		let AINL_INST_Gas_a = P3_T4_8.AINL_INST_Gas_a;
		let AINL_INST_Gas_b = P3_T4_8.AINL_INST_Gas_b;
		let AINL_INST_Liquid_a = P3_T4_8.AINL_INST_Liquid_a;
		let AINL_INST_Liquid_b = P3_T4_8.AINL_INST_Liquid_b;
		let AIL_INST_Gas_a = P3_T4_8.AIL_INST_Gas_a;
		let AIL_INST_Gas_b = P3_T4_8.AIL_INST_Gas_b;
		let AIL_INST_Liquid_a = P3_T4_8.AIL_INST_Liquid_a;
		let AIL_INST_Liquid_b = P3_T4_8.AIL_INST_Liquid_b;

		let aContAINL = (isModelAsGas ? AINL_CONT_Gas_a : AINL_CONT_Liquid_a);
		let bContAINL = (isModelAsGas ? AINL_CONT_Gas_b : AINL_CONT_Liquid_b);
		let aContAIL = (isModelAsGas ? AIL_CONT_Gas_a : AIL_CONT_Liquid_a);
		let bContAIL = (isModelAsGas ? AIL_CONT_Gas_b : AIL_CONT_Liquid_b);
		let aInstAINL = (isModelAsGas ? AINL_INST_Gas_a : AINL_INST_Liquid_a);
		let bInstAINL = (isModelAsGas ? AINL_INST_Gas_b : AINL_INST_Liquid_b);
		let aInstAIL = (isModelAsGas ? AIL_INST_Gas_a : AIL_INST_Liquid_a);
		let bInstAIL = (isModelAsGas ? AIL_INST_Gas_b : AIL_INST_Liquid_b);


		// Consequence AREA CMD

		async function ContinuousConstantsAB(index, a, b) {
			let x = a * Math.pow(rate[index], b) * (1 - factMit);
			return await (x);
		}

		async function InstantaneousConstantsAB(index, a, b) {
			let x = a * Math.pow(mass[index], b) * (1 - factMit) / eneff[index];
			return await (x);
		}


		let AINL_CONT1 = await (isModelAsGas ? ContinuousConstantsAB(0, AINL_CONT_Gas_a, AINL_CONT_Gas_b) : ContinuousConstantsAB(0, AINL_CONT_Liquid_a, AINL_CONT_Liquid_b));
		let AINL_CONT2 = await (isModelAsGas ? ContinuousConstantsAB(1, AINL_CONT_Gas_a, AINL_CONT_Gas_b) : ContinuousConstantsAB(1, AINL_CONT_Liquid_a, AINL_CONT_Liquid_b));
		let AINL_CONT3 = await (isModelAsGas ? ContinuousConstantsAB(2, AINL_CONT_Gas_a, AINL_CONT_Gas_b) : ContinuousConstantsAB(2, AINL_CONT_Liquid_a, AINL_CONT_Liquid_b));
		let AINL_CONT4 = await (isModelAsGas ? ContinuousConstantsAB(3, AINL_CONT_Gas_a, AINL_CONT_Gas_b) : ContinuousConstantsAB(3, AINL_CONT_Liquid_a, AINL_CONT_Liquid_b));
		let AIL_CONT1 = await (isModelAsGas ? ContinuousConstantsAB(0, AIL_CONT_Gas_a, AIL_CONT_Gas_b) : ContinuousConstantsAB(0, AIL_CONT_Liquid_a, AIL_CONT_Liquid_b));
		let AIL_CONT2 = await (isModelAsGas ? ContinuousConstantsAB(1, AIL_CONT_Gas_a, AIL_CONT_Gas_b) : ContinuousConstantsAB(1, AIL_CONT_Liquid_a, AIL_CONT_Liquid_b));
		let AIL_CONT3 = await (isModelAsGas ? ContinuousConstantsAB(2, AIL_CONT_Gas_a, AIL_CONT_Gas_b) : ContinuousConstantsAB(2, AIL_CONT_Liquid_a, AIL_CONT_Liquid_b));
		let AIL_CONT4 = await (isModelAsGas ? ContinuousConstantsAB(3, AIL_CONT_Gas_a, AIL_CONT_Gas_b) : ContinuousConstantsAB(3, AIL_CONT_Liquid_a, AIL_CONT_Liquid_b));
		let AINL_INST1 = await (isModelAsGas ? InstantaneousConstantsAB(0, AINL_INST_Gas_a, AINL_INST_Gas_b) : InstantaneousConstantsAB(0, AINL_INST_Liquid_a, AINL_INST_Liquid_b));
		let AINL_INST2 = await (isModelAsGas ? InstantaneousConstantsAB(1, AINL_INST_Gas_a, AINL_INST_Gas_b) : InstantaneousConstantsAB(1, AINL_INST_Liquid_a, AINL_INST_Liquid_b));
		let AINL_INST3 = await (isModelAsGas ? InstantaneousConstantsAB(2, AINL_INST_Gas_a, AINL_INST_Gas_b) : InstantaneousConstantsAB(2, AINL_INST_Liquid_a, AINL_INST_Liquid_b));
		let AINL_INST4 = await (isModelAsGas ? InstantaneousConstantsAB(3, AINL_INST_Gas_a, AINL_INST_Gas_b) : InstantaneousConstantsAB(3, AINL_INST_Liquid_a, AINL_INST_Liquid_b));
		let AIL_INST1 = await (isModelAsGas ? InstantaneousConstantsAB(0, AIL_INST_Gas_a, AIL_INST_Gas_b) : InstantaneousConstantsAB(0, AIL_INST_Liquid_a, AIL_INST_Liquid_b));
		let AIL_INST2 = await (isModelAsGas ? InstantaneousConstantsAB(1, AIL_INST_Gas_a, AIL_INST_Gas_b) : InstantaneousConstantsAB(1, AIL_INST_Liquid_a, AIL_INST_Liquid_b));
		let AIL_INST3 = await (isModelAsGas ? InstantaneousConstantsAB(2, AIL_INST_Gas_a, AIL_INST_Gas_b) : InstantaneousConstantsAB(2, AIL_INST_Liquid_a, AIL_INST_Liquid_b));
		let AIL_INST4 = await (isModelAsGas ? InstantaneousConstantsAB(3, AIL_INST_Gas_a, AIL_INST_Gas_b) : InstantaneousConstantsAB(3, AIL_INST_Liquid_a, AIL_INST_Liquid_b));



		let AINL_CONT = [AINL_CONT1, AINL_CONT2, AINL_CONT3, AINL_CONT4];
		let AIL_CONT = [AIL_CONT1, AIL_CONT2, AIL_CONT3, AIL_CONT4];
		let AINL_INST = [AINL_INST1, AINL_INST2, AINL_INST3, AINL_INST4];
		let AIL_INST = [AIL_INST1, AIL_INST2, AIL_INST3, AIL_INST4];


		// CONSTANTES INJ
		async function constantP3_T4_9() { return await Tables.P3_T4_9.findOne({ where: { Fluid: representativeFluid }, raw: true }) }
		const P3_T4_9 = await constantP3_T4_9();

		let INJ_AINL_CONT_Gas_a = P3_T4_9.AINL_CONT_Gas_a;
		let INJ_AINL_CONT_Gas_b = P3_T4_9.AINL_CONT_Gas_b;
		let INJ_AINL_CONT_Liquid_a = P3_T4_9.AINL_CONT_Liquid_a;
		let INJ_AINL_CONT_Liquid_b = P3_T4_9.AINL_CONT_Liquid_b;
		let INJ_AIL_CONT_Gas_a = P3_T4_9.AIL_CONT_Gas_a;
		let INJ_AIL_CONT_Gas_b = P3_T4_9.AIL_CONT_Gas_b;
		let INJ_AIL_CONT_Liquid_a = P3_T4_9.AIL_CONT_Liquid_a;
		let INJ_AIL_CONT_Liquid_b = P3_T4_9.AIL_CONT_Liquid_b;
		let INJ_AINL_INST_Gas_a = P3_T4_9.AINL_INST_Gas_a;
		let INJ_AINL_INST_Gas_b = P3_T4_9.AINL_INST_Gas_b;
		let INJ_AINL_INST_Liquid_a = P3_T4_9.AINL_INST_Liquid_a;
		let INJ_AINL_INST_Liquid_b = P3_T4_9.AINL_INST_Liquid_b;
		let INJ_AIL_INST_Gas_a = P3_T4_9.AIL_INST_Gas_a;
		let INJ_AIL_INST_Gas_b = P3_T4_9.AIL_INST_Gas_b;
		let INJ_AIL_INST_Liquid_a = P3_T4_9.AIL_INST_Liquid_a;
		let INJ_AIL_INST_Liquid_b = P3_T4_9.AIL_INST_Liquid_b;

		let aContINJ_AINL = (isModelAsGas ? INJ_AINL_CONT_Gas_a : INJ_AINL_CONT_Liquid_a);
		let bContINJ_AINL = (isModelAsGas ? INJ_AINL_CONT_Gas_b : INJ_AINL_CONT_Liquid_b);
		let aContINJ_AIL = (isModelAsGas ? INJ_AIL_CONT_Gas_a : INJ_AIL_CONT_Liquid_a);
		let bContINJ_AIL = (isModelAsGas ? INJ_AIL_CONT_Gas_b : INJ_AIL_CONT_Liquid_b);
		let aInstINJ_AINL = (isModelAsGas ? INJ_AINL_INST_Gas_a : INJ_AINL_INST_Liquid_a);
		let bInstINJ_AINL = (isModelAsGas ? INJ_AINL_INST_Gas_b : INJ_AINL_INST_Liquid_b);
		let aInstINJ_AIL = (isModelAsGas ? INJ_AIL_INST_Gas_a : INJ_AIL_INST_Liquid_a);
		let bInstINJ_AIL = (isModelAsGas ? INJ_AIL_INST_Gas_b : INJ_AIL_INST_Liquid_b);

		// Consequence AREA INJURIES

		let INJ_AINL_CONT1 = await (isModelAsGas ? ContinuousConstantsAB(0, INJ_AINL_CONT_Gas_a, INJ_AINL_CONT_Gas_b) : ContinuousConstantsAB(0, INJ_AINL_CONT_Liquid_a, INJ_AINL_CONT_Liquid_b));
		let INJ_AINL_CONT2 = await (isModelAsGas ? ContinuousConstantsAB(1, INJ_AINL_CONT_Gas_a, INJ_AINL_CONT_Gas_b) : ContinuousConstantsAB(1, INJ_AINL_CONT_Liquid_a, INJ_AINL_CONT_Liquid_b));
		let INJ_AINL_CONT3 = await (isModelAsGas ? ContinuousConstantsAB(2, INJ_AINL_CONT_Gas_a, INJ_AINL_CONT_Gas_b) : ContinuousConstantsAB(2, INJ_AINL_CONT_Liquid_a, INJ_AINL_CONT_Liquid_b));
		let INJ_AINL_CONT4 = await (isModelAsGas ? ContinuousConstantsAB(3, INJ_AINL_CONT_Gas_a, INJ_AINL_CONT_Gas_b) : ContinuousConstantsAB(3, INJ_AINL_CONT_Liquid_a, INJ_AINL_CONT_Liquid_b));
		let INJ_AIL_CONT1 = await (isModelAsGas ? ContinuousConstantsAB(0, INJ_AIL_CONT_Gas_a, INJ_AIL_CONT_Gas_b) : ContinuousConstantsAB(0, INJ_AIL_CONT_Liquid_a, INJ_AIL_CONT_Liquid_b));
		let INJ_AIL_CONT2 = await (isModelAsGas ? ContinuousConstantsAB(1, INJ_AIL_CONT_Gas_a, INJ_AIL_CONT_Gas_b) : ContinuousConstantsAB(1, INJ_AIL_CONT_Liquid_a, INJ_AIL_CONT_Liquid_b));
		let INJ_AIL_CONT3 = await (isModelAsGas ? ContinuousConstantsAB(2, INJ_AIL_CONT_Gas_a, INJ_AIL_CONT_Gas_b) : ContinuousConstantsAB(2, INJ_AIL_CONT_Liquid_a, INJ_AIL_CONT_Liquid_b));
		let INJ_AIL_CONT4 = await (isModelAsGas ? ContinuousConstantsAB(3, INJ_AIL_CONT_Gas_a, INJ_AIL_CONT_Gas_b) : ContinuousConstantsAB(3, INJ_AIL_CONT_Liquid_a, INJ_AIL_CONT_Liquid_b));
		let INJ_AINL_INST1 = await (isModelAsGas ? InstantaneousConstantsAB(0, INJ_AINL_INST_Gas_a, INJ_AINL_INST_Gas_b) : InstantaneousConstantsAB(0, INJ_AINL_INST_Liquid_a, INJ_AINL_INST_Liquid_b));
		let INJ_AINL_INST2 = await (isModelAsGas ? InstantaneousConstantsAB(1, INJ_AINL_INST_Gas_a, INJ_AINL_INST_Gas_b) : InstantaneousConstantsAB(1, INJ_AINL_INST_Liquid_a, INJ_AINL_INST_Liquid_b));
		let INJ_AINL_INST3 = await (isModelAsGas ? InstantaneousConstantsAB(2, INJ_AINL_INST_Gas_a, INJ_AINL_INST_Gas_b) : InstantaneousConstantsAB(2, INJ_AINL_INST_Liquid_a, INJ_AINL_INST_Liquid_b));
		let INJ_AINL_INST4 = await (isModelAsGas ? InstantaneousConstantsAB(3, INJ_AINL_INST_Gas_a, INJ_AINL_INST_Gas_b) : InstantaneousConstantsAB(3, INJ_AINL_INST_Liquid_a, INJ_AINL_INST_Liquid_b));
		let INJ_AIL_INST1 = await (isModelAsGas ? InstantaneousConstantsAB(0, INJ_AIL_INST_Gas_a, INJ_AIL_INST_Gas_b) : InstantaneousConstantsAB(0, INJ_AIL_INST_Liquid_a, INJ_AIL_INST_Liquid_b));
		let INJ_AIL_INST2 = await (isModelAsGas ? InstantaneousConstantsAB(1, INJ_AIL_INST_Gas_a, INJ_AIL_INST_Gas_b) : InstantaneousConstantsAB(1, INJ_AIL_INST_Liquid_a, INJ_AIL_INST_Liquid_b));
		let INJ_AIL_INST3 = await (isModelAsGas ? InstantaneousConstantsAB(2, INJ_AIL_INST_Gas_a, INJ_AIL_INST_Gas_b) : InstantaneousConstantsAB(2, INJ_AIL_INST_Liquid_a, INJ_AIL_INST_Liquid_b));
		let INJ_AIL_INST4 = await (isModelAsGas ? InstantaneousConstantsAB(3, INJ_AIL_INST_Gas_a, INJ_AIL_INST_Gas_b) : InstantaneousConstantsAB(3, INJ_AIL_INST_Liquid_a, INJ_AIL_INST_Liquid_b));



		let INJ_AINL_CONT = [INJ_AINL_CONT1, INJ_AINL_CONT2, INJ_AINL_CONT3, INJ_AINL_CONT4];
		let INJ_AIL_CONT = [INJ_AIL_CONT1, INJ_AIL_CONT2, INJ_AIL_CONT3, INJ_AIL_CONT4];
		let INJ_AINL_INST = [INJ_AINL_INST1, INJ_AINL_INST2, INJ_AINL_INST3, INJ_AINL_INST4];
		let INJ_AIL_INST = [INJ_AIL_INST1, INJ_AIL_INST2, INJ_AIL_INST3, INJ_AIL_INST4];


		// Consequence STEP 8.12

		async function isFactIcContinuous(rate, type) {
			return type ? await (Math.min(rate / C5, 1)) : 1;
		}

		const factIc1 = await isFactIcContinuous(rate[0], releaseType[0]);
		const factIc2 = await isFactIcContinuous(rate[1], releaseType[1]);
		const factIc3 = await isFactIcContinuous(rate[2], releaseType[2]);
		const factIc4 = await isFactIcContinuous(rate[3], releaseType[3]);

		let factIc = [factIc1, factIc2, factIc3, factIc4];

		// Consequence STEP 8.13

		async function valueFactAIT(Ts) {

			if (Ts + C6 <= AIT) {
				return 0;
			} else if (Ts - C6 >= AIT) {
				return 1;
			} else {
				return await ((Ts - AIT + C6) / (2 * C6));
			};
		}

		let factAIT = await valueFactAIT(operatingTemperature);

		// Consequence STEP 8.14

		async function caCmdInj(CA_INST, CA_CONT, fact_IC) {
			return await (CA_INST * fact_IC + CA_CONT * (1 - fact_IC));
		}

		CA_AIL_CMD1 = await caCmdInj(AIL_INST1, AIL_CONT1, factIc1);
		CA_AIL_CMD2 = await caCmdInj(AIL_INST2, AIL_CONT2, factIc2);
		CA_AIL_CMD3 = await caCmdInj(AIL_INST3, AIL_CONT3, factIc3);
		CA_AIL_CMD4 = await caCmdInj(AIL_INST4, AIL_CONT4, factIc4);

		CA_AIL_CMD = [CA_AIL_CMD1, CA_AIL_CMD2, CA_AIL_CMD3, CA_AIL_CMD4];

		CA_AIL_INJ1 = await caCmdInj(INJ_AIL_INST1, INJ_AIL_CONT1, factIc1);
		CA_AIL_INJ2 = await caCmdInj(INJ_AIL_INST2, INJ_AIL_CONT2, factIc2);
		CA_AIL_INJ3 = await caCmdInj(INJ_AIL_INST3, INJ_AIL_CONT3, factIc3);
		CA_AIL_INJ4 = await caCmdInj(INJ_AIL_INST4, INJ_AIL_CONT4, factIc4);

		CA_AIL_INJ = [CA_AIL_INJ1, CA_AIL_INJ2, CA_AIL_INJ3, CA_AIL_INJ4];

		CA_AINL_CMD1 = await caCmdInj(AINL_INST1, AINL_CONT1, factIc1);
		CA_AINL_CMD2 = await caCmdInj(AINL_INST2, AINL_CONT2, factIc2);
		CA_AINL_CMD3 = await caCmdInj(AINL_INST3, AINL_CONT3, factIc3);
		CA_AINL_CMD4 = await caCmdInj(AINL_INST4, AINL_CONT4, factIc4);

		CA_AINL_CMD = [CA_AINL_CMD1, CA_AINL_CMD2, CA_AINL_CMD3, CA_AINL_CMD4];

		CA_AINL_INJ1 = await caCmdInj(INJ_AINL_INST1, INJ_AINL_CONT1, factIc1);
		CA_AINL_INJ2 = await caCmdInj(INJ_AINL_INST2, INJ_AINL_CONT2, factIc2);
		CA_AINL_INJ3 = await caCmdInj(INJ_AINL_INST3, INJ_AINL_CONT3, factIc3);
		CA_AINL_INJ4 = await caCmdInj(INJ_AINL_INST4, INJ_AINL_CONT4, factIc4);

		CA_AINL_INJ = [CA_AINL_INJ1, CA_AINL_INJ2, CA_AINL_INJ3, CA_AINL_INJ4];

		// Consequence STEP 8.15

		async function caFlam(AIL, AINL) {
			return await (AIL * factAIT + AINL * (1 - factAIT));
		}

		CA_FLAM_CMD1 = await caFlam(CA_AIL_CMD1, CA_AINL_CMD1);
		CA_FLAM_CMD2 = await caFlam(CA_AIL_CMD2, CA_AINL_CMD2);
		CA_FLAM_CMD3 = await caFlam(CA_AIL_CMD3, CA_AINL_CMD3);
		CA_FLAM_CMD4 = await caFlam(CA_AIL_CMD4, CA_AINL_CMD4);

		CA_FLAM_CMD = [CA_FLAM_CMD1, CA_FLAM_CMD2, CA_FLAM_CMD3, CA_FLAM_CMD4];

		CA_FLAM_INJ1 = await caFlam(CA_AIL_INJ1, CA_AINL_INJ1);
		CA_FLAM_INJ2 = await caFlam(CA_AIL_INJ2, CA_AINL_INJ2);
		CA_FLAM_INJ3 = await caFlam(CA_AIL_INJ3, CA_AINL_INJ3);
		CA_FLAM_INJ4 = await caFlam(CA_AIL_INJ4, CA_AINL_INJ4);

		CA_FLAM_INJ = [CA_FLAM_INJ1, CA_FLAM_INJ2, CA_FLAM_INJ3, CA_FLAM_INJ4];

		// Consequence STEP 8.16

		CA_FLAM_CMD_FINAL = (gff[0] * CA_FLAM_CMD1 + gff[1] * CA_FLAM_CMD2 + gff[2] * CA_FLAM_CMD3 + gff[3] * CA_FLAM_CMD4) / gffTotal;
		CA_FLAM_INJ_FINAL = (gff[0] * CA_FLAM_INJ1 + gff[1] * CA_FLAM_INJ2 + gff[2] * CA_FLAM_INJ3 + gff[3] * CA_FLAM_INJ4) / gffTotal;


		// TOXIC Consequence

		// Consequence STEP 9.1

		ldTox1 = Math.min(3600, (mass1 / Wn[0]), (60 * ldMax1));
		ldTox2 = Math.min(3600, (mass2 / Wn[1]), (60 * ldMax2));
		ldTox3 = Math.min(3600, (mass3 / Wn[2]), (60 * ldMax3));
		ldTox4 = Math.min(3600, (mass4 / Wn[3]), (60 * ldMax4));

		ldTox = [ldTox1, ldTox2, ldTox3, ldTox4];

		// Consequence STEP 9.2

		const toxicFluid = vessel.toxicComposition;
		const mFracTox = vessel.percentToxicFluid / 100;

		// Consequence STEP 9.3

		rateTox = Wn.map(el => { return (mFracTox * el) });
		massTox = mass.map(el => { return (mFracTox * el) });

		// Consequence STEP 9.4 --> STEP 9.5 falta fazer

		// Ver os tempos menor e maior para fazer a extrapolação, se necessário

		async function determineCD_HF_H2S(time, fluid) {
			// Verifica se o tempo está na tabela ou quais são os imediatamente superiores e inferiores
			const temposTabela = [5, 10, 20, 40, 60];
			function testeTempo(x) {
				for (let i = 0; i < temposTabela.length; i++) {
					if (x == temposTabela[i]) {
						return ([temposTabela[i], temposTabela[i]]);
						break;
					} else if (x < temposTabela[0]) {
						return ([temposTabela[0], temposTabela[0]]);
						break
					} else if (x > temposTabela[i] && x < temposTabela[i + 1]) {
						return ([temposTabela[i], temposTabela[++i]]);
						break;
					} else if (x > 60) {
						return ([60, 60]);
						break;
					}
				}
			}
			const tempos = await testeTempo(time);
			const t1 = tempos[0]; // tempo menor
			const t2 = tempos[1]; // tempo maior
			const c_d_parameters = await determine_c_d_parameters(fluid);
			async function determine_c_d_parameters(fluid) {
				if (fluid == "H2S") {
					const ct1 = await time_P3_T4_11(t1).then(el => { return el.H2S_c });
					const ct2 = await time_P3_T4_11(t2).then(el => { return el.H2S_c });
					const dt1 = await time_P3_T4_11(t1).then(el => { return el.H2S_d });
					const dt2 = await time_P3_T4_11(t2).then(el => { return el.H2S_d });

					return await ([ct1, ct2, dt1, dt2]);
				} else {
					const ct1 = await time_P3_T4_11(t1).then(el => { return el.HF_Acid_c });
					const ct2 = await time_P3_T4_11(t2).then(el => { return el.HF_Acid_c });
					const dt1 = await time_P3_T4_11(t1).then(el => { return el.HF_Acid_d });
					const dt2 = await time_P3_T4_11(t2).then(el => { return el.HF_Acid_d });
					return await ([ct1, ct2, dt1, dt2]);
				}
			}
			const c1 = c_d_parameters[0];
			const c2 = c_d_parameters[1];
			const d1 = c_d_parameters[2];
			const d2 = c_d_parameters[3];

			const c = await (c1 == c2 ? c2 : (((time - t1) * (c2 - c1) / (t2 - t1)) + c1));
			const d = await (d1 == d2 ? d2 : (((time - t1) * (d2 - d1) / (t2 - t1)) + d1));
			return ([c, d]);
		}

		async function determineEF_Ammonia_Chlorine(time, fluid) {
			// Verifica se o tempo está na tabela ou quais são os imediatamente superiores e inferiores
			const temposTabela = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];
			function testeTempo(x) {
				for (let i = 0; i < temposTabela.length; i++) {
					if (x == temposTabela[i]) {
						return ([temposTabela[i], temposTabela[i]]);
						break;
					} else if (x < temposTabela[0]) {
						return ([temposTabela[0], temposTabela[0]]);
						break
					} else if (x > temposTabela[i] && x < temposTabela[i + 1]) {
						return ([temposTabela[i], temposTabela[++i]]);
						break;
					} else if (x > 60) {
						return ([60, 60]);
						break;
					}
				}
			}
			const tempos = await testeTempo(time);
			const t1 = tempos[0]; // tempo menor
			const t2 = tempos[1]; // tempo maior

			const e_f_parameters = await determine_e_f_parameters(fluid);
			async function determine_e_f_parameters(fluid) {
				if (fluid == "Ammonia") {
					const et1 = await time_P3_T4_12(t1).then(el => { return el.Ammonia_e });
					const et2 = await time_P3_T4_12(t2).then(el => { return el.Ammonia_e });
					const ft1 = await time_P3_T4_12(t1).then(el => { return el.Ammonia_f });
					const ft2 = await time_P3_T4_12(t2).then(el => { return el.Ammonia_f });

					return await ([et1, et2, ft1, ft2]);
				} else {
					const et1 = await time_P3_T4_12(t1).then(el => { return el.Chlorine_e });
					const et2 = await time_P3_T4_12(t2).then(el => { return el.Chlorine_e });
					const ft1 = await time_P3_T4_12(t1).then(el => { return el.Chlorine_f });
					const ft2 = await time_P3_T4_12(t2).then(el => { return el.Chlorine_f });
					return await ([et1, et2, ft1, ft2]);
				}
			}
			const e1 = e_f_parameters[0];
			const e2 = e_f_parameters[1];
			const f1 = e_f_parameters[2];
			const f2 = e_f_parameters[3];

			const e = await (e1 == e2 ? e2 : (((time - t1) * (e2 - e1) / (t2 - t1)) + e1));
			const f = await (f1 == f2 ? f2 : (((time - t1) * (f2 - f1) / (t2 - t1)) + f1));
			return ([e, f]);
		}

		async function determineEF_OtherFluid(time, fluid, isGas, Continuous) {
			// Verifica se o tempo está na tabela ou quais são os imediatamente superiores e inferiores
			const temposTabela = [3, 5, 10, 20, 40, 60];
			function testeTempo(x) {
				for (let i = 0; i < temposTabela.length; i++) {
					if (x == temposTabela[i]) {
						return ([temposTabela[i], temposTabela[i]]);
						break;
					} else if (x < temposTabela[0]) {
						return ([temposTabela[0], temposTabela[0]]);
						break
					} else if (x > temposTabela[i] && x < temposTabela[i + 1]) {
						return ([temposTabela[i], temposTabela[++i]]);
						break;
					} else if (x > 60) {
						return ([60, 60]);
						break;
					}
				}
			}
			const tempos = await testeTempo(time);
			const t1 = await (Continuous ? tempos[0] : 3); // tempo menor
			const t2 = await (Continuous ? tempos[1] : 3); // tempo maior

			const e_f_parameters = await determine_e_f_parameters(fluid);
			async function determine_e_f_parameters(fluid) {
				if (fluid == "CO") {
					const eg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_e });
					const eg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_e });
					const fg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_f });
					const fg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_f });

					const el1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_e });
					const el2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_e });
					const fl1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_f });
					const fl2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_f });

					const valoresEF = await (isGas ? [eg1, eg2, fg1, fg2] : [el1, el2, fl1, fl2]);
					return valoresEF;
				} else if (fluid == "HCl(Gas)") {
					const eg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_e });
					const eg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_e });
					const fg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_f });
					const fg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_f });

					const el1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_e });
					const el2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_e });
					const fl1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_f });
					const fl2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_f });

					const valoresEF = await (isGas ? [eg1, eg2, fg1, fg2] : [el1, el2, fl1, fl2]);
					return valoresEF;
				} else if (fluid == "Nitric acid") {
					const eg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_e });
					const eg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_e });
					const fg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_f });
					const fg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_f });

					const el1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_e });
					const el2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_e });
					const fl1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_f });
					const fl2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_f });

					const valoresEF = await (isGas ? [eg1, eg2, fg1, fg2] : [el1, el2, fl1, fl2]);
					return valoresEF;
				} else if (fluid == "NO2") {
					const eg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_e });
					const eg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_e });
					const fg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_f });
					const fg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_f });

					const el1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_e });
					const el2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_e });
					const fl1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_f });
					const fl2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_f });

					const valoresEF = await (isGas ? [eg1, eg2, fg1, fg2] : [el1, el2, fl1, fl2]);
					return valoresEF;
				} else if (fluid == "Phosgene") {
					const eg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_e });
					const eg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_e });
					const fg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_f });
					const fg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_f });

					const el1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_e });
					const el2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_e });
					const fl1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_f });
					const fl2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_f });

					const valoresEF = await (isGas ? [eg1, eg2, fg1, fg2] : [el1, el2, fl1, fl2]);
					return valoresEF;
				} else if (fluid == "TDI") {
					const eg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_e });
					const eg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_e });
					const fg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_f });
					const fg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_f });

					const el1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_e });
					const el2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_e });
					const fl1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_f });
					const fl2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_f });

					const valoresEF = await (isGas ? [eg1, eg2, fg1, fg2] : [el1, el2, fl1, fl2]);
					return valoresEF;
				} else if (fluid == "EE") {
					const eg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_e });
					const eg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_e });
					const fg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_f });
					const fg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_f });

					const el1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_e });
					const el2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_e });
					const fl1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_f });
					const fl2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_f });

					const valoresEF = await (isGas ? [eg1, eg2, fg1, fg2] : [el1, el2, fl1, fl2]);
					return valoresEF;
				} else if (fluid == "EO") {
					const eg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_e });
					const eg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_e });
					const fg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_f });
					const fg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_f });

					const el1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_e });
					const el2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_e });
					const fl1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_f });
					const fl2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_f });

					const valoresEF = await (isGas ? [eg1, eg2, fg1, fg2] : [el1, el2, fl1, fl2]);
					return valoresEF;
				} else if (fluid == "PO") {
					const eg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_e });
					const eg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_e });
					const fg1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Gas_Release_Constants_f });
					const fg2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Gas_Release_Constants_f });

					const el1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_e });
					const el2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_e });
					const fl1 = await time_P3_T4_13(fluid, t1).then(el => { return el.Liquid_Release_Constants_f });
					const fl2 = await time_P3_T4_13(fluid, t2).then(el => { return el.Liquid_Release_Constants_f });

					const valoresEF = await (isGas ? [eg1, eg2, fg1, fg2] : [el1, el2, fl1, fl2]);
					return valoresEF;
				} else {
					return await ([0, 0, 0, 0]);
				}
			}
			const e1 = e_f_parameters[0];
			const e2 = e_f_parameters[1];
			const f1 = e_f_parameters[2];
			const f2 = e_f_parameters[3];

			const e = await (e1 == e2 ? e2 : (((time - t1) * (e2 - e1) / (t2 - t1)) + e1));
			const f = await (f1 == f2 ? f2 : (((time - t1) * (f2 - f1) / (t2 - t1)) + f1));

			console.log(e, f);
			return ([e, f]);
		}

		async function time_P3_T4_11(tempoTeste) { return await Tables.P3_T4_11.findOne({ where: { Continuous_Releases_Duration_minutes: tempoTeste }, raw: true }) };
		async function time_P3_T4_12(tempoTeste) { return await Tables.P3_T4_12.findOne({ where: { Continuous_Releases_Duration_minutes: tempoTeste }, raw: true }) };
		async function time_P3_T4_13(fluid, tempoTeste) { return await Tables.P3_T4_13.findOne({ where: { Chemical: fluid, Release_Duration_minutes: tempoTeste }, raw: true }) };

		async function caToxCont_HF_H2S(c, d, rate) {
			return await (C8 * ((C4B * rate) ** c * 10 ** d));
		}
		async function caToxInst_HF_H2S(c, d, mass) {
			return await (C8 * ((C4B * mass) ** c * 10 ** d));
		}
		async function caToxCont_Ammonia_Chlorine(e, f, rate) {
			return await (e * Math.pow(rate, f));
		}
		async function caToxInst_Ammonia_Chlorine(e, f, mass) {
			return await (e * Math.pow(mass, f));
		}

		async function whatIsTheToxicFluid(fluid, isContinuous, rateTox, massTox, ldTox) {
			let ldMaxEmMinutos = ldTox / 60;
			let c, d, cdInst, e, f, efInst;

			switch (fluid) {
				case "HF":
					const HF_c_d = await determineCD_HF_H2S(ldMaxEmMinutos, fluid);
					c = await HF_c_d[0];
					d = await HF_c_d[1];
					cdInst = [1.4056, 0.33606];
					return await (isContinuous ? caToxCont_HF_H2S(c, d, rateTox) : caToxInst_HF_H2S(cdInst[0], cdInst[1], massTox));
					break;
				case "H2S":
					const H2S_c_d = await determineCD_HF_H2S(ldMaxEmMinutos, fluid);
					c = await H2S_c_d[0];
					d = await H2S_c_d[1];
					cdInst = [0.9674, 2.784];
					return await (isContinuous ? caToxCont_HF_H2S(c, d, rateTox) : caToxInst_HF_H2S(cdInst[0], cdInst[1], massTox));
					break;
				case "Ammonia":
					const Ammonia_e_f = await determineEF_Ammonia_Chlorine(ldMaxEmMinutos, fluid);
					e = await Ammonia_e_f[0];
					f = await Ammonia_e_f[1];
					efInst = [2.684, 0.9011];
					return await (isContinuous ? caToxCont_Ammonia_Chlorine(e, f, rateTox) : caToxInst_Ammonia_Chlorine(efInst[0], efInst[1], massTox));
					break;
				case "Chlorine":
					const Chlorine_e_f = await determineEF_Ammonia_Chlorine(ldMaxEmMinutos, fluid);
					e = await Chlorine_e_f[0];
					f = await Chlorine_e_f[1];
					efInst = [3.528, 1.177];
					return await (isContinuous ? caToxCont_Ammonia_Chlorine(e, f, rateTox) : caToxInst_Ammonia_Chlorine(efInst[0], efInst[1], massTox));
					break;
				case "AlCl3":
					e = await (isModelAsGas ? 3.4531 : 0)
					f = await (isModelAsGas ? 0.9411 : 0)
					return await (caToxCont_Ammonia_Chlorine(e, f, rateTox));
				default:
					const OtherFluid_e_f = await determineEF_OtherFluid(ldMaxEmMinutos, fluid, /*isModelAsGas*/true, isContinuous);
					e = await OtherFluid_e_f[0];
					f = await OtherFluid_e_f[1];
					return await (caToxCont_Ammonia_Chlorine(e, f, rateTox));
					break;
			}
		}

		const COFTox1 = await whatIsTheToxicFluid(toxicFluid, releaseType1, rateTox[0], massTox[0], ldTox1);
		const COFTox2 = await whatIsTheToxicFluid(toxicFluid, releaseType2, rateTox[1], massTox[1], ldTox2);
		const COFTox3 = await whatIsTheToxicFluid(toxicFluid, releaseType3, rateTox[2], massTox[2], ldTox3);
		const COFTox4 = await whatIsTheToxicFluid(toxicFluid, releaseType4, rateTox[3], massTox[3], ldTox4);

		CA_TOX = [COFTox1, COFTox2, COFTox3, COFTox4];

		// STEP 9.6
		CA_TOX_INJ_FINAL = (gff[0] * CA_TOX[0] + gff[1] * CA_TOX[1] + gff[2] * CA_TOX[2] + gff[3] * CA_TOX[3]) / gffTotal;


		// STEP 10.1 //falta acid caustic

		async function CA_AcidCaustic_CONT() {
			AcidCausticArray = [194.28, 392.588, 755.408];
			let indexDet = () => {
				if (operatingPressure <= 103.4) {
					return 0;
				} else if (operatingPressure > 206.8) {
					return 2;
				} else {
					return 1;
				}
			}
			let indexAcidCausticArray = await indexDet();

			async function acidCausticP3_T4_9() { return await Tables.P3_T4_9.findOne({ where: { Fluid: "Acid/Caustic", AINL_CONT_Liquid_a: AcidCausticArray[indexAcidCausticArray] }, raw: true }) }
			const AcidCausticTable = await acidCausticP3_T4_9();

			const a = AcidCausticTable.AINL_CONT_Liquid_a;
			const b = AcidCausticTable.AINL_CONT_Liquid_b;
			const x = 1; /////// X é a fração molar do componente. Fui conservatico e coloquei x = 1.
			const CA = 0.2 * a * Math.pow(x, b); 
			return await CA;
		}
		async function CA_Vapor_CONT() {
			const CA = rate.map((el, index) => {
				return (C9 * el)
			});
			return CA;
		}
		async function CA_Vapor_INST() {
			const CA = mass.map((el, index) => {
				return (C10 * Math.pow(el, 0.6384));
			});
			return CA;
		}

		const CA_NFNT_CONT_AcidCaustic = await (representativeFluid == "Acid/Caustic" ? CA_AcidCaustic_CONT() : [0, 0, 0, 0]);
		const CA_NFNT_CONT_VAPOR = await (representativeFluid == "Steam" ? CA_Vapor_CONT() : [0, 0, 0, 0]);
		const CA_NFNT_INST = await (representativeFluid == "Steam" ? CA_Vapor_INST() : [0, 0, 0, 0]);

		const CA_NFNT_CONT = await (representativeFluid == "Steam" ? CA_NFNT_CONT_VAPOR : CA_NFNT_CONT_AcidCaustic);
		// STEP 10.2 //

		async function CA_Vapor_factIC() {
			const fact = rate.map((el, index) => {
				return (Math.min(el / C5, 1));
			});
			return fact;
		}
		
		const fact_IC_NFNT = await (representativeFluid == "Steam" ? CA_Vapor_factIC() : [0, 0, 0, 0]);

		// STEP 10.3 //falta acid caustic

		// async function CA_leak_calculate(){
		// 	const caLeak = dn.map((el, i) => {
		// 		return (Math.min(el / C5, 1));
		// 	});
		// 	return caLeak;
		// }
		const CA_leak_INJ = await dn.map((el, i) => {return (CA_NFNT_INST[i]*fact_IC_NFNT[i]+CA_NFNT_CONT[i]*(1-fact_IC_NFNT[i]));});;

		// STEP 10.4 //

		const CA_NFNT_INJ_FINAL = (gff[0] * CA_leak_INJ[0] + gff[1] * CA_leak_INJ[1] + gff[2] * CA_leak_INJ[2] + gff[3] * CA_leak_INJ[3]) / gffTotal;

		// STEP 11.1 STEP 11.2 STEP 11.3 //
		const CA_cmd_final = CA_FLAM_INJ_FINAL;
		const CA_inj_final = Math.max(CA_FLAM_INJ_FINAL, CA_TOX_INJ_FINAL, CA_NFNT_INJ_FINAL);
		const CA_final = Math.max(CA_cmd_final, CA_inj_final);



		/******************** PAREI AQUI --> Página 413 do API célula LQ7 da planilha*/

		res.render("admin/resultado/vessel/index", {
			siteAll: siteAll,
			equipmentAll: equipmentAll,
			componentAll: componentAll,
			site: site,
			siteId: siteId,
			equipment: equipment,
			equipmentId: equipmentId,
			equipmentType: equipmentType,
			component: component,
			componentId: componentId,
			vessel: vessel,
			vesselId: vessel.id,

			liquidDensity: liquidDensity,
			vaporDensity: vaporDensity,
			MW: MW,
			k: k,
			Cp: Cp,
			AIT: AIT, //AIT,
			storedFluidPhase: storedFluidPhase,
			ambientState: ambientState,
			isModelAsGas: (isModelAsGas ? "Gas" : "Liquid"),
			dn: dn,
			gff: gff,
			An: area_n,
			Wn: Wn,
			massComp: massComp,
			massInv: massInv,
			massAdd: massAdd,
			massAvail: massAvail,
			releaseType: releaseType.map(el => { return (el ? "Continuous" : "Instantaneous") }),
			factDi: factDi,
			ldMax: ldMax,
			rate: rate,
			ld: ld,
			mass: mass,
			factMit: factMit,
			eneff: eneff,
			fluidType: fluidType,
			Ptrans: Ptrans,

			AINL_Cont_a: aContAINL,
			AINL_Cont_b: bContAINL,
			AIL_Cont_a: aContAIL,
			AIL_Cont_b: bContAIL,
			AINL_Inst_a: aInstAINL,
			AINL_Inst_b: bInstAINL,
			AIL_Inst_a: aInstAIL,
			AIL_Inst_b: bInstAIL,
			AINL_CONT: AINL_CONT,
			AIL_CONT: AIL_CONT,
			AINL_INST: AINL_INST,
			AIL_INST: AIL_INST,

			INJ_AINL_Cont_a: aContINJ_AINL,
			INJ_AINL_Cont_b: bContINJ_AINL,
			INJ_AIL_Cont_a: aContINJ_AIL,
			INJ_AIL_Cont_b: bContINJ_AIL,
			INJ_AINL_Inst_a: aInstINJ_AINL,
			INJ_AINL_Inst_b: bInstINJ_AINL,
			INJ_AIL_Inst_a: aInstINJ_AIL,
			INJ_AIL_Inst_b: bInstINJ_AIL,
			INJ_AINL_CONT: INJ_AINL_CONT,
			INJ_AIL_CONT: INJ_AIL_CONT,
			INJ_AINL_INST: INJ_AINL_INST,
			INJ_AIL_INST: INJ_AIL_INST,

			factIC: factIc,
			factAIT: factAIT,

			CA_AIL_CMD: CA_AIL_CMD,
			CA_AIL_INJ: CA_AIL_INJ,
			CA_AINL_INJ: CA_AINL_INJ,
			CA_AINL_INJ: CA_AINL_INJ,
			CA_FLAM_CMD: CA_FLAM_CMD,
			CA_FLAM_INJ: CA_FLAM_INJ,
			CA_FLAM_CMD_FINAL: CA_FLAM_CMD_FINAL,
			CA_FLAM_INJ_FINAL: CA_FLAM_INJ_FINAL,

			toxicFluid: toxicFluid,
			ldTox: ldTox,
			rateTox: rateTox,
			massTox: massTox,
			constante_cdef_CA_TOX: "Pendente exibição", // PENDENTE DE FAZER
			CA_TOX: CA_TOX,
			CA_TOX_INJ_FINAL: CA_TOX_INJ_FINAL,

			CA_NFNT_CONT: CA_NFNT_CONT,
			CA_NFNT_INST: CA_NFNT_INST,
			fact_IC_NFNT: fact_IC_NFNT,
			CA_leak_INJ: CA_leak_INJ,
			CA_NFNT_INJ_FINAL: CA_NFNT_INJ_FINAL,
			CA_cmd_final: CA_cmd_final,
			CA_inj_final: CA_inj_final,
			CA_final: CA_final,
		});

	}

	ConsequenceVessel();
});

module.exports = router;
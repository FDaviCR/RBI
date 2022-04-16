const express = require("express");
const router = express.Router();
const Vessel = require("../models/Vessel");
const Site = require("../models/Site");
const Equipment = require("../models/Equipment");
const Component = require("../models/Component");
const InventoryGroup = require("../models/InventoryGroup");
const Tables = require("../database/Tables");

router.get("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component/:componentId/vesselview/new", (req, res)=>{

	let siteId = req.params.siteId;
	let equipment = req.params.equipment;
	let equipmentType = req.params.equipmentType;
	let equipmentId = req.params.equipmentId
	let component = req.params.component;
	let componentId = req.params.componentId;

	Site.findByPk(siteId).then(site=>{
		Equipment.findByPk(equipmentId).then(equipment=>{
			Component.findByPk(componentId).then(component=>{
				
				Vessel.create({
					equipmentId: equipmentId,
					componentId: componentId,
					siteId: siteId,
					detectionSystem: null,
					isolationSystem: null,
					mitigationSystem: null,
					// inventoryGroupId: 1,
					operatingPressure: null,
					operatingTemperature: null,
					insideDiameter: null,
					volumeComponent: null,
					representativeFluid: null,
					storedFluidPhase: null,
					percentLiquid: null,
					reynolds: null,
					toxicComposition: null,
					percentToxicFluid: null,
					idlh: null,
			///////////////////////////////////DADOS DE INSPEÇÃO ///////////////////////////////////////////////////
					installationDate: null,
					lastInspectionInterna: null,
					rbiDate: null,
					planDate: null,
					turnaroundDate1: null,
					turnaroundDate2: null,
					prazoMax: null,
					maximumProcessTemperature: null,
					steamTrace: null,
					steamOut: null,
					pwht: null,
					
	//////////////////////////// MECANISMOS DE DANO //////////////////////////////////////////

					thinning: true,
					lining: false,
					sccCaustic: false,
					sccAmine: false,
					sccSulfide: false,
					hicSohicH2S: false,
					acscc: false,
					pascc: false,
					sccChloride: false,
					hscHF: false,
					hicSohicHF: false,
					externalFerritic: false,
					cuiFerritic: false,
					extclsccAustenitic: false,
					cuiExtclsccAustenitic: false,
					htha: false,
					brittleFracture: false,
					lowAlloySteelEmbrittlement: false,
					embrittlement885F: false,
					sigmaPhaseEmbrittlement: false,
					pipingMechanicalFatigue: false,
		
		//////////////////////////// DADOS THINNING //////////////////////////////////////////

					furnishedThickness: null,
					minimumRequiredThickness: null,
					minimumStructuralThickness: null,
					hasClad: null,
					cladThickness: null,
					lastInspectionThinning: null,
					trdi: null,
					cr_Bm: null,
					cr_Cm: null,
					corrosionType: null,
					confidenceData: null,
					shapeFactor: null,
					yieldStrength: null,
					tensileStrength: null,
					jointEfficiency: null,
					allowableStress: null,
					thinningMechanism: null,
					adjustmentFactorsThinning: null,
					fipThinning: null,
					fdlhinning: null,
					N_A_Thinning: null,
					N_B_Thinning: null,
					N_C_Thinning: null,
					N_D_Thinning: null,
				});

				
					Vessel.findOne({
						where: {
							componentId: componentId,
						},
						raw:true}).then(vessel=>{
							res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component/"+componentId+"/vesselview/"+vessel.id);
						});
			});
		});
	});
});


router.get("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component/:componentId/vesselview/:vesselId", (req, res)=>{

	let siteId = req.params.siteId;
	let equipment = req.params.equipment;
	let equipmentType = req.params.equipmentType;
	let equipmentId = req.params.equipmentId
	let component = req.params.component;
	let componentId = req.params.componentId;
	let vesselId = req.params.vesselId;

	Tables.P3_T4_1.findAll({raw:true}).then(fluid=>{
		Tables.P2_T4_8.findAll({raw:true}).then(thinningMechanism=>{
			Site.findAll({ where: {ativo:1}, raw: true, order:[
				['site','ASC']
				]}).then((siteAll)=>{
					Equipment.findAll({ where: {ativo:1}, raw: true, order:[
						['equipment','ASC']
						]}).then((equipmentAll)=>{
							Component.findAll({ where: {ativo:1}, raw: true, order:[
								['component','ASC']
								]}).then((componentAll)=>{

								Site.findByPk(siteId).then(site=>{
									Equipment.findByPk(equipmentId).then(equipment=>{
										Component.findByPk(componentId).then(component=>{
											InventoryGroup.findAll({raw:true}).then(inventory=>{
												Vessel.findByPk(vesselId).then(vessel=>{
													res.render("admin/cadastro/vessel/index",{
														vessel: vessel,
														vesselId: vesselId,
														component: component,
														componentId: componentId,
														equipmentId: equipmentId,
														site: site,
														siteId: siteId,
														equipmentType: equipmentType,
														equipment: equipment,
														representativeFluidOptions: fluid.map(el=>{return el.Representative_Fluid}),
														thinningMechanismOptions: thinningMechanism.map(el=>{return el.ThinningMechanism_fom}),
													//	inventory: inventory,
														inventoryGroupOptions: inventory.map(el=>{return el.inventoryGroupName}),
														inventoryGroupOptionsId: inventory.map(el=>{return el.id}),
														siteAll: siteAll,
														equipmentAll: equipmentAll,
														componentAll: componentAll,
														});
												});
											});
										});
									});
								});
							});
						});
					});
				});			
						
						
						
		});
	});

router.post("/cadastro/component/vessel/save", (req, res)=>{
	let equipmentId = req.body.equipmentId;
	let componentId = req.body.componentId;
	let siteId = req.body.siteId;
	let vesselId = req.body.vesselId;
	let equipmentType = req.body.equipmentType;
	let detectionSystem = req.body.detectionSystem;
	let isolationSystem = req.body.isolationSystem;
	let mitigationSystem = req.body.mitigationSystem;
	let inventoryGroupId = req.body.inventoryGroupId;
	let userInventoryGroupMass = req.body.userInventoryGroupMass;
	let operatingPressure = req.body.operatingPressure;
	let operatingTemperature = req.body.operatingTemperature;
	let insideDiameter = req.body.insideDiameter;
	let volumeComponent = req.body.volumeComponent;
	let representativeFluid = req.body.representativeFluid;
	let storedFluidPhase = req.body.storedFluidPhase;
	let percentLiquid = req.body.percentLiquid;
	let reynolds = req.body.reynolds;
	let toxicComposition = req.body.toxicComposition;
	let percentToxicFluid = req.body.percentToxicFluid;
	let idlh = function(fluid, percentFluid){
				let percent = percentFluid*10000;
				if(fluid == "HF" && percent >= 30){
						return(true);
					} else if(fluid == "H2S" && percent >= 100){
						return(true);
					} else if(fluid == "Ammonia" && percent >= 10){
						return(true);
					} else if(fluid == "Chlorine" && percent >= 10){
						return(true);
					} else if(fluid == "AlCl3" && percent >= 0){
						return(true);
					} else if(fluid == "CO" && percent >= 1200){
						return(true);
					} else if(fluid == "HCl(Gas)" && percent >= 50){
						return(true);
					} else{
						return(false);
			}
		}
	
////////////////////////////////DADOS DE INSPEÇÃO ////////////////////////////////////////////////
	let installationDate = req.body.installationDate;
	let lastInspectionInterna = req.body.lastInspectionInterna;
	let rbiDate = req.body.rbiDate;
	let planDate = req.body.planDate;
	let turnaroundDate1 = req.body.turnaroundDate1;
	let turnaroundDate2 = req.body.turnaroundDate2;
	let prazoMax = req.body.prazoMax;
	let maximumProcessTemperature = req.body.maximumProcessTemperature;
	let steamTrace = req.body.steamTrace;
	let steamOut = req.body.steamOut;
	let pwht = req.body.pwht;
	
	//////////////////////////// MECANISMOS DE DANO //////////////////////////////////////////

	let thinning = Boolean(req.body.thinning);
	let lining = Boolean(req.body.lining);
	let sccCaustic = Boolean(req.body.sccCaustic);
	let sccAmine = Boolean(req.body.sccAmine);
	let sccSulfide = Boolean(req.body.sccSulfide);
	let hicSohicH2S = Boolean(req.body.hicSohicH2S);
	let acscc = Boolean(req.body.acscc);
	let pascc = Boolean(req.body.pascc);
	let sccChloride = Boolean(req.body.sccChloride);
	let hscHF = Boolean(req.body.hscHF);
	let hicSohicHF = Boolean(req.body.hicSohicHF);
	let externalFerritic = Boolean(req.body.externalFerritic);
	let cuiFerritic = Boolean(req.body.cuiFerritic);
	let extclsccAustenitic = Boolean(req.body.extclsccAustenitic);
	let cuiExtclsccAustenitic = Boolean(req.body.cuiExtclsccAustenitic);
	let htha = Boolean(req.body.htha);
	let brittleFracture = Boolean(req.body.brittleFracture);
	let lowAlloySteelEmbrittlement = Boolean(req.body.lowAlloySteelEmbrittlement);
	let embrittlement885F = Boolean(req.body.embrittlement885F);
	let sigmaPhaseEmbrittlement = Boolean(req.body.sigmaPhaseEmbrittlement);
	let pipingMechanicalFatigue = Boolean(req.body.pipingMechanicalFatigue);

	//////////////////////////// DADOS THINNING //////////////////////////////////////////
	
	let furnishedThickness = req.body.furnishedThickness;
	let minimumRequiredThickness = req.body.minimumRequiredThickness;
	let minimumStructuralThickness = req.body.minimumStructuralThickness;
	let hasClad = req.body.hasClad;
	let cladThickness = req.body.cladThickness;
	let lastInspectionThinning = req.body.lastInspectionThinning;
	let trdi = req.body.trdi;
	let cr_Bm = req.body.cr_Bm;
	let cr_Cm = req.body.cr_Cm;
	let corrosionType = req.body.corrosionType;
	let confidenceData = req.body.confidenceData;
	let shapeFactor = req.body.shapeFactor;
	let yieldStrength = req.body.yieldStrength;
	let tensileStrength = req.body.tensileStrength;
	let jointEfficiency = req.body.jointEfficiency;
	let allowableStress = req.body.allowableStress;
	let thinningMechanism = req.body.thinningMechanism;
	let adjustmentFactorsThinning = req.body.adjustmentFactorsThinning;
	let fipThinning = req.body.fipThinning;
	let fdlhinning = req.body.fdlhinning;
	let N_A_Thinning = req.body.N_A_Thinning;
	let N_B_Thinning = req.body.N_B_Thinning;
	let N_C_Thinning = req.body.N_C_Thinning;
	let N_D_Thinning = req.body.N_D_Thinning;


///////////////////////////////////HISTÓRICO DE INSPEÇÃO ///////////////////////////////////////////////////
async function saveVessel(){
	
	async function componenteAtual(){return await Component.findByPk(componentId)};
	const componente = await componenteAtual();
	
	
	async function vasoAtual(){return await Vessel.findByPk(vesselId)};
	const vaso = await vasoAtual();
	
	componente.update({inventoryGroupId: inventoryGroupId});
	vaso.update({
		equipmentId: equipmentId,
			componentId: componentId,
			siteId: siteId,
			detectionSystem: detectionSystem,
			isolationSystem: isolationSystem,
			mitigationSystem: mitigationSystem,
			userInventoryGroupMass: userInventoryGroupMass,
			operatingPressure: operatingPressure,
			operatingTemperature: operatingTemperature,
			insideDiameter: insideDiameter,
			volumeComponent: volumeComponent,
			representativeFluid: representativeFluid,
			storedFluidPhase: storedFluidPhase,
			percentLiquid: percentLiquid,
			reynolds: reynolds,
			toxicComposition: toxicComposition,
			percentToxicFluid: percentToxicFluid,
			idlh: idlh(toxicComposition, percentToxicFluid),
	///////////////////////////////////DADOS DE INSPEÇÃO ///////////////////////////////////////////////////
			installationDate: installationDate,
			lastInspectionInterna: lastInspectionInterna,
			rbiDate: rbiDate,
			planDate: planDate,
			turnaroundDate1: turnaroundDate1,
			turnaroundDate2: turnaroundDate2,
			prazoMax: prazoMax,
			maximumProcessTemperature: maximumProcessTemperature,
			steamTrace: steamTrace,
			steamOut: steamOut,
			pwht: pwht,
			
	//////////////////////////// MECANISMOS DE DANO //////////////////////////////////////////

			thinning: thinning,
			lining: lining,
			sccCaustic: sccCaustic,
			sccAmine: sccAmine,
			sccSulfide: sccSulfide,
			hicSohicH2S: hicSohicH2S,
			acscc: acscc,
			pascc: pascc,
			sccChloride: sccChloride,
			hscHF: hscHF,
			hicSohicHF: hicSohicHF,
			externalFerritic: externalFerritic,
			cuiFerritic: cuiFerritic,
			extclsccAustenitic: extclsccAustenitic,
			cuiExtclsccAustenitic: cuiExtclsccAustenitic,
			htha: htha,
			brittleFracture: brittleFracture,
			lowAlloySteelEmbrittlement: lowAlloySteelEmbrittlement,
			embrittlement885F: embrittlement885F,
			sigmaPhaseEmbrittlement: sigmaPhaseEmbrittlement,
			pipingMechanicalFatigue: pipingMechanicalFatigue,
			
	//////////////////////////// DADOS THINNING //////////////////////////////////////////

			furnishedThickness: furnishedThickness,
			minimumRequiredThickness: minimumRequiredThickness,
			minimumStructuralThickness: minimumStructuralThickness,
			hasClad: hasClad,
			cladThickness: cladThickness,
			lastInspectionThinning: lastInspectionThinning,
			trdi: trdi,
			cr_Bm: cr_Bm,
			cr_Cm: cr_Cm,
			corrosionType: corrosionType,
			confidenceData: confidenceData,
			shapeFactor: shapeFactor,
			yieldStrength: yieldStrength,
			tensileStrength: tensileStrength,
			jointEfficiency: jointEfficiency,
			allowableStress: allowableStress,
			thinningMechanism: thinningMechanism,
			adjustmentFactorsThinning: adjustmentFactorsThinning,
			fipThinning: fipThinning,
			fdlhinning: fdlhinning,
			N_A_Thinning: N_A_Thinning,
			N_B_Thinning: N_B_Thinning,
			N_C_Thinning: N_C_Thinning,
			N_D_Thinning: N_D_Thinning,		
	});
}

saveVessel()
	.then(()=>{
		console.log("Salvo com sucesso");
		res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component/"+componentId+"/vesselview/"+ vesselId);
	}).catch(()=>{
		console.log("Erro");
		res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component/"+componentId+"/vesselview/"+ vesselId);
	});

});

module.exports = router;
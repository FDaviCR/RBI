const express = require("express");
const router = express.Router();
const Component = require("../models/Component");
const Equipment = require("../models/Equipment");
const Site = require("../models/Site");
const { Op } = require("sequelize");


/* ARQUIVOU O SITE */

router.get("/cadastro/site/archive/:siteId/equipment/", (req, res)=>{
	let siteId = req.params.siteId;
	
	Site.findByPk(siteId).then(site=>{
		Equipment.findAll({ 
		where: {
				siteId: siteId,
				[Op.or]: [
				  { ativo: 0 },
				  { siteAtivo: 0},
				]
			  },
		 
			raw: true, 
			order:[
			['equipment','ASC']
		]}).then(equipment=>{
			res.render("admin/cadastro/archive/site-archive",{
				equipment: equipment,
				siteId: siteId,
				site: site,
			});
		});
	});
});

router.get("/cadastro/site/archive/:siteId/equipment/:equipmentType/:equipmentId/component", (req, res)=>{
	let siteId = req.params.siteId;
	let equipmentId = req.params.equipmentId;
	let equipmentType = req.params.equipmentType;
	
	Equipment.findByPk(equipmentId).then(equipment=>{
		Component.findAll({ 
		where:{
			equipmentId: equipmentId,
			[Op.or]: [
				  { ativo: 0 },
				  { equipmentAtivo: 0},
				  { siteAtivo: 0},
				]
			}, 
			raw: true, 
			order:[
			['component','ASC']
		]}).then(component=>{
			res.render("admin/cadastro/archive/site-archive-equipment",{
				component: component,
				equipmentId: equipmentId,
				siteId: siteId,
				equipmentType: equipmentType,
				equipment: equipment,
			});
		});
	});
});

/* ARQUIVOU O EQUIPAMENTO */

router.get("/cadastro/site/:siteId/equipment/archive/:equipmentType/:equipmentId/component", (req, res)=>{
	let siteId = req.params.siteId;
	let equipmentId = req.params.equipmentId;
	let equipmentType = req.params.equipmentType;
	
	Equipment.findByPk(equipmentId).then(equipment=>{
		Component.findAll({ 
		where:{
			equipmentId: equipmentId,
			[Op.or]: [
				  { ativo: 0 },
				  { equipmentAtivo: 0},
				  { siteAtivo: 0},
				]
			}, 
			raw: true, 
			order:[
			['component','ASC']
		]}).then(component=>{
			res.render("admin/cadastro/archive/equipment-archive",{
				component: component,
				equipmentId: equipmentId,
				siteId: siteId,
				equipmentType: equipmentType,
				equipment: equipment,
			});
		});
	});
});

module.exports = router;
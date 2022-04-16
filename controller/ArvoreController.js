const express = require("express");
const router = express.Router();
const Vessel = require("../models/Vessel");
const Site = require("../models/Site");
const Equipment = require("../models/Equipment");
const Component = require("../models/Component");
const Tables = require("../database/Tables");

router.get("/cadastro", (req, res)=>{
	
	Site.findAll({ where: {ativo:1}, raw: true, order:[
        ['site','ASC']
		]}).then((siteAll)=>{
			Equipment.findAll({ where: {ativo:1}, raw: true, order:[
				['equipment','ASC']
				]}).then((equipmentAll)=>{
					Component.findAll({ where: {ativo:1}, raw: true, order:[
						['component','ASC']
						]}).then((componentAll)=>{
				
						res.render("admin/cadastro/arvore/index",{
							siteAll: siteAll,
							equipmentAll: equipmentAll,
							componentAll: componentAll,
				});
			});
		});
	});
});

router.get("/resultado", (req, res)=>{
	
	Site.findAll({ where: {ativo:1}, raw: true, order:[
        ['site','ASC']
		]}).then((siteAll)=>{
			Equipment.findAll({ where: {ativo:1}, raw: true, order:[
				['equipment','ASC']
				]}).then((equipmentAll)=>{
					Component.findAll({ where: {ativo:1}, raw: true, order:[
						['component','ASC']
						]}).then((componentAll)=>{
				
						res.render("admin/resultado/arvore/index",{
							siteAll: siteAll,
							equipmentAll: equipmentAll,
							componentAll: componentAll,
				});
			});
		});
	});
});

module.exports = router;
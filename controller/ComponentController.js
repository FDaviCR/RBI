const express = require("express");
const router = express.Router();
const Vessel = require("../models/Vessel");
const Component = require("../models/Component");
const Equipment = require("../models/Equipment");
const Site = require("../models/Site");
const Tables = require("../database/Tables");
const InventoryGroup = require("../models/InventoryGroup");
const { Op } = require("sequelize");

router.get("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component", (req, res)=>{
	let siteId = req.params.siteId;
	let equipmentId = req.params.equipmentId;
	let equipmentType = req.params.equipmentType;
	
	Equipment.findByPk(equipmentId).then(equipment=>{
		Component.findAll({
			where:{
			ativo: 1,
			equipmentAtivo: 1,
			siteAtivo: 1,
			equipmentId: equipmentId,
			},
			raw: true,
			order:[
			['component','ASC']
		]}).then(component=>{
			res.render("admin/cadastro/component/index",{
				component: component,
				equipmentId: equipmentId,
				siteId: siteId,
				equipmentType: equipmentType,
				equipment: equipment,
			});
		});
	});
});


router.get("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component/new", (req, res)=>{
	let siteId = req.params.siteId;
	let equipmentId = req.params.equipmentId;
	let equipmentType = req.params.equipmentType;

	Tables.P2_T3_1.findAll({
        where: {
            EquipmentType: equipmentType,
        },
        raw:true,
		order:[
			['ComponentType','ASC']
		]}).then(type=>{
			InventoryGroup.findAll({
				raw:true,
				order:[
					['inventoryGroupName','ASC']
				]}).then(inventory=>{

				res.render("admin/cadastro/component/new",{
					siteId: siteId,
					equipmentId: equipmentId,
					equipmentType: equipmentType,
					componentTypeOptions: type.map(el=>{return el.ComponentType}),
					inventoryOptions: inventory.map(el=>{return el.inventoryGroupName}),
					inventory: inventory,
				});
			});	
		});	
});	

router.post("/cadastro/component/save", (req, res)=>{
	let siteId = req.body.siteId;
	let equipmentId = req.body.equipmentId;
	let equipmentType = req.body.equipmentType;
	let component = req.body.component;
	let componentType = req.body.componentType;
	let inventoryGroupId = req.body.inventoryGroupId;

Site.findByPk(siteId).then(site=>{	  
	
	let siteAtivo = site.ativo;
	
	Equipment.findByPk(equipmentId).then(equipment=>{	  
	
	let equipmentAtivo = equipment.ativo;
	
			Component.create({
				component: component,
				componentType: componentType,
				equipmentType: equipmentType,
				equipmentId: equipmentId,
				siteId: siteId,
				inventoryGroupId: inventoryGroupId,
				equipmentComponent: equipmentId+"_"+component.toUpperCase(),
				ativo: true,
				equipmentAtivo: equipmentAtivo,
				siteAtivo: siteAtivo,
			}).then(()=>{
				console.log("Cadastrado com sucesso");
				res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component");
			}).catch(()=>{
				console.log("Componente já existe");
				res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component/");
			}); 
		}); 
	}); 
});


router.get("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component/edit/:componentId", (req, res)=>{
    let siteId = req.params.siteId;
    let equipmentType = req.params.equipmentType;
    let equipmentId = req.params.equipmentId;
    let componentId = req.params.componentId;

    if(isNaN(componentId)){
        res.redirect("/cadastro/site/"+siteId+"/equipment");
    }

    Component.findByPk(componentId).then(component=>{
		InventoryGroup.findAll({
			raw:true,
			order:[
				['inventoryGroupName','ASC']
			]}).then(inventory=>{
				Tables.P2_T3_1.findAll({
					where: {
						EquipmentType: equipmentType,
					},
					raw:true,
					order:[
						['ComponentType','ASC']
					]}).then(type=>{
						if(component != undefined){
							res.render("admin/cadastro/component/edit",{
								component:component,
								equipmentType: equipmentType,
								equipmentId: equipmentId,
								siteId: siteId,
								inventoryGroupId: component.inventoryGroupId,
								componentTypeOptions: type.map(el=>{return el.ComponentType}),
								inventoryOptions: inventory.map(el=>{return el.inventoryGroupName}),
								inventory: inventory,
								});
						}else{
							res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component");
						}
			});
		});
    }).catch(erro=>{
          res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component");
    })
});

router.post("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component/update", (req, res)=>{
	let siteId = req.params.siteId;
	let equipmentType = req.params.equipmentType;
	let equipmentId = req.params.equipmentId
	let component = req.body.component;
	let componentType = req.body.componentType;
	let componentId = req.body.componentId;
	let inventoryGroupId = req.body.inventoryGroupId;

	Component.update({
		component: component,
		componentType: componentType,
		inventoryGroupId: inventoryGroupId,
		equipmentComponent: equipmentId+"_"+component.toUpperCase(),
		},
		{
        where:{
            id: componentId
        }
    }).then(()=>{
        res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component");
    }).catch(()=>{
		console.log("Componente já existe");
		res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component/");
	});
});



router.post("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component/archive", (req, res)=>{
	
	let siteId = req.params.siteId;
	let equipment = req.params.equipment;
	let equipmentType = req.params.equipmentType;
	let equipmentId = req.params.equipmentId
	let component = req.body.component;
	let componentId = req.body.componentId;

	
    if(componentId != undefined){
        if(!isNaN(componentId)){
            Component.update({ativo: false,},{
                where:{
                    id: componentId
                }
            }).then(()=>{
                res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component");
                console.log("Arquivou");
            })
        }else{
			res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component");
            console.log("Não-número");
        }
    }else{
		res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component/new");
        console.log("Vazio");
    }
});

router.get("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component/archive/view", (req, res)=>{
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
			res.render("admin/cadastro/component/archive",{
				component: component,
				equipmentId: equipmentId,
				siteId: siteId,
				equipmentType: equipmentType,
				equipment: equipment,
			});
		});
	});
});

router.post("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component/restore", (req, res)=>{
    
	let siteId = req.params.siteId;
	let equipment = req.params.equipment;
	let equipmentType = req.params.equipmentType;
	let equipmentId = req.params.equipmentId
	let component = req.body.component;
	let componentId = req.body.componentId;
	
    if(componentId != undefined){
        if(!isNaN(componentId)){
            Component.update({ativo: true,},{
                where:{
                    id: componentId,
                }
            }).then(()=>{
                res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component");
                console.log("Recuperou");
            })
        }else{
			res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component");
            console.log("Não-número");
        }
    }else{
        res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component/new");
        console.log("Vazio");
    }
});

router.get("/cadastro/site/:siteId/equipment/:equipmentType/:equipmentId/component/:componentId", (req, res)=>{
	let siteId = req.params.siteId;
	let equipment = req.params.equipment;
	let equipmentType = req.params.equipmentType;
	let equipmentId = req.params.equipmentId
	let component = req.params.component;
	let componentId = req.params.componentId;

	Vessel.findOne({
        where: {
            componentId: componentId,
        },
        raw:true}).then(vessel=>{
			
		if(!vessel){	//se não existe
			if(equipmentType == "Heat_Exchanger" || equipmentType == "Tank650"){
				res.send(equipmentType + " new");
			} else{
				res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component/"+componentId+"/vesselview/new");
			}
		} else{
				if(equipmentType == "Heat_Exchanger" || equipmentType == "Tank650"){
					res.send(equipmentType);
				} else{
					res.redirect("/cadastro/site/"+siteId+"/equipment/"+equipmentType+"/"+equipmentId+"/component/"+componentId+"/vesselview/"+vessel.id);
				}
			}
		});
});

module.exports = router;
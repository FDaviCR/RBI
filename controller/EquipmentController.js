const express = require("express");
const router = express.Router();
const Equipment = require("../models/Equipment");
const Component = require("../models/Component");
const Site = require("../models/Site");
const { Op } = require("sequelize");


router.get("/cadastro/site/:siteId/equipment", (req, res)=>{
	let siteId = req.params.siteId;
	
	Site.findByPk(siteId).then(site=>{
		Equipment.findAll({
		where:{
		ativo: 1,
		siteAtivo: 1,
		siteId: siteId,
		},
		raw: true,
		order:[
        ['equipment','ASC']
		]}).then(equipment=>{
			res.render("admin/cadastro/equipment/index",{
				equipment: equipment,
				siteId: siteId,
				site: site,
			});
		});
	
	});
});

router.get("/cadastro/site/:siteId/equipment/new", (req, res)=>{
	let siteId = req.params.siteId;
	
	res.render("admin/cadastro/equipment/new",{
		siteId: siteId,
	});
});	

router.post("/cadastro/equipment/save", (req, res)=>{
	let siteId = req.body.siteId;
	let equipment = req.body.equipment;
	let equipmentUppercase = equipment.toUpperCase();
	let equipmentType = req.body.equipmentType;

	Site.findByPk(siteId).then(site=>{
	
		let siteAtivo = site.ativo;
	
		Equipment.create({
			equipment: equipment,
			equipmentUppercase: equipmentUppercase,
			equipmentType: equipmentType,
			siteId: siteId,
			ativo: true,
			siteAtivo: siteAtivo,
		}).then(()=>{
			console.log("Cadastrado com sucesso");
			res.redirect("/cadastro/site/"+siteId+"/equipment");
		}).catch(()=>{
			console.log("Equipamento já existe");
			res.redirect("/cadastro/site/"+siteId+"/equipment");
		}); 
	}); 
});

router.get("/cadastro/site/:siteId/equipment/edit/:equipmentId", (req, res)=>{
    let siteId = req.params.siteId;
    let equipmentId = req.params.equipmentId;

    if(isNaN(equipmentId)){
        res.redirect("/cadastro/site/"+siteId+"/equipment");
    }

    Equipment.findByPk(equipmentId).then(equipment=>{
        if(equipment != undefined){
            res.render("admin/cadastro/equipment/edit",{equipment:equipment});
        }else{
            res.redirect("/cadastro/site/"+siteId+"/equipment");
        }
    }).catch(erro=>{
        res.redirect("/cadastro/site/"+siteId+"/equipment");
    })
});

router.post("/cadastro/site/:siteId/equipment/update", (req, res)=>{
	let siteId = req.params.siteId;
	let equipment = req.body.equipment;
	let equipmentUppercase = equipment.toUpperCase();
	let equipmentType = req.body.equipmentType;
	let equipmentId = req.body.equipmentId

	Site.findByPk(siteId).then(site=>{
	
		let siteAtivo = site.ativo;
	
		Equipment.update({
			equipment: equipment,
			equipmentUppercase: equipmentUppercase,
			equipmentType: equipmentType,
			siteId: siteId,
			siteAtivo: siteAtivo,
			},
			{
			where:{
				id: equipmentId
			}
		})
	}).then(()=>{
        res.redirect("/cadastro/site/"+siteId+"/equipment");
    }).catch(()=>{
		console.log("Equipamento já existe");
		res.redirect("/cadastro/site/"+siteId+"/equipment");
	}); 
});


router.post("/cadastro/site/:siteId/equipment/archive", (req, res)=>{
	
    let siteId = req.params.siteId;
    let equipmentId = req.body.equipmentId;
	
	
	if(equipmentId != undefined){
		if(!isNaN(equipmentId)){
			Equipment.update({ativo: false,},{
				where:{
					id: equipmentId
				}
			})
			.then(()=>{
                Component.update({equipmentAtivo: false,/*usuario: req.session.usuario*/},{
                where:{
                    equipmentId: equipmentId,
                }
				})
                console.log("Arquivou Componente");
            })
			.then(()=>{
				res.redirect("/cadastro/site/"+siteId+"/equipment");
				console.log("Arquivou Equipamento Completo");
			})
		}else{
			res.redirect("/cadastro/site/"+siteId+"/equipment");
			console.log("Não-número");
		}
	}else{
		res.redirect("/cadastro/site/"+siteId+"/equipment/new");
		console.log("Vazio");
	}
});

router.get("/cadastro/site/:siteId/equipment/archive/view", (req, res)=>{
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
			res.render("admin/cadastro/equipment/archive",{
				equipment: equipment,
				siteId: siteId,
				site: site,
			});
		});
	});
});

router.post("/cadastro/site/:siteId/equipment/restore", (req, res)=>{
    
	let siteId = req.params.siteId;
    let equipmentId = req.body.equipmentId;
	
    if(equipmentId != undefined){
        if(!isNaN(equipmentId)){
            Equipment.update({ativo: true,},{
                where:{
                    id: equipmentId
                }
            })
			.then(()=>{
                Component.update({equipmentAtivo: true,/*usuario: req.session.usuario*/},{
                where:{
                    equipmentId: equipmentId,
                }
				})
                console.log("Recuperou Componente");
            })
			.then(()=>{
                res.redirect("/cadastro/site/"+siteId+"/equipment");
                console.log("Recuperou Equipamento Completo");
            })
        }else{
			res.redirect("/cadastro/site/"+siteId+"/equipment");
            console.log("Não-número");
        }
    }else{
        res.redirect("/cadastro/site/"+siteId+"/equipment/new");
        console.log("Vazio");
    }
});

module.exports = router;
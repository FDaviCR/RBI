const express = require("express");
const router = express.Router();
const Site = require("../models/Site");
const Equipment = require("../models/Equipment");
const Component = require("../models/Component");


router.get("/cadastro/site", (req, res)=>{
	Site.findAll({ where: {ativo:1}, raw: true, order:[
        ['site','ASC']
    ]}).then(site=>{
		res.render("admin/cadastro/site/index",{
			site: site,
		});
	});
});

router.get("/cadastro/site/new", (req, res)=>{
    res.render("admin/cadastro/site/new");
});

router.post("/cadastro/site/save", (req, res)=>{
	let site = req.body.site;
	let FMS = req.body.FMS;
	let siteUppercase = site.toUpperCase();

	Site.create({
		site: site,
		siteUppercase: siteUppercase,
		FMS: FMS,
        ativo: true,
	}).then(()=>{
		console.log("Cadastrado com sucesso");
		res.redirect("/cadastro/site");
	}).catch(()=>{
		console.log("Unidade já existe");
		res.redirect("/cadastro/site");
	}); 
});

router.get("/cadastro/site/edit/:id", (req, res)=>{
    var id = req.params.id;

    if(isNaN(id)){
        res.redirect("/cadastro/site");
    }

    Site.findByPk(id).then(site=>{
        if(site != undefined){
            res.render("admin/cadastro/site/edit",{site:site});
        }else{
            res.redirect("/cadastro/site");
        }
    }).catch(erro=>{
        res.redirect("/cadastro/site");
    })
});

router.post("/cadastro/site/update", (req, res)=>{
    let site = req.body.site;
	let FMS = req.body.FMS;
	let id = req.body.id;
	let siteUppercase = site.toUpperCase();
	
    Site.update({
		site: site,
		siteUppercase: siteUppercase,
		FMS: FMS,
		},
		{
        where:{
            id:id
        }
    }).then(()=>{
        res.redirect("/cadastro/site");
    }).catch(()=>{
		console.log("Unidade já existe");
		res.redirect("/cadastro/site");
	});
});


router.post("/cadastro/site/archive", (req, res)=>{
    let id = req.body.id;
    if(id != undefined){
        if(!isNaN(id)){
            Site.update({ativo: false,/*usuario: req.session.usuario*/},{
                where:{
                    id:id
                }
            })
			.then(()=>{
                Equipment.update({siteAtivo: false,/*usuario: req.session.usuario*/},{
                where:{
                    siteId:id
                }
				})
                console.log("Arquivou Equipamento");
            })
			.then(()=>{
                Component.update({siteAtivo: false,/*usuario: req.session.usuario*/},{
                where:{
                    siteId:id
                }
				})
                console.log("Arquivou Component");
            })
			.then(()=>{
                res.redirect("/cadastro/site");
                console.log("Arquivou Site Completo");
            })
        }else{
            res.redirect("/cadastro/site");
            console.log("Não-número");
        }
    }else{
        res.redirect("/clientes/new");
        console.log("Vazio");
    }
});

router.get("/cadastro/site/archive/view", (req, res)=>{
	Site.findAll({ where: {ativo:0}, raw: true, order:[
        ['site','ASC']
    ]}).then(site=>{
		res.render("admin/cadastro/site/archive",{
			site: site,
		});
	});
});

router.post("/cadastro/site/restore", (req, res)=>{
    let id = req.body.id;
    if(id != undefined){
        if(!isNaN(id)){
            Site.update({ativo: true,/*usuario: req.session.usuario*/},{
                where:{
                    id:id
                }
            })
			.then(()=>{
                Equipment.update({siteAtivo: true,/*usuario: req.session.usuario*/},{
                where:{
                    siteId:id
                }
				})
                console.log("Recuperou Equipamento");
            })
			.then(()=>{
                Component.update({siteAtivo: true,/*usuario: req.session.usuario*/},{
                where:{
                    siteId:id
                }
				})
                console.log("Recuperou Component");
            })
			.then(()=>{
                res.redirect("/cadastro/site");
                console.log("Recuperou Site Completo");
            })
        }else{
            res.redirect("/cadastro/site");
            console.log("Não-número");
        }
    }else{
        res.redirect("/cadastro/site/new");
        console.log("Vazio");
    }
});

module.exports = router;
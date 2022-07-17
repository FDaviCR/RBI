const express = require("express");
const router = express.Router();
const InventoryGroup = require("../models/InventoryGroup");

router.post("/authenticate", (req, res)=>{
	console.log("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
	// tenho que criar a autenticação e também a página de "Aguarde... estamos criando as tabelas." para o caso de primeiro acesso

	InventoryGroup.findOne({where:{id: 1}, raw: true}).then(inventory=>{

		if(!!inventory){
			console.log("Inventário GERAL já existe!")
		}else{
			InventoryGroup.create({
				id: 1,
				inventoryGroupName: "Geral",
				inventoryGroupMass: 0,
				ativo: true,
			});
		}
	}).then(()=>{
		res.redirect("/cadastro");
	});
});

module.exports = router;
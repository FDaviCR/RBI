const express = require("express");
const router = express.Router();
const User = require("../models/User");
const bcrypt = require('bcryptjs');

router.get("/admin/users", (req,res) => {
    User.findAll().then(users => {
        res.render("admin/usuario/index", {users: users});
    });
});

router.get("/admin/users/create", (req,res) => {
    res.render("admin/users/create");
});

router.post("/users/create", (req,res) => {
    let email = req.body.email;
    let password = req.body.password;

    User.findOne({where:{login: email}}).then(user =>{
        if(user == undefined){
            let salt = bcrypt.genSaltSync(10);
            let hash = bcrypt.hashSync(password, salt);
            let cad = null

            if(req.session.user == undefined){
                cad = "Usuário Primario";
            }else{
                cad = req.session.user;
            }

            User.create({
                login: email,
                password: hash,
                user: cad,
                active: true
            }).then(()=>{
                if(req.session.user == undefined){
                    res.redirect("/");
                }else{
                    res.redirect("/admin/users/");
                }
            }).catch((err)=>{
                console.log(err);
            });
        }else{
            res.redirect("/admin/users/create");
        }
    })

});

router.get("/login", (req, res) => {
    res.render("admin/users/login");
});

router.post("/authenticate", (req,res) => {
    let login = req.body.email;
    let password = req.body.password;
    //req.session.user = login;

    console.log("------------------ HERE ---------------------")

    User.findOne({where:{login:login}}).then(user=>{
        if(user != undefined){
            let correct = bcrypt.compareSync(password, user.password);

            if(correct){
                req.session.user = {
                    id: user.id,
                    login: user.login
                }
                res.redirect("/");
            }else{
                res.redirect("/login");
            }
        }else{
            res.redirect("/login");
        }
    });
});

router.post("/users/delete", (req, res)=>{
    let id = req.body.id;
    if(id != undefined){
        if(!isNaN(id)){
            User.update({active: false,user: req.session.user},{
                where:{
                    id:id
                }
            }).then(()=>{
                res.redirect("/admin/users");
            })
        }else{
            res.redirect("/users");
        }
    }else{
        res.redirect("/users");
    }
});


router.post("/users/reactivate", (req, res)=>{
    let id = req.body.id;
    if(id != undefined){
        if(!isNaN(id)){
            User.update({active: true,user: req.session.user},{
                where:{
                    id:id
                }
            }).then(()=>{
                res.redirect("/admin/users");
            })
        }else{
            res.redirect("/users");
        }
    }else{
        res.redirect("/users");
    }
});

router.get("/logout", (req,res) =>{
    req.session.user = undefined;
    res.redirect("/login");
});

module.exports = router
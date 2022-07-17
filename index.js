const express = require("express");
const app = express();
const bodyParser = require("body-parser");

//Database
const connection = require("./database/database.js");

// const componentController = require("./controller/ArvoreController");
// const Component = require("./models/Arvore");

//const usersController = require("./controller/UsersController");
const userController = require("./controller/UserController");
const siteController = require("./controller/SiteController");
const equipmentController = require("./controller/EquipmentController");
const componentController = require("./controller/ComponentController");
const vesselController = require("./controller/VesselController");
const arvoreController = require("./controller/ArvoreController");
const inventoryGroupController = require("./controller/InventoryGroupController");
const archiveController = require("./controller/ArchiveController");
const resultController = require("./controller/ResultController");

const User = require("./models/User");
const Site = require("./models/Site");
const Equipment = require("./models/Equipment");
const Cmponent = require("./models/Component");
const Vessel = require("./models/Vessel");
const InventoryGroup = require("./models/InventoryGroup");

//const consenqueceVesselController = require("./controller/risk/vessel/ConsenqueceVesselController");

// View engine
app.set('view engine','ejs');

//Arquivos estaticos
app.use(express.static('public'));

//Body parser
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

connection.sync().then(
	()=> console.log('db is ready')
);

app.get("/", (req, res) => {
	console.log('login');
    res.render("index.ejs");
});

app.use("/", userController);
app.use("/", siteController);
app.use("/", equipmentController);
app.use("/", componentController);
app.use("/", vesselController);
app.use("/", arvoreController);
app.use("/", inventoryGroupController);
app.use("/", archiveController);
app.use("/", resultController);

//app.use("/", consenqueceVesselController);

app.listen(3333,()=>{
	console.log("App rodando na porta 3000. Iniciando...");
});

/*
var url = 'http://localhost:3000/';
var start = (process.platform == 'darwin'? 'open': process.platform == 'win32'? 'start': 'xdg-open');
require('child_process').exec(start + ' ' + url);

*/

/* MELHOR MANEIRA DE SE ABRIR O NAVEGADOR:

-----------------------------------------------------------------------------------------------

Use opn porque ele resolverá o problema de plataforma cruzada. Para instalar:

$ npm install opn

Usar:

var opn = require('opn');

// opens the url in the default browser 
opn('http://sindresorhus.com');

// specify the app to open in 
opn('http://sindresorhus.com', {app: 'firefox'});

-----------------------------------------------------------------------------------------------


A maneira mais fácil e organizada, o IMHO está usando um pacote npm chamado openurl . Faça um npm install openurl. Você pode tentar isso rapidamente no seu Nodejs REPL

require("openurl").open("http://stackoverflow.com/questions/8500326/how-to-use-nodejs-to-open-default-browser-and-navigate-to-a-specific-url")

Você também pode enviar e-mails com ele, se necessário; require("openurl").open("mailto:janedoe@example.com")

*/
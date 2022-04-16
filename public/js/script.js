// SELECIONAR MECANISMOS DE DANO //

const dmFlag = document.querySelectorAll(".js-dm-chb input");
const mecanismoDanoCheck = document.querySelectorAll(".js-menu-nav-dm button");
const inspectionHead = document.querySelectorAll("th");

	dmFlag.forEach((el, index)=>{
		mecanismoDanoCheck[index].classList.add("inativo");
		
		if(el.checked){
			mecanismoDanoCheck[index].classList.remove("inativo");
		}
		
		el.addEventListener("change", ()=>{
			mecanismoDanoCheck[index].classList.toggle("inativo");
		});
	});

// Tabela de Histórico de Inspeção //

	dmFlag.forEach((el, index)=>{
		let i = index + 1;
		inspectionHead[i].classList.add("inativo");
		if(el.checked){
			inspectionHead[i].classList.remove("inativo");
		}
		
		el.addEventListener("change", ()=>{
			inspectionHead[i].classList.toggle("inativo");
		});
	});

const inspectionHistoryTable = [
	document.querySelectorAll(".dm1"),
	document.querySelectorAll(".dm2"),
	document.querySelectorAll(".dm3"),
	document.querySelectorAll(".dm4"),
	document.querySelectorAll(".dm5"),
	document.querySelectorAll(".dm6"),
	document.querySelectorAll(".dm7"),
	document.querySelectorAll(".dm8"),
	document.querySelectorAll(".dm9"),
	document.querySelectorAll(".dm10"),
	document.querySelectorAll(".dm11"),
	document.querySelectorAll(".dm12"),
	document.querySelectorAll(".dm13"),
	document.querySelectorAll(".dm14"),
	document.querySelectorAll(".dm15"),
	document.querySelectorAll(".dm16"),
	document.querySelectorAll(".dm17"),
	document.querySelectorAll(".dm18"),
	document.querySelectorAll(".dm19"),
	document.querySelectorAll(".dm20"),
	document.querySelectorAll(".dm21"),
]

	dmFlag.forEach((el, index)=>{
		inspectionHistoryTable[index].forEach(item => item.parentElement.classList.add("inativo"));
		
		if(el.checked){
			inspectionHistoryTable[index].forEach(item => item.parentElement.classList.remove("inativo"));
		}
		
		el.addEventListener("change", ()=>{
			inspectionHistoryTable[index].forEach(item => item.parentElement.classList.toggle("inativo"));
		});
		
	});
	
	/*		for(let i=index; i < inspectionHistoryTable.length;){ 
			inspectionHistoryTable[index].classList.add("inativo");
			i=i+22;
			console.log(i);
			}*/
	

/*
	function damageMechanismFlag(){
		for(let i=0; i < dmFlag.length; i++){ 
			dmFlag[i].addEventListener("change", damageMechanismFlag);
			console.log(i);
			if(dmFlag[i].checked){
				console.log("mudou");
				mecanismoDanoCheck[i].style.display = "block";
			} else{
			mecanismoDanoCheck[i].style.display = "none";
			}
		}
	}
*/
// Navegação Menu 
/*function navegarMenu(){
const section = document.querySelectorAll("main section");
const linksMenu = document.querySelectorAll(".js-menu a");

	function esconderTabsMenu(){
		section.forEach((el)=> el.classList.add("inativo"));
	}
	function removerClasseAtivaMenu(){
		linksMenu.forEach((el)=> el.classList.remove("tabSelecionada"));
	}
	function mostrarTabMenu(id){
		const tabAtiva = document.getElementById(id);
		tabAtiva.classList.remove("inativo");
		tabAtiva.classList.add("tabSelecionada");
	}
	function selecionarTabMenu(event){
		esconderTabsMenu();
		removerClasseAtivaMenu();
		const targetMenu = event.currentTarget;
		
		mostrarTabMenu(targetMenu.dataset.id);
		targetMenu.classList.add("tabSelecionada");
	}
	function ouvirMenu(){
		linksMenu.forEach((el)=>el.addEventListener("click", selecionarTabMenu));
	}
	function navegarTabsMenu(){
		esconderTabsMenu();
		ouvirMenu();
		linksMenu[1].click();
	}
	navegarTabsMenu();
}
*/

//PINTAR LINK ATIVO NO MENU // SE REATIVAR O CODIGO ACIMA, DELETE ESSA PARTE E COLOCAR DATA-ID NO HTML
/*
for (let i = 0; i < document.links.length; i++) {
    if (document.links[i].href == document.URL) {
        document.links[i].className = 'tabSelecionada';
    }
}*/
//const dmNavegation = document.querySelectorAll(".js-menu-nav-dm button");
// NAVEGAÇÃO MECANISMOS DE DANO 
function navegarMecanismos(){
const dmNavegation = document.querySelectorAll(".js-menu-nav-dm button");
const mecanismoDanoBox = document.querySelectorAll(".mecanismoDanoBox");

/*	function scrollToDm(){
		const topNavDm = this.offsetTop;
		window.scrollTo({
			top: topNavDm,
			behavior: "smooth",
		});
	}
	*/
	

	function esconderTodos(){
		for(let i=0; i < dmFlag.length; i++){ 
		mecanismoDanoBox[i].classList.add("inativo");
		}
	}
	function removerClasseAtiva(){
		for(let i=0; i < dmFlag.length; i++){
			dmNavegation[i].classList.add("btn-outline-success");
		}
	}
	function mostrarAbaMecanismo(id){
		const abaAtiva = document.getElementById(id);
		abaAtiva.classList.replace("inativo", "ativo-flex");
	}
	function selecionarAbaMecanismo(event){
		esconderTodos();
		removerClasseAtiva();
		const target = event.currentTarget;
		mostrarAbaMecanismo(target.dataset.id);
		target.classList.remove("btn-outline-success");
	}
	function ouvirMudancas(){
		for(let i=0; i < dmFlag.length; i++){
			dmNavegation[i].addEventListener("click", selecionarAbaMecanismo);
		}
	//	dmNavegation.forEach((el)=>el.addEventListener("click", scrollToDm));
	}
	function navegarAbasMecanismos(){
		esconderTodos();
		ouvirMudancas();
		dmNavegation[0].click();
	}
	
	navegarAbasMecanismos();
}

// Mudar background do Modal
function modalColor(){
	const modalBackground = document.querySelector(".modal-background");
	modalBackground.classList.toggle("inativo");
}

function modalFigure(){
	function expandirImg61(figure){	
		this.classList.toggle("expandir-img");
			
		if(this.classList.contains("expandir-img")){
			modal.appendChild(this);
		} else{
			const sccCaustic = document.querySelector("#btnsccCaustic .figure");
			sccCaustic.appendChild(this);
		}
		modalColor();
	}

	const modal = document.querySelector(".modal");
	const figure61 = document.querySelector("#btnsccCaustic img");
	figure61.addEventListener("click", expandirImg61);
}


// MENU HAMBURGUER //
	
	// var filtro = document.getElementById('filtro-clientes');
	// var tabela = document.getElementById('lista-clientes');
	// filtro.onkeyup = function() {
	// 	var nomeFiltro = filtro.value;
	// 	for (var i = 1; i < tabela.rows.length; i++) {
	// 		var conteudoCelula = tabela.rows[i].cells[1].innerText;
	// 		var corresponde = conteudoCelula.toLowerCase().indexOf(nomeFiltro) >= 0;
	// 		tabela.rows[i].style.display = corresponde ? '' : 'none';
	// 	}
	// };
	
	
	const btnMenuHamburguer = document.querySelector("#btnMenuHamburguer");
	const offcanvasNavbar = document.querySelector("#offcanvasNavbar");
	const btnClose = document.querySelector("#offcanvas-btn-close");

	btnMenuHamburguer.addEventListener("click", ()=>{
		offcanvasNavbar.classList.remove("inativo");
		offcanvasNavbar.classList.remove("slideOutLeft");
		offcanvasNavbar.classList.add("slideInLeft");
	})

	btnClose.addEventListener("click", ()=>{
		offcanvasNavbar.classList.replace("slideInLeft","slideOutLeft");
	})

// NAVEGAR NA ÁRVORE //

	const siteArvore = document.querySelectorAll(".drop-site");
	const equipmentArvore = document.querySelectorAll(".drop-equipamento");
	const componentArvore = document.querySelectorAll(".drop-componente");
	
	siteArvore.forEach((el)=> el.addEventListener("click", openEquipment));
	equipmentArvore.forEach((el)=> el.addEventListener("click", openEquipment));
//	componentArvore.forEach((el)=> el.addEventListener("click", componentSelect));
	
	function openEquipment(tag){
		
		this.parentElement.nextElementSibling.classList.toggle("inativo");
		this.parentElement.nextElementSibling.classList.toggle("fadeInDown");
		this.parentElement.classList.toggle("dropup");
	}
	
/*	function componentSelect(tag){
		
		componentArvore.forEach(el=> el.classList.add("btn-outline-secondary"));
		
		this.classList.add("btn-primary");
		this.classList.remove("btn-outline-secondary");
	
	}
*/	
/*
function navegarArvore(){

	function openEquipment(tag){
		this.nextElementSibling.classList.toggle("slideInDown");
		this.classList.toggle("girar-seta");
		console.log(this.nextElementSibling.classList);
	}

	const unityArvore = document.querySelectorAll(".arvore-nav > li > button");
	const equipment = document.querySelectorAll(".arvore-equipamento > li > button");
	const component = document.querySelectorAll(".arvore-componente > li > button");

	unityArvore.forEach((el)=> el.addEventListener("click", openEquipment));
	equipment.forEach((el)=> el.addEventListener("click", openEquipment));
	component.forEach((el)=> el.addEventListener("click", openEquipment));

}
*/
// MODAL CADASTRO
function botoesCadastro(){
	function cadastrarEquipamento(elemento){
		elemento.classList.toggle("inativo");
		modalColor();
	}
	
	const input = document.querySelectorAll("#cadastro input");
	const selection = document.querySelectorAll("#cadastro select");
	
	input.forEach((el)=>el.disabled = true);
	selection.forEach((el)=>el.disabled = true);
	
	function btnSalvar(editar){
		btnSalvarCadastro.classList.toggle("inativo");
		btnNovoCadastro.classList.toggle("inativo");
		btnEditarCadastro.classList.toggle("inativo");
		btnCancelarCadastro.classList.toggle("inativo");
		
		input.forEach((el)=>el.disabled = editar);
		selection.forEach((el)=>el.disabled = editar);
	}

	const modalCadastro = document.querySelector(".modal-cadastro");
	const btnSalvarCadastro = document.querySelector("#salvarCadastro");

	const btnNovoCadastro = document.querySelector("#novoCadastro");
	btnNovoCadastro.addEventListener("click", ()=>{cadastrarEquipamento(modalCadastro)});

	const btnEditarCadastro = document.querySelector("#editarCadastro");
	btnEditarCadastro.addEventListener("click", ()=>{btnSalvar(false)});
	
	const btnCancelarCadastro = document.querySelector("#cancelarCadastro");
	btnCancelarCadastro.addEventListener("click", ()=>{btnSalvar(true)});

//	const btnModalCadastrar = document.querySelector("#modalCadastrar");
//	btnModalCadastrar.addEventListener("click", ()=>{alert("Função Indisponível")});

	const btnModalCancelar = document.querySelector("#modalCancelar");
	btnModalCancelar.addEventListener("click", ()=>{cadastrarEquipamento(modalCadastro)});
}

// ATIVAR FUNÇÕES

window.addEventListener("load", 
navegarMecanismos(), 
//navegarMenu(), 
botoesCadastro(),
modalFigure(),
//navegarArvore(),
);

// MECANISMOS DE DANO QUE FALTAM FAZER
for(let i=16; i < dmFlag.length; i++){
const dmNavegation = document.querySelectorAll(".js-menu-dm button")
dmNavegation[i].style.backgroundColor = "red";
}



/*	RASCUNHOS

//const unityArray = ["U-2110", "U-2111", "U-2221"];
//const equipmentyArray = [["V-211101", "V-211102"], ["V-211003", "V-211004"], ["V-222105", "V-222106"]];

*************************************************************************************************

 navegação em tabs
function activeTab(index) {
  tabContent.forEach((content) => {
    content.classList.add("inativo");
  });
  tabContent[index].classList.remove("inativo");
}

tabMenu.forEach((itemMenu, index) => {
  itemMenu.addEventListener('click', () => {
    activeTab(index);
  });
});

*************************************************************************************************

/* SE QUISER USAR O FOREACH
function flagar(){
chb.forEach(function(el, index){
					if(el.checked){
					mecanismoDanoCheck[index].style.display = "block";
					} else{
						mecanismoDanoCheck[index].style.display = "none";
					};
	el.addEventListener("change", flagar);
	});
}

window.addEventListener("load", flagar);

*************************************************************************************************
const idlh = document.querySelector("#idlh");

if(idlh.value === "true"){console.log("verdadeiro")} else(console.log("Falso"));

/* Pegar valor do fom do HIC-SOHIC-H2S
let teste = document.querySelector("#fomHicSohicH2S");
let valor = teste.value;

console.log(valor);

teste.onchange = function(){
let novoValor=teste.value;
console.log(novoValor)
}

*************************************************************************************************

Pegar valor do INPUT

document.querySelector("#pressaoOperacao").onkeypress = function(e) {
    // 13 é a tecla <ENTER>. Se ela for pressionada, mostrar o valor
    if (e.keyCode == 13) {
       console.log(pressaoOperacao.value);
        e.preventDefault();
    }
}


Se quiser melhorar o código de navegação em abas https://www.youtube.com/watch?v=sxPEmuW7aUg

Key Codes https://www.cambiaresearch.com/articles/15/javascript-char-codes-key-codes

*************************************************************************************************

*/
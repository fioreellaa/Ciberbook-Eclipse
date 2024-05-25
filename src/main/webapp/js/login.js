/**************BLOQUE LOGIN *****************/
//LOGIN Y REGISTER
const loginsec=document.querySelector('.entrar')
const loginlink=document.querySelector('.login-link')
const registerlink=document.querySelector('.register-link')
registerlink.addEventListener('click',()=>{
    loginsec.classList.add('active')
})
loginlink.addEventListener('click',()=>{
    loginsec.classList.remove('active')
})

const log = document.querySelector(".login");
document.addEventListener("keydown", () =>{
	log.querySelector(".message").innerText = ""; 
	log.classList.add("active");
});

/*const reg = document.querySelector(".register");
document.addEventListener("keydown", () =>{
	reg.querySelector(".error-mensaje").innerText = ""; 
	reg.classList.add("active");
});*/

//Validaciones
/*function validar() {
	var errorMensaje = document.getElementById("error-mensaje");
	var telefono = document.getElementById("telefono");
	var valTel =  /[0-9]{9}/;
	
	let form = document.querySelector(".register");
	
	if(valTel.test(telefono)){
		errorMensaje.innerText = "";
		 form.submit();
	}else{
		errorMensaje.innerText = "El telefono debe tener 9 digitos";
	}
	
    form.addEventListener("submit", (event) => {
	 // cancela el comportamiento por defecto
	 event.preventDefault();
	});

}*/

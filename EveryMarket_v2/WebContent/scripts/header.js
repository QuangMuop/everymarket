$(document).ready(function(){
	$("#header_login").click(popUp_login);
	$("#header_register").click(popUp_register);
	$("#header_chargeCash").click(popUp_chargeCash);
	
	/*Çì´õ ÆË¾÷ Æã¼Ç*/
	function popUp_login(){ $("#login").bPopup(); }
	function popUp_register(){ $("#register").bPopup(); }
	function popUp_chargeCash(){ $("#chargeCash").bPopup(); }
});
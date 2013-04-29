$(document).ready(function(){
	$("#goAdminister").click(goAdminister);
	$("#goQnaBoard").click(goQnaBoard);	
	$("#header_login").click(popUp_login);
	$("#header_register").click(popUp_register);
	$("#header_chargeCash").click(popUp_chargeCash);
	$("#header_logout").click(tryLogout);
	
	/*관리자모드 / QnA게시판 이동 펑션*/
	function goAdminister(){ location.href="administer.go"; }
	function goQnaBoard(){ location.href="qnaBoard.go"; }
	
	/*헤더 팝업 펑션*/
	function popUp_login(){ $("#login").bPopup(); }
	function popUp_register(){ $("#register").bPopup(); }
	function popUp_chargeCash(){ $("#chargeCash").bPopup(); }
	function tryLogout(){ location.href="logout.do"; }
	
	$("#m_id").blur(function (){
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2/tryRegister.do?input="+$(this).attr('id')+"&value="+$(this).val(),
			function(data){
				$("#errorid").remove();
				if(data.errorId != null){
					$("#m_id").after("<label id='errorid'>"+data.error_reid+"</label>");
				}else{
					$("#errorid").remove();
				}
			}
		);
	});
	
	$("#m_nick").blur(function(){
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2/tryRegister.do?input="+$(this).attr('id')+"&value="+$(this).val(),	
			function(data){
				$("#errornick").remove();
				if(data.errorNick != null){
					$("#m_nick").after("<label id='errornick'>"+data.error_renick+"</label>");
				}else{
					$("#errornick").remove();
				}
			}
		);
	});
	
	$("#m_pwd").blur(function(){
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2/tryRegister.do?input="+$(this).attr('id')+"&value="+$(this).val(),	
			function(data){
				$("#errorpwd").remove();
				if(data.errorPwd != null){
					$("#m_pwd").after("<label id='errorpwd'>"+data.error_repwd+"</label>");
				}else{
					
				}
			}
		);
	});

	$("#m_pwdConfirm").blur(function(){
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2/confirmPwd.do?input="+$(this).attr('id')+"&value="+$(this).val()+"&con_value="+$("#m_pwd").val(),	
			function(data){
				$("#errorPwdCon").remove();
				if(data.errorConPwd != null){
					$("#m_pwdConfirm").after("<label id='errorPwdCon'>"+data.error_reconpwd+"</label>");
				}
			}
		);
	});
	
	$("#m_phone_3").blur(function(){
		var m_phone = $("#phone_choice >option:selected").val();
		m_phone += $("#m_phone_2").val();
		m_phone += $("#m_phone_3").val();
		$("#m_phone").attr("value", m_phone);
	});

});
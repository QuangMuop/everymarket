$(document).ready(function(){
	$("#header_login").click(popUp_login);
	$("#header_register").click(popUp_register);
	$("#header_chargeCash").click(popUp_chargeCash);
	$("#header_logout").click(tryLogout);
	
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
//	개인알리미
	$("#alarm").hover(function(){
		$("#alarm_in").fadeIn();
	},function(){
		$("#alarm_in").fadeOut();
	});
//	네비게이션 메뉴
	$(function() {
        $('#h_menu > li').bind('mouseenter',function(){
			var $elem = $(this);
			$elem.find('img')
				 .stop(true)
				 .animate({
					'width':'170px',
					'height':'170px',
					'left':'0px'
				 },400,'easeOutBack')
				 .andSelf()
				 .find('.h_wrap')
			     .stop(true)
				 .animate({'top':'120px'},500,'easeOutBack')
				 .andSelf()
				 .find('.h_active')
			     .stop(true)
				 .animate({'height':'170px'},300,function(){
				var $sub_menu = $elem.find('.h_box');
				if($sub_menu.length){
					var left = '170px';
					if($elem.parent().children().length == $elem.index()+1)
						left = '-170px';
					$sub_menu.show().animate({'left':left},200);
				}	
			});
		}).bind('mouseleave',function(){
			var $elem = $(this);
			var $sub_menu = $elem.find('.h_box');
			if($sub_menu.length)
				$sub_menu.hide().css('left','0px');
			
			$elem.find('.h_active')
				 .stop(true)
				 .animate({'height':'0px'},300)
				 .andSelf().find('img')
				 .stop(true)
				 .animate({
					'width':'0px',
					'height':'0px',
					'left':'85px'},400)
				 .andSelf()
				 .find('.h_wrap')
				 .stop(true)
				 .animate({'top':'5px'},500);
		});
    });
});
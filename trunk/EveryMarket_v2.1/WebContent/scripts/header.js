$(document).ready(function(){

	/*Configurable Options*/
	var contextUrl = "/EveryMarket_v2.1/";
	var checkMessageInterval = 10000;
	var notifier_remaningTime = 2000;
	
	/*쪽지함 구매요청 승낙 / 거절 / 창닫기 펑션*/
	$(document).on('click', ".bt_sellapprove", sellApprove);
	$(document).on('click', ".bt_sellrefuse", sellRefuse);
	function sellApprove(){ location.href="sellapprove.do?p_id=" + $(this).attr("p_id"); }
	function sellRefuse(){ location.href="sellrefuse.do?p_id=" + $(this).attr("p_id"); }
	$("#list_message").click(closePopUp_message);
	
	$("#header_login").click(popUp_login);
	$("#header_register").click(popUp_register);
	$("#header_chargeCash").click(popUp_chargeCash);
	$("#header_message").click(popUp_message);
	$("#header_logout").click(tryLogout);
	
	/*헤더 팝업 펑션*/
	function popUp_login(){ $("#login").bPopup(); }
	function popUp_register(){ $("#register").bPopup(); }
	function popUp_chargeCash(){ $("#chargeCash").bPopup(); }
	function tryLogout(){ location.href="logout.do"; }
	
	/*쪽지함 팝업 펑션*/
	function popUp_message(){
		$("#list_message .message").remove();
		$.getJSON(
			contextUrl + "getListMessage.do",
			function(data){
				var message_count = 0;
				$.each(data.listMessage, function(index, message){
					$("#list_message").append(
						"<div class='message'>" +
							"<div class='messageContent'>" +
								message.m_nick + "(" + message.m_id + ") 님이 " + message.p_name +
								" 을(를) 구매 요쳥하셨습니다. <br>" + message.msg_due + " 까지 결정해주세요." +
							"</div>" +
							"<div class='messageButton'>" +
								"<input type='button' class='bt_sellapprove' value='승인' p_id='" + message.p_id + "'/>" +
								"<input type='button' class='bt_sellrefuse' value='거절' p_id='" + message.p_id + "'/>" +
							"</div>" +
						"</div>"
					);
					message_count++;
				});
				if(message_count == 0){
					$("#list_message").append(
						"<div class='message'>확인하지 않은 메세지가 존재하지 않습니다.</div>"
					);
				}
			}
		);
		
		$("#list_message").bPopup({
			easing: 'easeOutBack',
			follow: [false, false],
			modalClose: false,
			opacity: 0,
			position: [$("#count_alarm").offset().left - $("#list_message").width() / 2 - 20,
			           $("#count_alarm").offset().top + 20],
            speed: 500,
            transition: 'slideDown'
		});
	}
	
	function closePopUp_message(){
		$("#list_message").bPopup().close();
	}
	
	/*실시간 알림 펑션: Interval로 구현*/
	if($("#count_alarm").size() > 0){
		refreshCount_alarm();
		setInterval(refreshCount_alarm, checkMessageInterval); 
	};
	function refreshCount_alarm(){
		headerDwr.getCount_unCheckedMessage(callback_getCount_unCheckedMessage);
		function callback_getCount_unCheckedMessage(data){
			if(data != Number($("#count_alarm span").html())){
				$("#count_alarm").append(
					"<span class='hidden'>" + data + "</span>"
				).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
				
				$("#notifier_message").bPopup({
					easing: 'easeOutBack',
					fadeSpeed: 'slow',
					follow: [false, false],
					modalClose: false,
					opacity: 0.3,
					position: [$("#count_alarm").offset().left - 120, 
					           $("#count_alarm").offset().top + 20],
		            speed: 1000,
		            transition: 'slideDown',
		            onOpen: function(){
		            	setTimeout(function(){
		            		$("#notifier_message").bPopup().close();
		            	}, notifier_remaningTime);
		            }
				});
			}
		}
	}
	
	$("#m_id").keyup(function (){
		$.getJSON(
				contextUrl + "tryRegister.do?input="+$(this).attr('id')+"&value="+$(this).val(),
				function(data){
				$("#errorid").remove();
					if(data.errorId != null){
						
						$("#m_id").after("<label id='errorid'>"+data.error_reid+"</label>");
						$("#submit").attr("disabled", "disabled");
					}else if(data.errorId == null){
						$("#errorid").remove();
					
					}
				});				
	});
	
	$("#m_nick").blur(function(){
		$.getJSON(
				contextUrl + "tryRegister.do?input="+$(this).attr('id')+"&value="+$(this).val(),	
			function(data){
				$("#errornick").remove();
			if(data.errorNick != null){
				$("#m_nick").after("<label id='errornick'>"+data.error_renick+"</label>");
				$("#submit").attr("disabled", "disabled");
			}
		});
	});
	
	$("#m_pwd").blur(function(){
		$.getJSON(
				contextUrl + "tryRegister.do?input="+$(this).attr('id')+"&value="+$(this).val(),	
			function(data){
					$("#errorpwd").remove();
					
				if(data.errorPwd != null){
					$("#m_pwd").after("<label id='errorpwd'>"+data.error_repwd+"</label>");
					$("#submit").attr("disabled", "disabled");
				}
			});
	});
	
	$("#m_pwdConfirm").blur(function(){
		$.getJSON(
				contextUrl + "confirmPwd.do?input="+$(this).attr('id')+"&value="+$(this).val()+"&con_value="+$("#m_pwd").val(),	
			function(data){
				$("#errorPwdCon").remove();
				
				if(data.errorConPwd != null){
					$("#m_pwdConfirm").after("<label id='errorPwdCon'>"+data.error_reconpwd+"</label>");
					$("#submit").attr("disabled", "disabled");
				}
			});
	});
	
	$("#m_phone_3").keyup(function(){
		$("#submit").attr("disabled", "disabled");
		var m_phone = $("#phone_choice >option:selected").val();
		m_phone += $("#m_phone_2").val();
		m_phone += $("#m_phone_3").val();
		$("#m_phone").attr("value", m_phone);
	});
	
	$("#m_mail").focus(function(){
		$("#submit").attr("disabled", "disabled");
	});
	
	$("#m_mailConfirm").click(function(){
		alert("gkh");
		$.getJSON(
				contextUrl + "mailsend.do?m_mail="+$("#m_mail").val(),		
		function(data){
			alert("인증메일 발송이 완료되었습니다   메일 확인 후 인증번호를 적어주세요");
			$("#reg_confirm").keyup(function(){
				$.getJSON(
						contextUrl + "regConfirm.do?connum1="+data.text+"&connum2="+$("#reg_confirm").val(),
				function(data){
					$("#confirm").remove();
					if(data.error == null){
						$("#reg_confirm").after("<label id='confirm'>"+data.ConfirmOk+"</label>");
						$("#submit").removeAttr("disabled");
					}if(data.ConfirmOk == null){
						$("#reg_confirm").after("<label id='confirm'>"+data.error+"</label>");
						$("#submit").attr("disabled", "disabled");
					}
				});		
			});	
		});
	});
	
//	개인알리미
	$("#alarm").hover(function(){
		$("#alarm_in").fadeIn();
	},function(){
		$("#alarm_in").fadeOut();
	});

//	거래가능 포인트
	$("#header_cash").hover(function(){
		$.getJSON(
				contextUrl + "restPoint.do", function(data){
			$("#cash_in").fadeIn();
			$("#rest_point").html(data.rest_point);
		});	
	},function(){
		$("#cash_in").fadeOut();
	});

//네비게이션	
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
	$('#h_logo').click(function(){
		location.href="enter.go";
	});
	
	$(window).on("load", function(){
		$.getJSON(
				contextUrl + "cashConfirm.do",
			function(data){
				$("#header_cash").append(
					"<span>" + data.m_cash + "</span>"
				);
			});
	});
});


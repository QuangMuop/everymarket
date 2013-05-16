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
	$("#join_button").click(popUp_register);
	$("#header_chargeCash").click(popUp_chargeCash);
	$("#header_message").click(popUp_message);
	$("#header_logout").click(tryLogout);
	$("#find_id_button").click(popUp_findID);
	$("#find_pwd_button").click(popUp_find_pwd);
	
	/*헤더 팝업 펑션*/
	function popUp_login(){ $("#login").bPopup(); }
	function popUp_register(){ $("#register").bPopup(); }
	function popUp_chargeCash(){ $("#chargeCash").bPopup(); }
	function tryLogout(){ location.href="logout.do"; }
	
	/*회원가입 validation*/
	$("#form_registerMember").submit(function(){
		if($("#agree_rule").is(":checked") == false){ 
			alert("EveryMarket 회원약관에 동의해주세요.");
			return false; }
		if($("#agree_eft").is(":checked") == false){
			alert("전자금융거래 이용약관에 동의해주세요.");
			return false; }
		if($("#m_id").val().length == 0){
			alert("사용하고자 하는 아이디를 입력해주세요.");
			return false; }
		if($("#nickname").val().length == 0){
			alert("사용하고자 하는 별명을 입력해주세요.");
			return false; }
		if($("#m_name").val().length == 0){
			alert("사용하고자 하는 이름을 입력해주세요.");
			return false; }
		if($("#m_pwd").val().length == 0){
			alert("사용하고자 하는 비밀번호를 입력해주세요.");
			return false; }
		if($("#m_pwdConfirm").val().length == 0){
			alert("비밀번호를 한번 더 입력해주세요.");
			return false; }
		if($("#m_phone").val().length == 0){
			alert("연락가능한 번호를 입력해주세요.");
			return false; }
		if($("#reg_confirm").val().length == 0){
			alert("E-mail 인증번호를 입력해주세요.");
			return false; }
		
		alert("회원가입에 성공했습니다. 메인페이지로 이동합니다.");
	});
	
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
								"<a id='m_id_submit'>"+message.m_nick+"</a>" + "(" + message.m_id + ") 님이 " + message.p_name +
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
	
	/*화면 로딩시 회원 캐쉬 로드*/
	$.getJSON(	
		contextUrl + "getM_cash.do",
		function(data){
			$("#header_cash").html(
				"<span>" + data.m_cash + "</span>" +
				"<img class='coin' alt='' src='images/smarket/coin.png'>"
			);
		}
	);
	
	/*실시간 알림 펑션: Interval로 구현*/
	if($("#count_alarm").size() > 0){
		refreshCount_alarm();
		setInterval(refreshCount_alarm, checkMessageInterval); 
	};
	function refreshCount_alarm(){
		headerDwr.getCount_unCheckedMessage(callback_getCount_unCheckedMessage);
		function callback_getCount_unCheckedMessage(data){
			if(data == -1){
				alert("세션이 만료되어 메인페이지로 이동합니다. 다시 로그인해주세요!");
				location.href="enter.go";
			}else{
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
	}
	
	$("#m_id").keyup(function (){
		$.getJSON(
			contextUrl + "tryRegister.do?input="
				+$(this).attr('id')+"&value="+$(this).val(),
			function(data){
				$("#errorid").remove();
				if(data.errorId != null){
					$("#m_id").after("<label id='errorid'>"+data.error_reid+"</label>");
					$("#join_btn").attr("disabled", "disabled");
				}else{
					$("#errorid").remove();
					$("#join_btn").removeAttr("disabled");
				}
			}
		);				
	});
		
	$("#m_pwd").keyup(function(){
		$.getJSON(
			contextUrl + "tryRegister.do?input="
				+$(this).attr('id')+"&value="+$(this).val(),	
			function(data){
				$("#errorpwd").remove();	
				if(data.errorPwd != null){
					$("#m_pwd").after("<label id='errorpwd'>"+data.error_repwd+"</label>");
					$("#join_btn").attr("disabled", "disabled");
				}else{
					$("#errorpwd").remove();
					$("#join_btn").removeAttr("disabled");
				}
			}
		);
	});
	
	$("#m_pwdConfirm").blur(function(){
		$.getJSON(
			contextUrl + "confirmPwd.do?input="
				+$(this).attr('id')+"&value="+$(this).val()+"&con_value="+$("#m_pwd").val(),	
			function(data){
				$("#errorPwdCon").remove();
				if(data.errorConPwd != null){
					$("#m_pwdConfirm").after("<label id='errorPwdCon'>"+data.error_reconpwd+"</label>");
					$("#join_btn").attr("disabled", "disabled");
				}else{
					$("#errorPwdcon").remove();
					$("#join_btn").removeAttr("disabled");
				}
			}
		);
	});
	
	$("#m_phone_3").keyup(function(){
		var m_phone = $("#phone_choice > option:selected").val();
		m_phone += $("#m_phone_2").val();
		m_phone += $("#m_phone_3").val();
		$("#m_phone").attr("value", m_phone);
	});
		
	$("#m_mailConfirm").click(function(){
		if($("#m_email").val().length == 0){
			alert("인증메일을 확인하기 위해서 이메일주소를 입력해주세요.");
		}else{
			$.getJSON(
			contextUrl + "mailsend.do?m_email="+$("#m_email").val(),		
			function(data){
				alert("인증메일 발송이 완료되었습니다   메일 확인 후 인증번호를 적어주세요");
				$("#reg_confirm").keyup(function(){
					$.getJSON(
					contextUrl + "regConfirm.do?connum1="
						+data.text+"&connum2="+$("#reg_confirm").val(),
					function(data){
						$("#confirm").remove();
						if(data.error == null){
							$("#reg_confirm").after("<label id='confirm'>"+data.ConfirmOk+"</label>");
							$("#join_btn").removeAttr("disabled");							
						}if(data.ConfirmOk == null){
							$("#reg_confirm").after("<label id='confirm'>"+data.error+"</label>");
							$("#join_btn").attr("disabled", "disabled");
						}
					});		
				});	
			});
		}
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

//	아이디 찾기
	function popUp_findID(){ 
		$("#find_ID").bPopup();	
	}
	
	$("#find_ID_result_button").click(function(){
		var m_name = $("#form_find_ID").find("input[name='m_name']").val();
		var m_email = $("#form_find_ID").find("input[name='m_email']").val();		
		$.getJSON(
			contextUrl + "find_ID.do?m_name=" + m_name + "&m_email=" + m_email,
			function(data){
				if(data.m_id == null){
					$("#find_id_result").remove();
					$("#find_ID").append(
							"<div id='find_id_result'> 해당 아이디가 존재하지 않습니다.</div>"
					);
				}else{
					$("#find_id_result").remove();
					$("#find_ID").append(
						"<div id='find_id_result'>찾은 아이디 : " + data.m_id + "</div>"
					);
				}
			}
		);
		$("#form_find_ID").find("input[name='m_name']").val("");
		$("#form_find_ID").find("input[name='m_email']").val("");
	});
	
	
//	비밀번호 찾기 메일전송
	function popUp_find_pwd(){ 
		$("#find_pwd").bPopup();	
	}
	
	$("#find_pwd_email").click(function(){
		var m_id = $("#form_find_pwd").find("input[name='m_id']").val();
		var m_name = $("#form_find_pwd").find("input[name='m_name']").val();		
		var m_email = $("#form_find_pwd").find("input[name='m_email']").val();
			
		$.getJSON(
				contextUrl + "find_pwd.do?m_id="+m_id+"&m_name="+m_name+"&m_email="+m_email,		
		function(data){
			alert("새로운 비밀번호가 발송되었습니다. 나의 정보에서 비밀번호를 변경해주세요.");
			$("#find_pwd").bPopup().close();
		});
	});
	
//	네비게이션	
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
});
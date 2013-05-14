$(document).ready(function(){	
// mymenu
	$("#c_recharge_button").click(function(){
		window.open("view/mypage/recharge.jsp","aa","width=700,height=500,resizalbe=no");	
	});
	$("#c_respond_button").click(function(){
		window.open("view/mypage/respond.jsp","aa","width=700,height=500,resizalbe=no");	
	});
	$("#menu1").click(function(){
		$("#contents2").fadeOut();
		$("#contents3").fadeOut();
		$("#contents1").fadeIn();
	});
	$("#menu2").click(function(){
		$("#contents1").fadeOut();
		$("#contents3").fadeOut();
		$("#contents2").fadeIn();
	});
	$("#menu3").click(function(){
		$("#contents1").fadeOut();
		$("#contents2").fadeOut();
		$("#contents3").fadeIn();
	});
	$("#c_ok1").click(function(){
		
		var re_pass =  $("#c_inner_pass_input1").val();
		var ori_pwd = $(this).attr("pass");
		/* alert(re_pass); */
		
		if(re_pass == ori_pwd){
		
		$("#re_member").fadeIn();
		$("#c_inner1").fadeOut();
		}else{
			alert("비밀번호가 일치하지 않습니다.");
		}
	});
	$("#c_ok2").on('click',function(){
		var re_pass =  $("#c_inner_pass_input2").val();
		alert(re_pass);
		var ori_pwd = $(this).attr("pass");
		
		if(re_pass == ori_pwd){
			$("#m_cash_detail").fadeIn();
			$("#c_inner2").fadeOut();
		}else{
			alert("비밀번호가 일치하지 않습니다.");
		}   
	
		
	});
	$("#c_ok_update").on('click',function(){
		var x = document.getElementById("select_phone");
		
		alert(x.options[x.selectedIndex].value);
		
			 
	 });
	

// mymenu end
	
// recharge
	$("#select1").click(function(){
		$("#select_detail1").fadeIn();
		$("#select_detail2").fadeOut();
		$("#select_detail3").fadeOut();
		$("#select_detail4").fadeOut();
	});
	$("#select2").click(function(){
		
		$("#select_detail1").fadeOut();
		$("#select_detail2").fadeIn();
		$("#select_detail3").fadeOut();
		$("#select_detail4").fadeOut();
	});
	$("#select3").click(function(){
		
		$("#select_detail1").fadeOut();
		$("#select_detail2").fadeOut();
		$("#select_detail3").fadeIn();
		$("#select_detail4").fadeOut();
	});
	$("#select4").click(function(){
		
		$("#select_detail1").fadeOut();
		$("#select_detail2").fadeOut();
		$("#select_detail3").fadeOut();
		$("#select_detail4").fadeIn();
	});
	
	$("#c_recharge_finish_button").click(function(){
		window.open("view/mypage/recharge_finish.jsp","bb","width=600,height=500,resizalbe=no");	
	});

	$("#trensfer").click(function(){
		window.open("view/mypage/trensfer.jsp","cc","width=380,height=500,resizalbe=no");	
	});
	
	$("#bank_time").click(function(){
		window.open("view/mypage/bank_time.jsp","dd","width=600,height=500,resizalbe=no");	
	});
	
	$("#phone_buy").click(function(){
		window.open("view/mypage/phone_buy.jsp","ee","width=550,height=500,location=no");	
	});
	
	$("#card_buy").click(function(){
		window.open("view/mypage/card_buy.jsp","ee","width=550,height=550,location=no");	
	});
// recharge end
// phone_buy
	$(".agency").click(function(){
		$(".agency").css("background", "linear-gradient(to bottom, rgba(213,220,227,1) 2%,rgba(163,170,177,1) 100%)");
		$(this).css("background", "linear-gradient(to bottom, rgba(87,134,224,1) 0%,rgba(51,104,198,1) 100%)");
		
	});
	$("#p_confirm").click(function(){
		alert("인증번호가 전송되었습니다");
		location.href="view/mypage/phone_confirm.jsp";
	});
// phone_buy end
// card_buy
	$("#c_f_next").click(function(){
		window.open("view/mypage/card_buy2.jsp","ff","width=480,height=500,location=no");	
	});
// card_buy end
// card_buy2
	$("#safe_card_add").click(function(){
		window.open("view/mypage/card_add.jsp","gg","width=400,height=356,location=no");
	});
	
	$("#safe_card_passupdate").click(function(){
		window.open("view/mypage/card_passupdate.jsp","gg","width=400,height=300,location=no");
	});
// card_buy2
// respond
	$("#r_request").click(function(){
		alert("환급신청이 완료되었습니다^^ 관리자 승인 후 환급되겠습니다.");
	});
// repond end
});
$(document).ready(function(){
	
	var contextUrl = "/EveryMarket_v2.1/";
	
// mymenu
	memberDwr.getM_cashByM_id(function(data){
		$("#my_cash_view").html(data);
	});
	
	$("#c_recharge_button").click(function(){
		window.open("view/mypage/recharge.jsp","aa","width=700,height=500,resizalbe=no");
	});
	
	$("#c_respond_button").click(function(){
		window.open("view/mypage/respond.jsp","aa","width=700,height=500,resizalbe=no");	
	});
	
	$("#menu1").click(function(){
		$("#contents2").css("display", "none");
		$("#contents3").css("display", "none");
		$("#contents1").fadeIn();
	});
	$("#menu2").click(function(){
		$("#contents1").css("display", "none");
		$("#contents3").css("display", "none");
		$("#contents2").fadeIn();
	});
	$("#menu3").click(function(){
		$("#contents1").css("display", "none");
		$("#contents2").css("display", "none");
		$("#contents3").fadeIn();
	});
	
	$("#c_ok1").click(function(){
		var re_pass =  $("#c_inner_pass_input1").val();
		var ori_pwd = $(this).attr("pass");
		
		if(re_pass == ori_pwd){
			$("#re_member").fadeIn();
			$("#c_inner1").fadeOut();
		}else{
			alert("비밀번호가 일치하지 않습니다.");
		}
	});
	$("#c_ok2").on('click',function(){
		var re_pass =  $("#c_inner_pass_input2").val();
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
		var m_id = $("#memberinfo_m_id").html();
		var re_password = $("#c_table").find("input[name='re_password']").val();
		var m_email = $("#c_table").find("input[name='re_email_first']").val() + "@" + 
					  $("#c_table").find("input[name='re_email_second']").val();
		var m_phone = x.options[x.selectedIndex].value + $("#c_table").find("input[name='re_phone_first']").val()
					+ $("#c_table").find("input[name='re_phone_second']").val();
		$.getJSON(
				contextUrl + "memberinfo_change.do?m_id=" + m_id + "&re_password=" + re_password +
				"&m_email=" + m_email + "&m_phone=" + m_phone,
				function(data){
					alert("회원정보가 변경되었습니다. 다시 로그인 해주세요.");
					location.href="logout.do";
				}
		);
	 });
});
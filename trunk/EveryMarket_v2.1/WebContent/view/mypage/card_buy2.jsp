<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>: 신용카드결제 페이지 : </title>
<style type="text/css">
body{
margin: 0px;
}
#safe_buy{
border: 2px outset #c2c2c2;
width:473.5px;
height: 543.5px;
}
#sb_title{
margin: 10px;
border-bottom: 1px solid #c2c2c2;
}
#ema_head{
height: 33px;
}
#safe_buy_title{
height: 33px;
}
.safe_title_button{
background-color: #cddce2;
color:#2e6ac3;
font-size: 11px;
border-radius:4px;
border: 1px solid #e3e3e3;
 box-shadow:inset 0px 1px 0px 0px #97c4fe;
 margin-bottom: 10px;
}
.safe_buy_normal{
font-size: 11px;
color:#555555;
letter-spacing: 0;
}
.safe_buy_bold{
font-size: 11px;
color: #555555;
font-weight: bold;
letter-spacing: 0px;
}
.safe_buy_red{
font-size:11px;
letter-spacing: 0px;
color:#e60000;
}
#sb_contents{
margin: 10px;
}
#sb_c_table{
margin-left:10px;
margin-top:10px;
width:440px;
border: 1px solid #dedede;
border-spacing: 0px;
}
#select_line{
height: 90px;
}
#sb_c_table th{
background-color: #eeeeee;
font-size: 11px;
color:#545454;
padding-left: 10px;
font-weight: normal;
text-align: left;
height: 25px;
border-bottom: 1px solid #dddddd;
}
#sb_c_table td{
font-size: 12px;
padding-left: 10px;
border-bottom: 1px solid #dddddd;
}
#sb_c_table tr{
border-bottom: 1px solid #dddddd;
}
.select_box{
float:left;
border: 1px solid #cdcdcd;
border-radius:5px;
background: linear-gradient(to bottom, rgba(254,254,254,1) 0%,rgba(237,237,237,1) 100%);
height: 58px;
width:60px;
margin-right: 15px;
margin-bottom: 3px;
cursor: pointer;
}
.select_box img{
margin: 1px;
}
#pc{
margin-top: 8px;
margin-left: 11px;
}
#usb{
margin-top: 8px;
margin-left: 1px;
width:58px;
}
#phone{
height:56px;
margin-top: 1px;
margin-left: 6px;
}
#iccard{
margin-top: 8px;
margin-left: 13px;

}
#card_select_blank{
border: 2px inset #e3e3e3;
width: 300px;
height: 50px;
}
#card_pass{
border: 2px inset #e3e3e3;
width:200px;
}
.safe_buy_mid_button{
border: 1px solid #bdbfbe;
color:#333333;
font-weight: bold;
box-shadow: inset 0 0 10px #d2d6d7;
background-color: white;
font-size: 11px;
border-radius:3px;
height: 20px;
float: right;
margin-right: 30px;
margin-top: 5px;
}
.safe_buy_button{
width:65px;
height: 35px;
color:white; 
font-weight: bold;
font-size: 13px;
margin-top: 20px;
margin-bottom: 10px;
}
#s_b_confirm{
background: linear-gradient(to bottom, rgba(70,133,204,1) 0%,rgba(51,112,179,1) 100%);
border: 2px outset #224e7e;
margin-left: 170px;
}
#s_b_cencle{
background: linear-gradient(to bottom, rgba(95,95,95,1) 0%,rgba(76,76,76,1) 100%);
border: 2px outset #343434;
}
</style>
<script src="jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	var rechargeAmount = opener.document.getElementById("rechargeAmount").innerHTML;
	$("#rechargeAmount").html(rechargeAmount);
	
	$("#safe_card_add").click(function(){
		window.open("card_add.jsp","gg","width=400,height=356,location=no");
	});
	
	$("#safe_card_passupdate").click(function(){
		window.open("card_passupdate.jsp","gg","width=400,height=300,location=no");
	});
	
	$("#s_b_confirm").click(function(){
		alert($("#rechargeAmount").html() + "원에 대한 결제를 요청합니다.");
		
		opener.parent.opener.parent.opener.parent
			.location.href="../../chargeCash.do?m_cash=" + rechargeAmount;
		opener.parent.opener.close();
		opener.close();
		window.close();		
	});
	
	$("#s_b_cencle").click(function(){
		close();
	});
});
</script>
</head>
<body>
<div id="safe_buy">
	<div id="sb_title">
		<img alt="" id="ema_head" src="../../image_mypage/ema_head.png">
		<img alt="" id="safe_buy_title" src="../../image_mypage/safe_buy_title.png">
		<button class="safe_title_button">안전결제 서비스란</button>
		<button class="safe_title_button">도움말</button>
	</div>
	<div id="sb_contents">
		<a class="safe_buy_normal">- 충전금액을 확인하시고 </a>
		<a class="safe_buy_bold">할부기간</a>
		<a class="safe_buy_normal">을 선택해 주십시오.</a>
		<table id="sb_c_table">
			<colgroup>
				<col width="25%">
				<col width="35%">
				<col width="18%">
				<col width="22%">
			</colgroup>
			<tr>
				<th>충전금액</th>
				<td>
					<span id="rechargeAmount"></span>원
				</td>
				<th>할부기간</th>
				<td>
					<select>
						<option>일시불</option>
					</select>
				</td>
			</tr>
		</table>
		
		<a class="safe_buy_normal">- 결제하실 </a>
		<a class="safe_buy_bold">카드를 선택</a>
		<a class="safe_buy_normal">하시고</a>
		<a class="safe_buy_bold">안전결제 비밀번호</a>
		<a class="safe_buy_normal">를 입력하여 주십시오.</a>
		<table id="sb_c_table">
			<colgroup>
				<col width="25%">
				<col width="75%">
			</colgroup>
			<tr id="select_line">
				<th>저장위치 선택</th>
				<td>
					<div class="select_box">
						<img alt="" id="pc" src="PC.png">
					</div>
					<div class="select_box">
						<img alt="" id="phone" src="phone.png">
					</div>
					<div class="select_box">
						<img alt="" id="usb" src="usb.png">
					</div>
					<div class="select_box">
						<img alt="" id="iccard" src="ICcard.png">
					</div>
					<a class="safe_buy_red">휴대폰</a>
					<a class="safe_buy_normal">에 저장해서 이용하시면 더욱</a>
					<a class="safe_buy_red">안전</a>
					<a class="safe_buy_normal">하고</a>
					<a class="safe_buy_red">편리</a>
					<a class="safe_buy_normal">합니다.</a>
				</td>
			</tr>
			<tr>
				<th>카드선택</th>
				<td>
					<div id="card_select_blank">
					
					</div>
				</td>
			</tr>
			<tr>
				<th>안전결제 비밀번호</th>
				<td>
					<input type="password" id="card_pass">				
				</td>
			</tr>
		</table>
		<button class="safe_buy_mid_button" id="safe_card_passupdate">안전결제 비밀번호 변경 바로가기</button>
		<button class="safe_buy_mid_button" id="safe_card_add">안전결제 신청 바로가기</button>
		
	</div>
	<button class="safe_buy_button" id="s_b_confirm">확인</button>
	<button class="safe_buy_button" id="s_b_cencle">취소</button>
	<img alt="" src="../../image_mypage/s_c_banner.png">
</div>
</body>
</html>
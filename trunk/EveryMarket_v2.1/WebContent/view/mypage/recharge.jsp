<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="jquery-1.9.1.min.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
body{
margin: 0px;
background-image: url(../../image_mypage/ema2.png);

}
#cash_buy_title{
background-color: #dc2342;
border-bottom: 1px solid #e73654;
}
#cash_buy_title img{
margin-left: 20px;
}
#cash_buy_inner{
margin: 10px;
border-top: 2px solid #454545;
width: 680px;
}
.c_rows{
text-align: left;
background-color: #f8f8f8;
}
.c_buy_contents{
border-spacing:0px;
}
#recharge_logic{
float:left;
width: 680px;
height: 130px;
}
.recharge_box{
 background-color: #ffffff;
 float: left;
 border: 1px solid #e71919;
 height: 75px;
 margin: 20px;
}

.recharge_box_title{
background-color: #e71919;
height: 25px;
width: 140px;
margin-bottom: 20px;
}
.recharge_box a{

color:#050505;
font-size: 14px;
font-weight: bold;
float: right;
margin-right: 10px;
}
.cash_recharge{
height: 220px;
}
#box_first{
margin-left: 75px;
}
.box_img{
width:100px;
height: 15px;
margin: 5px;
margin-left: 20px;
}
.input_cash{
width: 100px;
float: right;
margin-right: 10px;
}
#cash_buy_inner ul li{
font-size: 11px;
 color:#666666;
 list-style-type: square;
 margin: 5px;
}
#c_inner_pass_input{
border: 1px solid #bbbbbb;
width:120px;
text-align: right;
}
.c_buy_contents{
margin: 10px;
border-top: 2px solid #454545;
width: 672px;
border-bottom: 1px solid #cccccc;
}
.c_buy_contents th{
color:#4d4d4d;
font-size: 13px;
padding-left: 10px;
height: 25px;
}
.c_buy_contents td{
color: #666666;
font-size: 12px;
padding-left: 10px;
}
.c_buy_contents p{
margin: 0px;
}
#c_contents_midbar{
border-top: 1px solid #ececec;
}
.hidden{
display: none;
}
#select_detail1 *{
padding-left: 5px;
}
.c_button{
width:80px;
height:35px;
font-weight: bold; 
margin-top: 15px;
cursor: pointer;
border: 1px solid #f40e09;
background: linear-gradient(to bottom, #fffdfd 0%,#ffebe4 100%);
color:#f40e09;
margin-right: 10px;
}
#c_recharge_finish_button{
margin-left: 240px;
}
.select2_button{
border: 1px solid #a6a6a6;
font-size: 12px;
color: #666666;
background: linear-gradient(to bottom, #fdfdfd 1%,#f6f6f6 100%); 
margin-right: 10px;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
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
		window.open("recharge_finish.jsp","bb","width=600,height=500,resizalbe=no");	
	});

	$("#trensfer").click(function(){
		window.open("trensfer.jsp","cc","width=380,height=500,resizalbe=no");	
	});
	
	$("#bank_time").click(function(){
		window.open("bank_time.jsp","dd","width=600,height=500,resizalbe=no");	
	});
	
	$("#phone_buy").click(function(){
		window.open("phone_buy.jsp","ee","width=550,height=500,location=no");	
	});
	
	$("#card_buy").click(function(){
		window.open("card_buy.jsp","ee","width=550,height=550,location=no");	
	});
});
</script>
</head>
<body>
	<div id="cash_buy_title">
		<img alt="" src="../../image_mypage/buy_title.png">		
	</div>
	<div id="cash_buy_inner">
		<ul>
			<li>CASH는 계좌이체나 신용카드, 휴대폰결제 등을 통해 충전가능하며 다른 사용자와 거래간에 사용됩니다.</li>
			<li>CASH 사용처는 EVERYMARKET입니다.</li>
			<li>전자금융거래법 등 관계 법령에 따라 적용 중인 "포인트 통합 한도 200만원 제한"에 포함됩니다.</li>
			<li>전자금융 시행령에 의해 포인트/마일리지 합산 금액이 50만원 초과일 경우 실명인증 후 사용이 가능합니다.</li>
		</ul>
		
		<div id="recharge_logic">
					<div class="recharge_box" id="box_first">
						<div class="recharge_box_title">
							<img class="box_img" alt="" src="now_cash.png">
						</div>
						<a>0</a>
					</div>
					<div class="recharge_box">
						<div class="recharge_box_title">
							<img class="box_img"  alt="" src="recharge_cash.png">
						</div>
						<input type="text" id="c_inner_pass_input" class="input_cash" value="0">
					</div>
					<div class="recharge_box">
						<div class="recharge_box_title">
							<img class="box_img"  alt="" src="after_cash.png">
						</div>
						<a>0</a>
					</div>
		</div>
		
		<table class="c_buy_contents">
			<tr>
			 	
				<th class="c_rows">충전할 금액</th>
				<td>
				<input type="text" value="0">
				<a>원/최대 200만원 까지 가능</a></td>
			</tr>
			
			<tr>
				<th class="c_rows"  id="c_contents_midbar">결제수단 선택</th>
				<td  id="c_contents_midbar">
					
					<input id="select1" checked="checked" type="radio" value="무통장" name="way">
					<a>무통장입금</a>
					<input id="select2"  type="radio" value="계좌이체" name="way">
					<a>계좌이체</a>
					<input id="select3"  type="radio" value="휴대폰" name="way">
					<a>휴대폰</a>
					<input id="select4"  type="radio" value="신용카드" name="way">
					<a>신용카드</a>
				</td>
			</tr>
			<tr>
				<th class="c_rows"  id="c_contents_midbar">결제정보 입력</th>
				<td id="c_contents_midbar">
					<p id="select_detail1">
						<a>입금자 명</a>
						<input type="text" value="관리자" readonly="readonly">
						<a>입금 은행</a>
						<select>
							<option>농협</option>
							<option>국민</option>
							<option>우리</option>
							<option>신한</option>
							<option>하나</option>
							<option>기업</option>
							<option>부산</option>
							<option>외환</option>
							<option>광주</option>
							<option>제일</option>
							<option>경남</option>
						</select>
					</p>
					<p class="hidden" id="select_detail2">
						<button class="select2_button" id="trensfer">실시간 계좌이체 안내</button>
						<button class="select2_button" id="bank_time">은행별 이용가능 시간</button>
					</p>
					<p class="hidden" id="select_detail3">
						<button class="select2_button" id="phone_buy">휴대폰 결제 안내</button>
					</p>
					<p class="hidden" id="select_detail4">
						<button class="select2_button" id="card_buy">신용카드 결제 안내</button>
					</p>
				</td>
			</tr>
		</table>
			<button class="c_button" id="c_recharge_finish_button">결제하기</button>
			<button class="c_button" id="c_cencle">취소</button>
	</div>
</body>
</html>
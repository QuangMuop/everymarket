<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body{
margin: 0px;
}
#p_contents{
border: 2px outset #545a56;
height: 500px;
}
#p_title_img{
height: 50px;
background: linear-gradient(to bottom, rgba(237,245,254,1) 2%,rgba(221,241,249,1) 11%,rgba(251,252,255,1) 100%);
border-bottom: 1px solid #cfd6de;
}
#p_top_img{
height:23px;
margin: 15px;
}
#p_inner{
margin: 20px;
}
#p_inner_title{
height: 25px;
margin-bottom: 10px;
}
#p_title_plus{
height: 13px;
float: right;
padding-top: 12px;
}
#p_inner_table1{
border: 1px solid #5479b7;
width:505px;
border-spacing:0px;
}
#p_inner_table1 th{
background-color: #e9f4fd;
font-size: 13px;
text-align:left;
padding-left: 15px;
color: #2959b6;
height: 25px;
padding-top: 1px;
border-top: 1px solid white;
border-bottom: 1px solid white;
}
#p_inner_table1 td{
font-size:13px;
font-weight: bold;
padding-left: 15px;
border-top: 1px solid white;
border-bottom: 1px solid white;
}
.agency{
width:70px;
}
#p_inner_table2{
width:505px;
margin-top:20px;
border-spacing:0px;
border: 1px solid #d9d9d9;
}
#p_inner_table2 tr{
height: 30px;
}
#p_inner_table2 th{
background-color: #f5f5f5;
font-size: 12px;
color:#707070;
text-align: left;
padding-left: 10px;
border-top: 1px solid white;
}
#p_inner_table2 td{
padding-left: 20px;
}
.p_inut1{
width:40px;
border: 1px solid #e2e2e2;
background-color: #fefefe;
}
#p_select{
background-color: #f9f9f9;
border: 1px solid #e2e2e2;
}
.p_input2{
width:70px;
border: 1px solid #e2e2e2;
background-color: #fefefe;
}
.active{
background-color: red;
}
.agency{
background: linear-gradient(to bottom, rgba(213,220,227,1) 2%,rgba(163,170,177,1) 100%);
border: 1px solid #c5cbd1;
color:white;
font-weight: bold;	
font-size: 12px;
cursor: pointer;
float: left;
text-align: center;
height:15px;
padding-top: 4px;
}
.p_bottom_button{
border-radius:2px;
height: 30px; 
}
#p_confirm{
border: 1px solid #1952a9;
background-color:#3679df;
color:white;
font-size: 13px;
width:120px;
margin-left: 140px;
margin-top: 20px;
margin-right: 30px;
font-weight: bold;
}
#p_cencle{
color:#707070;
font-weight: bold;
background: linear-gradient(to bottom, rgba(246,246,246,1) 0%,rgba(225,225,225,1) 100%);
border: 1px solid #d6d6d6;
}
.p_alert{
margin-top:10px;
padding:10px;
background-color: #fafafa;
}
#p_blue{
font-size: 11px;
color:#3d77b8;
margin: 0px;
}
#p_normal{
font-size: 11px;
color:#656565;
}
</style>
</head>
<body>
<div id="p_contents">
		<div id="p_title_img">
			<img id="p_top_img" alt="" src="../../image_mypage/phone_title.png">
		</div>
		<div id="p_inner">
			<img id="p_inner_title" alt="" src="../../image_mypage/p_inner_title.png">
			<img id="p_title_plus" alt="" src="../../image_mypage/p_title_plus.png">
			<div>
				<table id="p_inner_table1">
					<colgroup>
						<col width="25%">
						<col width="75%">
					</colgroup>
					<tr>
						<th>결제금액</th>
						<td>10000원</td>
					</tr>
					<tr>
						<th>결제일시</th>
						<td>2013-05-08</td>
					</tr>
				</table>
				
				<table id="p_inner_table2">
					<colgroup>
						<col width="25%">
						<col width="75%">
					</colgroup>
					<tr>
						<th>인증번호 입력</th>
						<td>
							<input class="p_inut1" type="text">
						</td>
					</tr>
				</table>
				<button class="p_bottom_button" id="p_confirm">인증번호 입력</button>
				<button class="p_bottom_button" id="p_cencle">취소</button>
			</div>
			<div class="p_alert">
				<p id="p_blue">꼭 확인하세요.</p>
				<a id="p_normal">휴대폰으로 결제하신 금액은 익월의 휴대폰 요금에 함께 청구됩니다. [인증번호요청] 버튼을 누르시면 입력하신 휴대폰으로 승인번호가 전송됩니다.</a>
				<p id="p_normal">결제문의 및 메일 : 1600-0523 / help@mobilians.co.kr</p>
				<p id="p_normal">결제내역조회 : www.mcash.co.kr</p>
			</div>
		</div>
	</div>
</body>
</html>
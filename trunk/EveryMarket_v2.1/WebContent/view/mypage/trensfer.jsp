<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>: 계좌이체 페이지 :</title>
<style type="text/css">
body{
margin: 0px;
}
#t_contents{
border: 2px outset #545a56;
height: 500px;
background-color: #ecf3fb;
}
#t_title_img{
margin:5px;
border: 1px solid #9f9f9d;
border-radius: 3px;
background-color: white;
}
#trensfer_table1{
margin:5px;
background-color: #f6f4f5;
border-bottom: 1px solid #a0a0a0;
border-top: 1px solid #a0a0a0;
}
#trensfer_table1 th{
background-color: #b8c7e6;
font-size: 11px;
color:black;
text-align: center;
font-weight: normal;
}
#trensfer_table1 tr{
height: 20px;
}
.t_button{
width: 95px;
font-size: 11px;
color:white;
background-color: #b8c7e6;
border: 1px solid #0d79d3;
border-radius:3px;
}
.t_input{
border: 1px solid #d2d2d2;
padding-left: 5px;
}
#trensfer_name{
height: 20px;
}
#t_contents_inner{
border-radius:5px;
background-color: #f6f4f5;
border: 1px solid #c0c0c0;
margin: 5px;
}
#trensfer_table2{
margin:5px;
margin-top:20px;
border-bottom: 1px solid #c0c0c0;
border-top: 1px solid #c0c0c0;
border-spacing: 0px;
}
#trensfer_table2 th{
font-size: 11px;
color:black;
font-weight: normal;
text-align: center;
border: 1px outset white;
background-color: #d3d3d3;
}
#trensfer_table2 tr:nth-child(odd) th{
background-color: #e5e5e5;
}
#trensfer_table2 td{
padding: 0px;
background-color: white;
border-bottom: 1px solid #c0c0c0;
border-right: 1px solid #c0c0c0;
}
#trensfer_table2 td a{
font-size: 12px;
}
.t_table2_input{
padding:0px;
border: 0px;
width:180px;
}
#t_table2_select{
background-color: white;
width:260px;
}
#t_table_pass{
width:237px;

}
#t2_alert{
font-size: 12px;
margin-left:100px;
color:#808080;
}
#t_bottom{
margin-top: 15px;
}
#t_bottom *{
margin-left:10px;
}
.t_bottom_a{
width:400px;
margin-top: 5px;
margin-bottom: 10px;
}
#t_email{
width:100px;
font-size: 11px;

}
#t2_inner_line{
height: 20px;
padding: 3px;
padding-top: 5px;
}
#t_bottom_email{
border: 1px solid #c0c0c0;
margin-left: 30px;
width: 200px;
}
.t_bottom_last{
color:#48698a;
font-size: 11px;
float: right;
margin-right: 20px;
}	
#t_bottom_text{
margin-top:20px;
overflow: scroll;
overflow-x:hidden; 
width:340px;
height: 100px;
background-color: white;
border:1px solid #808080;

}
#t_bottom_text *{
margin-left: 0px;
}
.t_text_title{
font-size: 12px;
font-weight: bold;
float: left;
width:330px;
}
.t_text_list{
list-style: none;
padding:0px;
margin: 0px;
padding-left:5px;
color:blue;
list-style-type: circle;
width:320px;
}
.t_text_list li{
margin-left: 0px;
width:320px;
float: left;
}
.t_text_bottom_line{
font-size: 12px;
float: left;
}
.bold{
font-weight: bold;
font-size: 12px;
float: left;
}
.normal{
font-size: 12px;
float: left;
}
.t_bottom_button{
width:85px;
height: 15px;
border: 1px solid #818181;
background-color: #aec4f2;
font-size: 11px;
text-align: center;
margin-top: 10px;
float: right;

border-radius:3px;
}
#t_bottom_button_first{
width:130px;
float: left;
}
#t_bottom_buttons{
margin-left:0px;
height: 30px;
width: 350px;
border-bottom: 1px solid #c6ced6;
}
#last_line{
margin-top: 5px;
}
</style>
<script src="../../scripts/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var rechargeAmount = opener.document.getElementById("c_inner_pass_input").value;
		$("#rechargeAmount").attr("value", rechargeAmount);
		
		$("#t_bottom_button_charge").click(function(){
			alert(rechargeAmount + "원에 대한 결제를 요청합니다.");
			
			opener.parent.opener.parent.location.href="../../chargeCash.do?m_cash=" + rechargeAmount;
			opener.close();
			window.close();
		});
		
		$("#t_bottom_button_cancle").click(function(){
			window.close();
		});
	});
</script>
</head>
<body>
	<div id="t_contents">
		<div id="t_title_img">
			<img alt="" src="../../image_mypage/trensfer_1_1.png">
		</div>
		<div>
			<img alt="" id="trensfer_name" src="../../image_mypage/trensfer_name.png">
		</div>
		<div id="t_contents_inner">
			<table id="trensfer_table1">
				<colgroup>
					<col width="30%">
					<col width="40%">
					<col width="30%">
				</colgroup>
				<tr>
					<th>이용기관명</th>
					<td>
					<input type="text" class="t_input" value="EVERYMARKET(주)">
					</td>
					<td><button class="t_button">출금한도확인</button></td>
				</tr>
				<tr>
					<th>금  액</th>
					<td>
					<input type="text" class="t_input" id="rechargeAmount" readonly="readonly">
					</td>
					<td><button class="t_button">은행상태확인</button></td>
				</tr>
			</table>
			<table id="trensfer_table2">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tr>
					<th>은행</th>
					<td>
						<select class="t_table2_input" id="t_table2_select">
							<option>농협  00:00 ~ 24:00</option>
							<option>국민  00:00 ~ 24:00</option>
							<option>우리  00:15 ~ 23:50</option>
							<option>신한  00:00 ~ 24:00</option>
							<option>하나  00:15 ~ 23:50</option>
							<option>기업  00:00 ~ 24:00</option>
							<option>부산  00:10 ~ 23:50</option>
							<option>외환  00:15 ~ 23:50</option>
							<option>광주  00:10 ~ 23:50</option>
							<option>제일  00:15 ~ 23:50</option>
							<option>경남  00:10 ~ 23:50</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>계좌번호</th>
					<td>
						<input type="text"  class="t_table2_input">
						<a>('-' 생략)</a>
						<img alt="" src="../../image_mypage/key.png">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" id="t_table_pass" class="t_table2_input">
						<img alt="" src="../../image_mypage/key.png">
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>
						<input type="text" class="t_table2_input">
						<a>('-' 생략)</a>
						<img alt="" src="../../image_mypage/key.png">
					</td>
				</tr>
			</table>
			<a id="t2_alert">(법인계좌인 경우 사업자등록번호입력)</a>
		</div>
		<div id="t_bottom">
			<a id="t2_alert" class="t_bottom_a">입력하신 계좌정보는 암호화되어 금융기관에서 직접 결제됩니다.</a>
			<div id="t2_inner_line">
				<input type="checkbox">
				<a id="t_email">E-mail 수신</a>
				<input type="text"  class="t_table2_input" id="t_bottom_email">
			</div>
			<a class="t_bottom_last">(입력하신 E-mail 주소로 확인 메일을 보내드립니다.)</a>
			<div>
				<div id="t_bottom_text">
					<a class="t_text_title">[고유식별정보 수집 및 이용 동의]</a> 
						<ul class="t_text_list">
							<li><a class="bold">수집항목</a><a class="normal"> : 주민번호</a></li>
							<li><a class="bold">수집목적</a><a class="normal"> : 본인확인 및 거래내역 조회</a></li>
							<li><a class="bold">이용기간</a><a class="normal"> : 이용목적 달성 후 지체없이 파기 </a></li>
						</ul>
						<a class="normal">고유식별정보 수집에 동의하시는 경우 </a><a class="bold">결제버튼</a><a class="normal">을, 동의하지 않는 경우 </a><a class="bold">취소버튼</a><a class="normal">을 눌러주시기 바랍니다.</a>
					<a class="t_text_title">[OTP/보안카드 관련 안내]</a>
						<ul class="t_text_list">
							<li><a class="bold">은행</a> 
					   			<a class="normal">기업/광주/국민/농협/대구/부산/산업/수협/신한/우리/전북/하나/SC은행</a>
							</li>
							<li><a class="bold">증권</a>  
					   			<a class="normal">대신/동부/동양/미래에셋/신영/신한금융투자/하나대투/하이투자/한국투자/한화/현대/HMC투자/SK증권</a>
							</li>
							<li><a class="bold">기타</a> 
					   			<a class="normal">산림조합/새마을금고/신협/우체국</a>
							</li>
						</ul>
					   <a class="t_text_bottom_line">상기계좌는 OTP/보안카드 확인 단계가 추가될 수 있습니다.</a> 
					   <a class="t_text_bottom_line">고객가치를 극대화하는 지급결제파트너 </a><a class="normal">금융결제원</a>
				</div>
				<div id="t_bottom_buttons">
					<button class="t_bottom_button" id="t_bottom_button_first">개인정보처리 방침</button>
					<button class="t_bottom_button" id="t_bottom_button_cancle">취소</button>
					<button class="t_bottom_button" id="t_bottom_button_charge">결제</button>
				</div>
				<a class="normal" id="last_line">결제관련문의:금융결제원 고객센터 1577-5500(단축번호/:61)</a>
			</div>
		</div>
	</div>
</body>
</html>
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
#card_add{
border: 2px outset #c2c2c2;
width:394px;
height: 350px;
}
#c_a_title{
margin: 5px;
border-bottom: 1px solid #7d7d7d;
}
#c_a_head{
height: 30px;
}
#c_a_title_img{
height: 20px;
}
#c_a_title_font{
font-size: 11px;
color:#666666;
float: right;
padding-right: 5px;
padding-top: 20px;
}
.c_a_title_bold{
font-size: 11px;
color:#666666;
font-weight: bold;
}
.c_a_title_normal{
font-size: 11px;
color:#666666;
}
#c_a_contents{
margin: 5px;
border-bottom: 1px solid #7d7d7d;
margin-bottom: 10px;
height: 245px;
}
.card_num{
width:30px;
border: 1px inset #e3e3e3;
}
#email_input{
border: 1px inset #e3e3e3;
width:180px;
}
#card_info_insert{
margin: 5px;
border: 1px solid #dddddd;
border-spacing: 0px;
width:370px;
}
#card_info_insert tr{
height: 35px;
}
#card_info_insert th{
background-color: #eeeeee;
font-size: 12px;
color:#666666;
text-align: left;
padding-left: 10px;
font-weight: normal;
border-bottom: 1px solid #dddddd;
}
#card_info_insert td{
padding-left: 10px;
font-size: 12px;
border-bottom: 1px solid #dddddd;
}
#c_line_first{
padding-left: 10px;
}
#card_pass2{
width:15px;
}
#card_pass3{
width:50px;
}
#card_cvc{
width:25px;
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
margin-left: 130px;
}
#s_b_cencle{
background: linear-gradient(to bottom, rgba(95,95,95,1) 0%,rgba(76,76,76,1) 100%);
border: 2px outset #343434;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div id="card_add">
	<div id="c_a_title">
		<img alt="" id="c_a_head" src="../../image_mypage/ema_head.png">
		<img alt="" id="c_a_title_img" src="../../image_mypage/safe_buy_title2.png">
		<a id="c_a_title_font">안전결제 신청</a>
	</div>
	<div id="c_a_contents">
		<a class="c_a_title_bold" id="c_line_first"> 신용카드 정보</a>
		<a class="c_a_title_normal">와</a> 
		<a class="c_a_title_bold">이메일 주소</a>
		<a class="c_a_title_normal">를 정확히 입력해 주세요.</a>
		<div>
			<table id="card_info_insert">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>카드번호</th>
					<td>
						<input type="text" class="card_num">
						-
						<input type="text" class="card_num">
						-
						<input type="password" class="card_num">
						-
						<input type="password" class="card_num">
					</td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td>
						<input type="text" id="email_input">
					</td>
				</tr>
				<tr>
					<th>카드비밀번호</th>
					<td>
						<input type="text" id="card_pass2">
						**카드비밀번호 앞 두자리
					</td>
				</tr>
				<tr>
					<th>CVC</th>
					<td>
						<input type="text" id="card_cvc">
						카드뒷면 세자리
					</td>
				</tr>
				<tr>
					<th>안전결제비밀번호</th>
					<td>
						<input type="text" id="card_pass3">
					</td>
				</tr>
				<tr>
					<th>유효기간</th>
					<td>
						<select>
							<option>선택</option>
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>07</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
						(월)
						<select>
							<option>선택</option>
							<option>2013</option>
							<option>2014</option>
							<option>2015</option>
							<option>2016</option>
							<option>2017</option>
							<option>2018</option>
							<option>2019</option>
						</select>
						(년)
					</td>
				</tr>
			</table>
		</div>
		<button class="safe_buy_button" id="s_b_confirm">확인</button>
		<button class="safe_buy_button" id="s_b_cencle">취소</button>
	</div>
</div>
</body>
</html>
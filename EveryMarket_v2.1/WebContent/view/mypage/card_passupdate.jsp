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
#card_passupdate{
border: 2px outset #c2c2c2;
width:394px;
height: 294px;
}
#c_p_title{
margin: 5px;
border-bottom: 1px solid #7d7d7d;
}
#c_p_head{
height: 30px;
}
#c_p_title_img{
height: 20px;
}
#c_p_title_font{
font-size: 11px;
color:#666666;
float: right;
padding-right: 5px;
padding-top: 20px;
}
.c_p_title_bold{
font-size: 11px;
color:#666666;
font-weight: bold;
}
.c_p_title_normal{
font-size: 11px;
color:#666666;
}
#c_p_contents{
margin: 5px;
border-bottom: 1px solid #7d7d7d;
margin-bottom: 10px;
height: 215px;
}
#card_info_update{
margin: 5px;
border: 1px solid #dddddd;
border-spacing: 0px;
width:370px;
}
#card_info_update tr{
height: 35px;
}
#card_info_update th{
background-color: #eeeeee;
font-size: 12px;
color:#666666;
text-align: left;
padding-left: 10px;
font-weight: normal;
border-bottom: 1px solid #dddddd;
}
#card_info_update td{
padding-left: 10px;
font-size: 12px;
border-bottom: 1px solid #dddddd;
}
.card_num{
width:30px;
border: 1px inset #e3e3e3;
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
<div id="card_passupdate">
	<div id="c_p_title">
		<img alt="" id="c_p_head" src="../../image_mypage/ema_head.png">
		<img alt="" id="c_p_title_img" src="../../image_mypage/safe_buy_title2.png">
		<a id="c_p_title_font">안전결제 비밀번호 변경</a>
	</div>
	<div id="c_p_contents">
		<a class="c_p_title_bold" id="c_line_first">기존비밀번호</a>
		<a class="c_p_title_normal">와</a> 
		<a class="c_p_title_bold">바꿀 비밀번호</a>
		<a class="c_p_title_normal">를 입력해 주세요.</a>
		<div>
			<table id="card_info_update">
				<colgroup>
					<col width="35%">
					<col width="65%">
				</colgroup>
				<tr>
					<th>카드번호</th>
					<td>
						<input type="text" class="card_num" readonly="readonly">
						-
						<input type="text" class="card_num" readonly="readonly">
						-
						<input type="password" class="card_num" readonly="readonly">
						-
						<input type="password" class="card_num" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>기존비밀번호</th>
					<td>
						<input type="password" id="card_pass3">
					</td>
				</tr>
				<tr>
					<th>바꿀비밀번호</th>
					<td>
						<input type="password" id="card_pass3">
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
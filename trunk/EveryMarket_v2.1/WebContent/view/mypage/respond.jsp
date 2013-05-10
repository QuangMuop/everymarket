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
#r_title{
background-color: #dc2342;
height: 45px;
}
#r_alert{
margin:15px;
font-size: 11px;
color:#666666;
padding-left: 15px;
}
#r_alert li{
margin-bottom: 10px;
}
#r_insert_table{
border-top: 2px solid #454545;
margin: 15px;
width:650px;
border-spacing: 0px;
border-bottom: 1px solid #cccccc;
}
#r_insert_table tr{
height: 35px;
}
#r_insert_table th{
background-color: #f8f8f8;
text-align: left;
color:#4d4d4d;
font-size: 12px;
padding-left: 10px;
border-bottom: 1px solid #ececec;
}

#r_insert_table td{
padding-left:10px;
font-size:12px;
border-bottom: 1px solid #ececec;
}
#r_inner_table{
border-spacing: 0px;
border-top: 1px solid #58cbba;
margin-left: 10px;
}
#r_inner_table th{
text-align: center;
bo
}
#r_inner_table tr{
height: 25px;
text-align: center;
}
#r_inner_table td{
color:#808080;
font-size: 11px;
}
#respond_num{
border: 1px solid #e5e5e5;
font-size: 11px;
width:180px;
}
#r_line{
color:#4d4d4d;
}
#respond_name{
border: 1px solid #e5e5e5;
font-size: 11px;
width:100px;
}
#r_request{
border: 1px solid #f30e09;
color:#f30e09;
font-size: 12px;
background-color: #ffece5;
height: 30px;
width:80px;
border-radius:2px;
margin-left: 300px;
cursor: pointer;
}
#r_requset_button{
height: 17px;
margin: 8px;

}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#r_request").click(function(){
		alert("환급신청이 완료되었습니다^^ 관리자 승인 후 환급되겠습니다.");
	});
});
</script>
</head>
<body>
<div id="cash_respond">
	<div id="r_title">
		<img alt="" src="../../image_mypage/respond_title.png">
	</div>
	<ul id="r_alert">
		<li>cash인출 시 최소금액은 1회 1000원 이며 최대금액은 1외 200만원입니다.</li>
		<li>cash인출 시 인출 계좌를 입력해야하며, 회원 본인 명의의 계좌로만 인출하실 수 있습니다.</li>
		<li>인출 신청을 하시면 인출신청일 다음날 EVERYMARKET에서 승인을 한 뒤, 인출신청일 기준 2일 후에 입금됩니다.</li>
	</ul>
	<div id="r_insert">
		<table id="r_insert_table">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tr>
				<th>환급 금액입력</th>
				<td>
					<input type="text" id="respond_input">
					원
				</td>
			</tr>
			<tr>
				<th>환급 계좌입력</th>
				<td id="r_line">환급받고자 하는 계좌를 입력해주세요.
					<div>
					<table id="r_inner_table">
						<colgroup>
							<col width="20%">
							<col width="50%">
							<col width="30%">
						</colgroup>
						<tr>
							<th>은행</th>
							<th>계좌번호</th>
							<th>예금주</th>
						</tr>
						<tr>
							<td>
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
							</td>
							<td>
								<input type="text" id="respond_num" value="'-'없이 숫자로만 입력해주세요">
								
							</td>
							<td>
								<input type="text" id="respond_name" value="관리자">
							</td>
						</tr>
						
					</table>
					</div>
				</td>
				
			</tr>
		</table>
	</div>
	<div id="r_request">
		<img alt="" id="r_requset_button" src="../../image_mypage/respond_request.png">
	</div>
</div>
</body>
</html>
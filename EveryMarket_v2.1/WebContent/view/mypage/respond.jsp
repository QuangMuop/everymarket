<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
.hidden{
	display: none;
}
</style>
<script src="../../scripts/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#refundAmount").change(function(){
		var refundAmount = $(this).val();
		
		switch (refundAmount) {
		case "notSelected":
			$("#refundRate").append(
				"<span class='hidden'></span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			break;
		case "1000":
			$("#refundRate").append(
				"<span class='hidden'>환급수수료 비율: 10%</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			break;
		case "5000":
			$("#refundRate").append(
				"<span class='hidden'>환급수수료 비율: 8%</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			break;
		case "10000":
			$("#refundRate").append(
				"<span class='hidden'>환급수수료 비율: 6%</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			break;
		case "50000":
			$("#refundRate").append(
				"<span class='hidden'>환급수수료 비율: 5%</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			break;
		case "100000":
			$("#refundRate").append(
				"<span class='hidden'>환급수수료 비율: 4%</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			break;
		case "500000":
			$("#refundRate").append(
				"<span class='hidden'>환급수수료 비율: 3%</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			break;
		case "1000000":
			$("#refundRate").append(
				"<span class='hidden'>환급수수료 비율: 2%</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			break;
		case "2000000":
			$("#refundRate").append(
				"<span class='hidden'>환급수수료 비율: 1%</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
			break;
		}
	});
	
	$("#r_request").click(function(){
		if($("#refundAmount").val() == "notSelected"){
			alert("환급금액을 선택해주세요!");
		}else if($("#refundAccount").val().length == 0 || isNaN($("#refundAccount").val())){
			alert("올바른 계좌번호를 입력해주세요.");
		}else if($("#refundName").val().length == 0){
			alert("예금주명을 입력해주세요.");
		}else{
			$.getJSON(
				"/EveryMarket_v2.1/getM_cash.do",
				function(data){
					if(data.m_cash >= $("#refundAmount").val()){
						alert($("#refundAmount").val() + "원에 대한 환급을 요청합니다. 관리자 승인 후 환급처리됩니다.");
						
						opener.parent.location.href="../../refundCash.do" +
								"?refundAmount=" + $("#refundAmount").val() +
								"&bankName=" + $("#bankName").val() + 
								"&refundAccount=" + $("#refundAccount").val() +
								"&refundName=" + $("#refundName").val();
						window.close();	
					}else{
						alert("회원님의 캐쉬잔액이 부족합니다.");
					}
				}
			);
		}
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
		<li>cash인출 시 최소금액은 1회 1000원 이며 최대금액은 1회 200만원입니다.</li>
		<li>1회 인출금액에 따라 환급수수료가 다르게 적용되니 환급신청 전 꼭 확인하시기 바랍니다.</li>
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
					<select id="refundAmount">
						<option value="notSelected" selected="selected">환급금액 선택</option>
						<option value="1000">천원</option>
						<option value="5000">오천원</option>
						<option value="10000">만원</option>
						<option value="50000">오만원</option>
						<option value="100000">십만원</option>
						<option value="500000">오십만원</option>
						<option value="1000000">백만원</option>
						<option value="2000000">이백만원</option>
					</select>원
					<span id="refundRate">
						<span></span>
					</span>
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
								<select id="bankName">
									<option value="농협">농협</option>
									<option value="국민">국민</option>
									<option value="우리">우리</option>
									<option value="신한">신한</option>
									<option value="하나">하나</option>
									<option value="기업">기업</option>
									<option value="부산">부산</option>
									<option value="외환">외환</option>
									<option value="광주">광주</option>
									<option value="제일">제일</option>
									<option value="경남">경남</option>								
								</select>
							</td>
							<td>
								<input type="text" id="refundAccount" placeholder="'-'없이 숫자로만 입력해주세요">
							</td>
							<td>
								<input type="text" id="refundName" placeholder="예금주명">
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
	
	<!-- r_cancle로 취소 or 창닫기버튼 만들고 자바스크립트에 주석처리한 이벤트 주석 풀어주긔 -->
	
</div>
</body>
</html>
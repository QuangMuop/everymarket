<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div id="cash_respond">
	<div id="r_title">
		<img alt="" src="image_mypage/respond_title.png">
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
		<img alt="" id="r_requset_button" src="image_mypage/respond_request.png">
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div id="card_add">
	<div id="c_a_title">
		<img alt="" id="c_a_head" src="image_mypage/ema_head.png">
		<img alt="" id="c_a_title_img" src="image_mypage/safe_buy_title2.png">
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
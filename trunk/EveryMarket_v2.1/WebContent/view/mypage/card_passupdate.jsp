<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div id="card_passupdate">
	<div id="c_p_title">
		<img alt="" id="c_p_head" src="image_mypage/ema_head.png">
		<img alt="" id="c_p_title_img" src="image_mypage/safe_buy_title2.png">
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
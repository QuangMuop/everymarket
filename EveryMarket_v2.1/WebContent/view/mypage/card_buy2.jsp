<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="jquery-1.9.1.min.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
<div id="safe_buy">
	<div id="sb_title">
		<img alt="" id="ema_head" src="image_mypage/ema_head.png">
		<img alt="" id="safe_buy_title" src="image_mypage/safe_buy_title.png">
		<button class="safe_title_button">안전결제 서비스란</button>
		<button class="safe_title_button">도움말</button>
	</div>
	<div id="sb_contents">
		<a class="safe_buy_normal">- 충전금액을 확인하시고 </a>
		<a class="safe_buy_bold">할부기간</a>
		<a class="safe_buy_normal">을 선택해 주십시오.</a>
		<table id="sb_c_table">
			<colgroup>
				<col width="25%">
				<col width="35%">
				<col width="18%">
				<col width="22%">
			</colgroup>
			<tr>
				<th>충전금액</th>
				<td>10000 WON</td>
				<th>할부기간</th>
				<td>
					<select>
						<option>일시불</option>
					</select>
				</td>
			</tr>
		</table>
		
		<a class="safe_buy_normal">- 결제하실 </a>
		<a class="safe_buy_bold">카드를 선택</a>
		<a class="safe_buy_normal">하시고</a>
		<a class="safe_buy_bold">안전결제 비밀번호</a>
		<a class="safe_buy_normal">를 입력하여 주십시오.</a>
		<table id="sb_c_table">
			<colgroup>
				<col width="25%">
				<col width="75%">
			</colgroup>
			<tr id="select_line">
				<th>저장위치 선택</th>
				<td>
					<div class="select_box">
						<img alt="" id="pc" src="image_mypage/PC.png">
					</div>
					<div class="select_box">
						<img alt="" id="phone" src="image_mypage/phone.png">
					</div>
					<div class="select_box">
						<img alt="" id="usb" src="image_mypage/usb.png">
					</div>
					<div class="select_box">
						<img alt="" id="iccard" src="image_mypage/ICcard.png">
					</div>
					<a class="safe_buy_red">휴대폰</a>
					<a class="safe_buy_normal">에 저장해서 이용하시면 더욱</a>
					<a class="safe_buy_red">안전</a>
					<a class="safe_buy_normal">하고</a>
					<a class="safe_buy_red">편리</a>
					<a class="safe_buy_normal">합니다.</a>
				</td>
			</tr>
			<tr>
				<th>카드선택</th>
				<td>
					<div id="card_select_blank">
					
					</div>
				</td>
			</tr>
			<tr>
				<th>안전결제 비밀번호</th>
				<td>
					<input type="password" id="card_pass">				
				</td>
			</tr>
		</table>
		<button class="safe_buy_mid_button" id="safe_card_passupdate">안전결제 비밀번호 변경 바로가기</button>
		<button class="safe_buy_mid_button" id="safe_card_add">안전결제 신청 바로가기</button>
		
	</div>
	<button class="safe_buy_button" id="s_b_confirm">확인</button>
	<button class="safe_buy_button" id="s_b_cencle">취소</button>
	<img alt="" src="image_mypage/s_c_banner.png">
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div id="p_contents">
		<div id="p_title_img">
			<img id="p_top_img" alt="" src="image_mypage/phone_title.png">
		</div>
		<div id="p_inner">
			<img id="p_inner_title" alt="" src="image_mypage/p_inner_title.png">
			<img id="p_title_plus" alt="" src="image_mypage/p_title_plus.png">
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
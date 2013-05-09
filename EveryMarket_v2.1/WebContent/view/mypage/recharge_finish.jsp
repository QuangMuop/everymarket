<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="jquery-1.9.1.min.js" type="text/javascript"></script>

</head>
<body>
	<div id="cash_finish">
		<img alt="" src="image_mypage/cash_finish_title.png">
	</div>
	<div id="f_inner_contents">
		<div id="f_memo" class="f_inner">
			<img alt="" id="f_image" src="image_mypage/cash_finish.png">
		</div>
		<div class="f_inner">
			<img alt="" id="f_image2" src="image_mypage/f_title_info.png">
			<a>아래의 계좌로 5영업일 이내에 입금하여 주십시요.</a>
		</div>
		<div class="f_inner">
			<table id="f_inner_table">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
				</colgroup>
				<tr>
					<th>입금할 은행</th>
					<td>농협</td>
					<th>입금자 명</th>
					<td class="t_rightbar">관리자</td>
				</tr>
				<tr>
					<th>예금주</th>
					<td>EVERY(주)</td>
					<th>입금 금액</th>
					<td class="t_rightbar">10000원</td>
				</tr>
				<tr>
					<th>입금할 계좌번호</th>
					<td>03281364888529</td>
					<th>입금기한</th>
					<td class="t_rightbar">2013년 05월 14일까지</td>
				</tr>
			</table>
			<a id="alert">기한일까지 입금이 되지 않을 경우 충전은 자동 취소됩니다.</a>
			<button class="confirm">
				<img src="image_mypage/confirm.png">
			</button>
		</div>
	</div>
</body>
</html>
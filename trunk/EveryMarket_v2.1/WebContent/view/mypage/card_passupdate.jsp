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
		<a id="c_p_title_font">�������� ��й�ȣ ����</a>
	</div>
	<div id="c_p_contents">
		<a class="c_p_title_bold" id="c_line_first">������й�ȣ</a>
		<a class="c_p_title_normal">��</a> 
		<a class="c_p_title_bold">�ٲ� ��й�ȣ</a>
		<a class="c_p_title_normal">�� �Է��� �ּ���.</a>
		<div>
			<table id="card_info_update">
				<colgroup>
					<col width="35%">
					<col width="65%">
				</colgroup>
				<tr>
					<th>ī���ȣ</th>
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
					<th>������й�ȣ</th>
					<td>
						<input type="password" id="card_pass3">
					</td>
				</tr>
				<tr>
					<th>�ٲܺ�й�ȣ</th>
					<td>
						<input type="password" id="card_pass3">
					</td>
				</tr>
			</table>
		</div>
		<button class="safe_buy_button" id="s_b_confirm">Ȯ��</button>
		<button class="safe_buy_button" id="s_b_cencle">���</button>
	</div>
</div>
</body>
</html>
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
		<button class="safe_title_button">�������� ���񽺶�</button>
		<button class="safe_title_button">����</button>
	</div>
	<div id="sb_contents">
		<a class="safe_buy_normal">- �����ݾ��� Ȯ���Ͻð� </a>
		<a class="safe_buy_bold">�ҺαⰣ</a>
		<a class="safe_buy_normal">�� ������ �ֽʽÿ�.</a>
		<table id="sb_c_table">
			<colgroup>
				<col width="25%">
				<col width="35%">
				<col width="18%">
				<col width="22%">
			</colgroup>
			<tr>
				<th>�����ݾ�</th>
				<td>10000 WON</td>
				<th>�ҺαⰣ</th>
				<td>
					<select>
						<option>�Ͻú�</option>
					</select>
				</td>
			</tr>
		</table>
		
		<a class="safe_buy_normal">- �����Ͻ� </a>
		<a class="safe_buy_bold">ī�带 ����</a>
		<a class="safe_buy_normal">�Ͻð�</a>
		<a class="safe_buy_bold">�������� ��й�ȣ</a>
		<a class="safe_buy_normal">�� �Է��Ͽ� �ֽʽÿ�.</a>
		<table id="sb_c_table">
			<colgroup>
				<col width="25%">
				<col width="75%">
			</colgroup>
			<tr id="select_line">
				<th>������ġ ����</th>
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
					<a class="safe_buy_red">�޴���</a>
					<a class="safe_buy_normal">�� �����ؼ� �̿��Ͻø� ����</a>
					<a class="safe_buy_red">����</a>
					<a class="safe_buy_normal">�ϰ�</a>
					<a class="safe_buy_red">��</a>
					<a class="safe_buy_normal">�մϴ�.</a>
				</td>
			</tr>
			<tr>
				<th>ī�弱��</th>
				<td>
					<div id="card_select_blank">
					
					</div>
				</td>
			</tr>
			<tr>
				<th>�������� ��й�ȣ</th>
				<td>
					<input type="password" id="card_pass">				
				</td>
			</tr>
		</table>
		<button class="safe_buy_mid_button" id="safe_card_passupdate">�������� ��й�ȣ ���� �ٷΰ���</button>
		<button class="safe_buy_mid_button" id="safe_card_add">�������� ��û �ٷΰ���</button>
		
	</div>
	<button class="safe_buy_button" id="s_b_confirm">Ȯ��</button>
	<button class="safe_buy_button" id="s_b_cencle">���</button>
	<img alt="" src="image_mypage/s_c_banner.png">
</div>
</body>
</html>
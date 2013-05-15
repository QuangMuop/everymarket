<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>: �������Ա� ������</title>
<style type="text/css">
body{
margin: 0px;
background-image: url(ema2.png);
}

#cash_finish{
background: #dc2342;
height: 45px;
border-bottom: 1px solid #e73654;
}
.f_inner{
margin: 10px;
}
#f_image{
height: 70px;
margin-left: 125px;
}
#f_memo{
background-color: #fefdf4;
border: 1px solid #fcf4d2;
border-radius: 3px;
}
#f_inner_contents{
margin:15px;
border: 1px solid #fdd587;
border-radius: 3px;
height: 300px;
}
.f_inner{
 margin-bottom: 5px;

}
.f_inner a{
 font-size: 12px;
 color:#808080;
margin-left: 10px;
}
#f_image2{
height: 20px;
}
#f_inner_table{
border-top: 1px solid #58cbba;
border-spacing: 0px;
width:545px;
margin-bottom: 10px;
}
#f_inner_table th{
background-color: #fafafa;
border-left: 1px solid #d9d9d9;
border-right: 1px solid #d9d9d9;
border-bottom: 1px solid #d9d9d9;
font-size: 12px;
text-align: left;
color: #666666;
text-decoration: none;
height: 25px;
padding-left: 5px;
}
#f_inner_table td{
border-bottom: 1px solid #d9d9d9;
padding-left: 5px;
font-size: 11px;
color:#808080;
}
.t_rightbar{
border-right: 1px solid #d9d9d9;
}
.confirm{
background-color: #eb8219;
height: 30px;
width:100px;
border: 1px solid #f87b1f;
border-radius: 3px;
float: left;
margin:50px;
margin-top: 20px;
margin-left: 230px;
}
.confirm img{
height: 20px;
}
#alert{
float: left;
margin-left: 10px;
margin-right: 120px;
}
</style>
<script src="jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var rechargeAmount = opener.document.getElementById("c_inner_pass_input").value;
		$("#rechargeAmount").html(rechargeAmount + "��");
		
		$.getJSON(
			"/EveryMarket_v2.1/getExpirationDate.do",
			function(data){
				$("#expirationDate").html(
					(data.expirationDate.year + 1900) + "�� " +
					(data.expirationDate.month + 1) + "�� " +
					data.expirationDate.date + "��"
				);
			}
		);
		
		$(".confirm").click(function(){
			opener.parent.opener.parent.location.href="../../chargeCash.do?m_cash=" + rechargeAmount;
			opener.close();
			window.close();		
		});
	});
</script>
</head>
<body>
	<div id="cash_finish">
		<img alt="" src="../../image_mypage/cash_finish_title.png">
	</div>
	<div id="f_inner_contents">
		<div id="f_memo" class="f_inner">
			<img alt="" id="f_image" src="../../image_mypage/cash_finish.png">
		</div>
		<div class="f_inner">
			<img alt="" id="f_image2" src="../../image_mypage/f_title_info.png">
			<a>�Ʒ��� ���·� 5������ �̳��� �Ա��Ͽ� �ֽʽÿ�.</a>
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
					<th>�Ա��� ����</th>
					<td>����</td>
					<th>�Ա��� ��</th>
					<td class="t_rightbar">������</td>
				</tr>
				<tr>
					<th>������</th>
					<td>EVERY(��)</td>
					<th>�Ա� �ݾ�</th>
					<td class="t_rightbar" id="rechargeAmount"></td>
				</tr>
				<tr>
					<th>�Ա��� ���¹�ȣ</th>
					<td>03281364888529</td>
					<th>�Աݱ���</th>
					<td class="t_rightbar" id="expirationDate"></td>
				</tr>
			</table>
			<a id="alert">�����ϱ��� �Ա��� ���� ���� ��� ������ �ڵ� ��ҵ˴ϴ�.</a>
			<button class="confirm">
				<img src="../../image_mypage/confirm.png">
			</button>
		</div>
	</div>
</body>
</html>
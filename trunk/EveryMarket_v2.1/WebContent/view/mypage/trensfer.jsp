<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>: ������ü ������ :</title>
<style type="text/css">
body{
margin: 0px;
}
#t_contents{
border: 2px outset #545a56;
height: 500px;
background-color: #ecf3fb;
}
#t_title_img{
margin:5px;
border: 1px solid #9f9f9d;
border-radius: 3px;
background-color: white;
}
#trensfer_table1{
margin:5px;
background-color: #f6f4f5;
border-bottom: 1px solid #a0a0a0;
border-top: 1px solid #a0a0a0;
}
#trensfer_table1 th{
background-color: #b8c7e6;
font-size: 11px;
color:black;
text-align: center;
font-weight: normal;
}
#trensfer_table1 tr{
height: 20px;
}
.t_button{
width: 95px;
font-size: 11px;
color:white;
background-color: #b8c7e6;
border: 1px solid #0d79d3;
border-radius:3px;
}
.t_input{
border: 1px solid #d2d2d2;
padding-left: 5px;
}
#trensfer_name{
height: 20px;
}
#t_contents_inner{
border-radius:5px;
background-color: #f6f4f5;
border: 1px solid #c0c0c0;
margin: 5px;
}
#trensfer_table2{
margin:5px;
margin-top:20px;
border-bottom: 1px solid #c0c0c0;
border-top: 1px solid #c0c0c0;
border-spacing: 0px;
}
#trensfer_table2 th{
font-size: 11px;
color:black;
font-weight: normal;
text-align: center;
border: 1px outset white;
background-color: #d3d3d3;
}
#trensfer_table2 tr:nth-child(odd) th{
background-color: #e5e5e5;
}
#trensfer_table2 td{
padding: 0px;
background-color: white;
border-bottom: 1px solid #c0c0c0;
border-right: 1px solid #c0c0c0;
}
#trensfer_table2 td a{
font-size: 12px;
}
.t_table2_input{
padding:0px;
border: 0px;
width:180px;
}
#t_table2_select{
background-color: white;
width:260px;
}
#t_table_pass{
width:237px;

}
#t2_alert{
font-size: 12px;
margin-left:100px;
color:#808080;
}
#t_bottom{
margin-top: 15px;
}
#t_bottom *{
margin-left:10px;
}
.t_bottom_a{
width:400px;
margin-top: 5px;
margin-bottom: 10px;
}
#t_email{
width:100px;
font-size: 11px;

}
#t2_inner_line{
height: 20px;
padding: 3px;
padding-top: 5px;
}
#t_bottom_email{
border: 1px solid #c0c0c0;
margin-left: 30px;
width: 200px;
}
.t_bottom_last{
color:#48698a;
font-size: 11px;
float: right;
margin-right: 20px;
}	
#t_bottom_text{
margin-top:20px;
overflow: scroll;
overflow-x:hidden; 
width:340px;
height: 100px;
background-color: white;
border:1px solid #808080;

}
#t_bottom_text *{
margin-left: 0px;
}
.t_text_title{
font-size: 12px;
font-weight: bold;
float: left;
width:330px;
}
.t_text_list{
list-style: none;
padding:0px;
margin: 0px;
padding-left:5px;
color:blue;
list-style-type: circle;
width:320px;
}
.t_text_list li{
margin-left: 0px;
width:320px;
float: left;
}
.t_text_bottom_line{
font-size: 12px;
float: left;
}
.bold{
font-weight: bold;
font-size: 12px;
float: left;
}
.normal{
font-size: 12px;
float: left;
}
.t_bottom_button{
width:85px;
height: 15px;
border: 1px solid #818181;
background-color: #aec4f2;
font-size: 11px;
text-align: center;
margin-top: 10px;
float: right;

border-radius:3px;
}
#t_bottom_button_first{
width:130px;
float: left;
}
#t_bottom_buttons{
margin-left:0px;
height: 30px;
width: 350px;
border-bottom: 1px solid #c6ced6;
}
#last_line{
margin-top: 5px;
}
</style>
<script src="../../scripts/lib/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var rechargeAmount = opener.document.getElementById("c_inner_pass_input").value;
		$("#rechargeAmount").attr("value", rechargeAmount);
		
		$("#t_bottom_button_charge").click(function(){
			alert(rechargeAmount + "���� ���� ������ ��û�մϴ�.");
			
			opener.parent.opener.parent.location.href="../../chargeCash.do?m_cash=" + rechargeAmount;
			opener.close();
			window.close();
		});
		
		$("#t_bottom_button_cancle").click(function(){
			window.close();
		});
	});
</script>
</head>
<body>
	<div id="t_contents">
		<div id="t_title_img">
			<img alt="" src="../../image_mypage/trensfer_1_1.png">
		</div>
		<div>
			<img alt="" id="trensfer_name" src="../../image_mypage/trensfer_name.png">
		</div>
		<div id="t_contents_inner">
			<table id="trensfer_table1">
				<colgroup>
					<col width="30%">
					<col width="40%">
					<col width="30%">
				</colgroup>
				<tr>
					<th>�̿�����</th>
					<td>
					<input type="text" class="t_input" value="EVERYMARKET(��)">
					</td>
					<td><button class="t_button">����ѵ�Ȯ��</button></td>
				</tr>
				<tr>
					<th>��  ��</th>
					<td>
					<input type="text" class="t_input" id="rechargeAmount" readonly="readonly">
					</td>
					<td><button class="t_button">�������Ȯ��</button></td>
				</tr>
			</table>
			<table id="trensfer_table2">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tr>
					<th>����</th>
					<td>
						<select class="t_table2_input" id="t_table2_select">
							<option>����  00:00 ~ 24:00</option>
							<option>����  00:00 ~ 24:00</option>
							<option>�츮  00:15 ~ 23:50</option>
							<option>����  00:00 ~ 24:00</option>
							<option>�ϳ�  00:15 ~ 23:50</option>
							<option>���  00:00 ~ 24:00</option>
							<option>�λ�  00:10 ~ 23:50</option>
							<option>��ȯ  00:15 ~ 23:50</option>
							<option>����  00:10 ~ 23:50</option>
							<option>����  00:15 ~ 23:50</option>
							<option>�泲  00:10 ~ 23:50</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>���¹�ȣ</th>
					<td>
						<input type="text"  class="t_table2_input">
						<a>('-' ����)</a>
						<img alt="" src="../../image_mypage/key.png">
					</td>
				</tr>
				<tr>
					<th>��й�ȣ</th>
					<td>
						<input type="password" id="t_table_pass" class="t_table2_input">
						<img alt="" src="../../image_mypage/key.png">
					</td>
				</tr>
				<tr>
					<th>�ֹι�ȣ</th>
					<td>
						<input type="text" class="t_table2_input">
						<a>('-' ����)</a>
						<img alt="" src="../../image_mypage/key.png">
					</td>
				</tr>
			</table>
			<a id="t2_alert">(���ΰ����� ��� ����ڵ�Ϲ�ȣ�Է�)</a>
		</div>
		<div id="t_bottom">
			<a id="t2_alert" class="t_bottom_a">�Է��Ͻ� ���������� ��ȣȭ�Ǿ� ����������� ���� �����˴ϴ�.</a>
			<div id="t2_inner_line">
				<input type="checkbox">
				<a id="t_email">E-mail ����</a>
				<input type="text"  class="t_table2_input" id="t_bottom_email">
			</div>
			<a class="t_bottom_last">(�Է��Ͻ� E-mail �ּҷ� Ȯ�� ������ �����帳�ϴ�.)</a>
			<div>
				<div id="t_bottom_text">
					<a class="t_text_title">[�����ĺ����� ���� �� �̿� ����]</a> 
						<ul class="t_text_list">
							<li><a class="bold">�����׸�</a><a class="normal"> : �ֹι�ȣ</a></li>
							<li><a class="bold">��������</a><a class="normal"> : ����Ȯ�� �� �ŷ����� ��ȸ</a></li>
							<li><a class="bold">�̿�Ⱓ</a><a class="normal"> : �̿���� �޼� �� ��ü���� �ı� </a></li>
						</ul>
						<a class="normal">�����ĺ����� ������ �����Ͻô� ��� </a><a class="bold">������ư</a><a class="normal">��, �������� �ʴ� ��� </a><a class="bold">��ҹ�ư</a><a class="normal">�� �����ֽñ� �ٶ��ϴ�.</a>
					<a class="t_text_title">[OTP/����ī�� ���� �ȳ�]</a>
						<ul class="t_text_list">
							<li><a class="bold">����</a> 
					   			<a class="normal">���/����/����/����/�뱸/�λ�/���/����/����/�츮/����/�ϳ�/SC����</a>
							</li>
							<li><a class="bold">����</a>  
					   			<a class="normal">���/����/����/�̷�����/�ſ�/���ѱ�������/�ϳ�����/��������/�ѱ�����/��ȭ/����/HMC����/SK����</a>
							</li>
							<li><a class="bold">��Ÿ</a> 
					   			<a class="normal">�긲����/�������ݰ�/����/��ü��</a>
							</li>
						</ul>
					   <a class="t_text_bottom_line">�����´� OTP/����ī�� Ȯ�� �ܰ谡 �߰��� �� �ֽ��ϴ�.</a> 
					   <a class="t_text_bottom_line">����ġ�� �ش�ȭ�ϴ� ���ް�����Ʈ�� </a><a class="normal">����������</a>
				</div>
				<div id="t_bottom_buttons">
					<button class="t_bottom_button" id="t_bottom_button_first">��������ó�� ��ħ</button>
					<button class="t_bottom_button" id="t_bottom_button_cancle">���</button>
					<button class="t_bottom_button" id="t_bottom_button_charge">����</button>
				</div>
				<a class="normal" id="last_line">�������ù���:���������� ������ 1577-5500(�����ȣ/:61)</a>
			</div>
		</div>
	</div>
</body>
</html>
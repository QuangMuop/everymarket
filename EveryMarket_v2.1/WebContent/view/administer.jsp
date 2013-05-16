<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./styles/board_qna.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="admin_body">
	<div id="admin_title">
		<img alt="" id="admin_title_img" src="image_board/admin_title.png">
	</div>
	
	<div id="admin_tab_bar">
		<span class="actived" id="admin_m1">
			<img id='admin_m1' class='admin_bar_img' src='image_board/admin_bar1.png'>	
		</span>
		<span id="admin_m2">
			<img id='admin_m2' class='admin_bar_img' src='image_board/admin_bar2_back.png'>
		</span>
		<span id="admin_m3">
			<img id='admin_m3' class='admin_bar_img' src='image_board/admin_bar3_back.png'>
		</span>
		<span id='admin_m4'>
			<img id='admin_m4' class='admin_bar_img' src='image_board/admin_bar4_back.png'>
		</span>
		<span id="admin_m5">
			<img id="admin_m5" class="admin_bar_img" src='image_board/admin_bar6_back.png'>
		</span>
		<span id="admin_m6">
			<img id='admin_m6' class='admin_bar_img' src='image_board/admin_bar5_back.png'>
		</span>
	</div>
	
	<div id="memberList" class="tabContent">
		<table>
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>���̵�</th>
				<th>��й�ȣ</th>
				<th>�г���</th>
				<th>�̸�</th>
				<th>����ó</th>
				<th>E_Money</th>
				<th>�����Ű�Ƚ��</th>
				<th class="table_last_th">ȸ������</th>
			</tr>
		</table>
	</div>
	
	<div id="uncheckedList_report" class="tabContent hidden">
		<div id="reportedProductList" class="list">
		<img alt="" class="admin_inner_title_img" src="image_board/good_report.png">
			<div id="reportedProductList_head" class="admin_list_head">
				<div class="r_title_1">�Ű����</div>
				<div class="r_title_2">�Ű��� ���̵�</div>
				<div class="r_title_3">�Ű�����</div>
				<div class="r_title_4">�Ű��� ��ǰ</div>
			</div>
		</div>
		<div id="reportedMemberList" class="list">
		<img alt="" class="admin_inner_title_img" src="image_board/member_report.png">
			<div id="reportedMemberList_head" class="admin_list_head">
				<div class="r_title_1">�Ű����</div>
				<div class="r_title_2">�Ű��� ���̵�</div>
				<div class="r_title_3">�Ű�����</div>
				<div class="r_title_4">�Ű��� ȸ��</div>
			</div>
		</div>
	</div>
	
	<div id="uncheckedList_tradeReport" class="tabContent hidden">
		<div id="uncheckedReportList" class="list">
			<div id="uncheckedReportList_head"  class="admin_list_head">
				<div class="r_title_1">�Ű����</div>
				<div class="r_title_2">�Ű��� ���̵�</div>
				<div class="r_title_3">�Ű�����</div>
				<div class="r_title_4">�Ű��� ȸ��</div>
			</div>	
		</div>
	</div>
	
	<div id="checkedList_report" class="tabContent hidden">
		<div id="checkedReportList" class="list">
			<div id="checkedReportList_head"  class="admin_list_head">
				<div class="normal">�Ϸù�ȣ</div>
				<div class="wide">��������</div>
				<div class="normal">������ ���̵�</div>
				<div class="wide">���系��</div>
			</div>	
		</div>
	</div>
	
	<div id="list_refund" class="tabContent hidden">
		<div id="totalFee">
			�� ���� ȯ�޼����� ����: 
			<span class="data"></span>
		</div>
	
		<!-- �̰�ȯ�� ��� -->
		<div id="uncheckedRefundList" class="list">
		<img alt="" class="admin_inner_title_img" src="image_board/repond_wait_title.png">
			<div id="uncheckedRefundList_head" class="admin_list_head">
				<div class="r_title_5">ȯ�޽�û��</div>
				<div class="r_title_5">ȯ�޽�û��</div>
				<div class="r_title_5">���������</div>
				<div class="r_title_5">�Ա�����</div>
				<div class="r_title_5">���¹�ȣ</div>
				<div class="r_title_5">������</div>
				<div class="r_title_5">��û����</div>
			</div>
		</div>
		<!-- ȯ�� ��� -->
		<div id="checkedRefundList" class="list">	
		<img alt="" class="admin_inner_title_img" src="image_board/repond_comp_title.png">		
			<div id="checkedRefundList_head" class="admin_list_head">
				<div class="r_title_5">ȯ�޽�û��</div>
				<div class="r_title_5">ȯ�޾�</div>
				<div class="r_title_5">������</div>
				<div class="r_title_5">�Ա�����</div>
				<div class="r_title_5">���¹�ȣ</div>
				<div class="r_title_5">������</div>
				<div class="r_title_5">ȯ������</div>
			</div>
		</div>
	</div>
	
	<div id="list_bannedMember" class="tabContent hidden">
		<div id="bannedMemberList" class="list">
			<div id="bannedMemberList_head"  class="admin_list_head2">
				<div class="r_title_2">���̵�</div>
				<div class="r_title_2">�̸�</div>
				<div class="r_title_3">��ġ����</div>
				<div class="r_title_3">���ٱ��� ��ġ����</div>
				<div class="r_title_3">���ٱ��� ��������</div>
				<div class="r_title_2">��������Ƚ��</div>
			</div>
		</div>
	</div>
</div>	
</body>
</html>
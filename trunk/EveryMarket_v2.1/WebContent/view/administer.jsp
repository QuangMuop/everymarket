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
				<th>아이디</th>
				<th>비밀번호</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>연락처</th>
				<th>E_Money</th>
				<th>누적신고횟수</th>
				<th class="table_last_th">회원상태</th>
			</tr>
		</table>
	</div>
	
	<div id="uncheckedList_report" class="tabContent hidden">
		<div id="reportedProductList" class="list">
		<img alt="" class="admin_inner_title_img" src="image_board/good_report.png">
			<div id="reportedProductList_head" class="admin_list_head">
				<div class="r_title_1">신고사유</div>
				<div class="r_title_2">신고자 아이디</div>
				<div class="r_title_3">신고일자</div>
				<div class="r_title_4">신고대상 상품</div>
			</div>
		</div>
		<div id="reportedMemberList" class="list">
		<img alt="" class="admin_inner_title_img" src="image_board/member_report.png">
			<div id="reportedMemberList_head" class="admin_list_head">
				<div class="r_title_1">신고사유</div>
				<div class="r_title_2">신고자 아이디</div>
				<div class="r_title_3">신고일자</div>
				<div class="r_title_4">신고대상 회원</div>
			</div>
		</div>
	</div>
	
	<div id="uncheckedList_tradeReport" class="tabContent hidden">
		<div id="uncheckedReportList" class="list">
			<div id="uncheckedReportList_head"  class="admin_list_head">
				<div class="r_title_1">신고사유</div>
				<div class="r_title_2">신고자 아이디</div>
				<div class="r_title_3">신고일자</div>
				<div class="r_title_4">신고대상 회원</div>
			</div>	
		</div>
	</div>
	
	<div id="checkedList_report" class="tabContent hidden">
		<div id="checkedReportList" class="list">
			<div id="checkedReportList_head"  class="admin_list_head">
				<div class="normal">일련번호</div>
				<div class="wide">제재일자</div>
				<div class="normal">제재대상 아이디</div>
				<div class="wide">제재내용</div>
			</div>	
		</div>
	</div>
	
	<div id="list_refund" class="tabContent hidden">
		<div id="totalFee">
			총 누적 환급수수료 수익: 
			<span class="data"></span>
		</div>
	
		<!-- 미결환급 목록 -->
		<div id="uncheckedRefundList" class="list">
		<img alt="" class="admin_inner_title_img" src="image_board/repond_wait_title.png">
			<div id="uncheckedRefundList_head" class="admin_list_head">
				<div class="r_title_5">환급신청자</div>
				<div class="r_title_5">환급신청액</div>
				<div class="r_title_5">예상수수료</div>
				<div class="r_title_5">입금은행</div>
				<div class="r_title_5">계좌번호</div>
				<div class="r_title_5">예금주</div>
				<div class="r_title_5">신청일자</div>
			</div>
		</div>
		<!-- 환급 목록 -->
		<div id="checkedRefundList" class="list">	
		<img alt="" class="admin_inner_title_img" src="image_board/repond_comp_title.png">		
			<div id="checkedRefundList_head" class="admin_list_head">
				<div class="r_title_5">환급신청자</div>
				<div class="r_title_5">환급액</div>
				<div class="r_title_5">수수료</div>
				<div class="r_title_5">입금은행</div>
				<div class="r_title_5">계좌번호</div>
				<div class="r_title_5">예금주</div>
				<div class="r_title_5">환급일자</div>
			</div>
		</div>
	</div>
	
	<div id="list_bannedMember" class="tabContent hidden">
		<div id="bannedMemberList" class="list">
			<div id="bannedMemberList_head"  class="admin_list_head2">
				<div class="r_title_2">아이디</div>
				<div class="r_title_2">이름</div>
				<div class="r_title_3">조치사유</div>
				<div class="r_title_3">접근금지 조치일자</div>
				<div class="r_title_3">접근금지 해제일자</div>
				<div class="r_title_2">누적제재횟수</div>
			</div>
		</div>
	</div>
</div>	
</body>
</html>
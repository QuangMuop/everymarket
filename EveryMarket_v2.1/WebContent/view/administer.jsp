<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./styles/board_qna.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<span class="button_tab">(회원정보 총괄)</span>
	<span class="button_tab">(일반신고 접수현황)</span>
	<span class="button_tab">(거래신고 접수현황)</span>
	<span class="button_tab">(조치완료된 신고현황)</span>
	
	<div id="memberList" class="tabContent">
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>연락처</th>
				<th>E_Money</th>
				<th>누적신고횟수</th>
				<th>회원상태</th>
			</tr>
		</table>
		
		<button id="callMemberList">회원목록 호출</button>
	</div>
	
	<div id="uncheckedList_report" class="tabContent hidden">
		<div id="reportedProductList" class="list">
			<div id="reportedProductList_head">
				<div class="normal">신고사유</div>
				<div class="normal">신고자 아이디</div>
				<div class="wide">신고일자</div>
				<div class="normal">신고대상 상품</div>
			</div>
		</div>
		<div id="reportedMemberList" class="list">
			<div id="reportedMemberList_head">
				<div class="normal">신고사유</div>
				<div class="normal">신고자 아이디</div>
				<div class="wide">신고일자</div>
				<div class="normal">신고대상 회원</div>
			</div>
		</div>
	</div>
	
	<div id="uncheckedList_tradeReport" class="tabContent hidden">
	
	</div>
	
	<div id="checkedList_report" class="tabContent hidden">
		<div id="checkedReportList" class="list">
			<div id="checkedReportList_head">
				<div class="normal">일련번호</div>
				<div class="wide">제재일자</div>
				<div class="normal">제재대상 아이디</div>
				<div class="wide">제재내용</div>
			</div>	
		</div>
	</div>
	
</body>
</html>
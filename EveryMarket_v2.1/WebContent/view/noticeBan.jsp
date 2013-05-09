<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="scripts/lib/jquery.timeTo.js"></script>
<script type="text/javascript" src="scripts/noticeBan.js"></script>
<link href="styles/noticeBan.css" rel="stylesheet" type="text/css"/></head>
<body>

	<div id="wrapper_noticeBan">
		<div id="noticeBan_upper" class="noticeBan">
			<span class="bold">${tempMember.m_name }</span>님, 
			귀하는 <span class="bold">${banReason }</span> 사유로 신고되어
			다음의 시간동안 계정접근이 정지되었습니다.
		</div>
	
		<div id="noticeBan_lower">
			<div id="counter" remainingTime="${remainingTime }"></div>
			<div id="noticeBan_login">계정접근이 해제되는 시간까지 해당 페이지를 떠나지 않으면 자동으로 접속을 시도합니다.</div>
		</div>
		
		<div id="noticeBan_tryLogin" class="noticeBan hidden">
			5초 후 접속을 시도합니다
		</div>
		
		<div id="triedInfo" m_id="${tempMember.m_id }" m_pwd="${tempMember.m_pwd }"></div>
	</div>
	
</body>
</html>
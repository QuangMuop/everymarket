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
			<span class="bold">${tempMember.m_name }</span>��, 
			���ϴ� <span class="bold">${banReason }</span> ������ �Ű�Ǿ�
			������ �ð����� ���������� �����Ǿ����ϴ�.
		</div>
	
		<div id="noticeBan_lower">
			<div id="counter" remainingTime="${remainingTime }"></div>
			<div id="noticeBan_login">���������� �����Ǵ� �ð����� �ش� �������� ������ ������ �ڵ����� ������ �õ��մϴ�.</div>
		</div>
		
		<div id="noticeBan_tryLogin" class="noticeBan hidden">
			5�� �� ������ �õ��մϴ�
		</div>
		
		<div id="triedInfo" m_id="${tempMember.m_id }" m_pwd="${tempMember.m_pwd }"></div>
	</div>
	
</body>
</html>
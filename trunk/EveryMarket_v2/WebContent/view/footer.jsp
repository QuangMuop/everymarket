<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<br>

	----- footer -----
	
	<!-- Admin, QnaBoard -->
	<div>
		����:
		<c:if test="${member.m_name == 'Admin' }">
			<button id="goAdminister">�����ڸ��</button>
		</c:if>
		<button id="goQnaBoard">QnA�Խ���</button>
	</div>
	
	<br>
	
</body>
</html>
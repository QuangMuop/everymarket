<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="scripts/lib/jquery-1.9.1.min.js"></script>

<script type="text/javascript" src="scripts/message.js"></script>
<style type="text/css">

#message_box{
	border:1px solid;
	width: 450px;
	height: 80px;
	margin-bottom: 20px;
	padding: 20px;
}

#message_content{
	line-height: 25px;
}

#bt_sellapprove{
	margin-left:120px;
	height:30px;
	
}

#bt_sellrefuse{
	height:30px;
}

</style>
</head>
<body>
	<div>
		<c:forEach var="listMessage" items="${listMessage }">
			<div id="message_box">
				<div id="message_content">
					${listMessage.m_nick }(${listMessage.m_id }) ���� ${listMessage.p_name } ��(��) ���� ��û�Ͽ����ϴ�.<br>
					${listMessage.msg_due } ���� Ȯ���� �ֽñ� �ٶ��ϴ�.
				</div>
				<div id="message_btn">
					<input type="button" id="bt_sellapprove" value="  �� ��  "/>&nbsp; &nbsp; &nbsp;
					<input type="button" id="bt_sellrefuse" value="  �� ��  " p_id="${listMessage.p_id }"/>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> :: Welcome to Wonderer :: </title>
<link href='<%=request.getContextPath()%>/styles/errorPage.css' rel="stylesheet" type="text/css"/>
<link href='<%=request.getContextPath()%>/styles/common.css' rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="bg">
		<center>
			<div id="test_wrapper">		
				<div id="errorMsg">
					<h2>웹페이지에 접속할 수 없습니다!</h2>
					${error}
				</div>
			</div>
		</center>
	</div>
</body>
</html>
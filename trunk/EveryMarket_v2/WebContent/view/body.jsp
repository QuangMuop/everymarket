<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<br> ----- body -----

	<br>
	<br> 
	
	body.jsp파일은 각자 본인이 담당한 컨텐츠에 맞는 이름의 jsp파일 생성해서 쓸 것!
	
	<c:if test="${error != null }">
	
	<br><br>
	
	${error }
	
	</c:if>
	<img src="image_product/soldout.png">
	<br>
	<br>

	<form action="goMarket.do" method="post">
		<input type="text" name="m_id" size="10">
		<input type="submit" value="마켓이동">
	</form>

	<br>
	<br> 
	
	----- body -----

	<br>
	<br>

</body>
</html>
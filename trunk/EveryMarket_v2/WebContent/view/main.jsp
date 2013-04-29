<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<form action="goMarket.do" method="post">
		<input type="text" name="m_id" size="10">
		<input type="submit" value="마켓이동">
	</form>
	
	<c:if test="${error != null }">	${error } </c:if>

	<div id="container_grid">
		<div class='all_content'>
			<section id="wrapper">
			<div id="item_container" category="${category}" searchtext="${searchtext}">
				<c:forEach var="product" items="${listProduct}">
					<div class="grid" p_id="${product.p_id}">
						<div class="imgholder">
							<img src="image_product/${product.p_img}" />
						</div>
						<div>${product.p_price}</div>
					</div>
				</c:forEach>
			</div>
			</section>
		</div>
	</div>
</body>
</html>
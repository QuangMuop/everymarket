<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div id='container'>
		<div class='all_content'>

			<!-- 탑 메뉴바  -->
			<div class='top_container'>
				<h1 class="top_text">
					<c:choose>
						<c:when test="${catelist.size() > 1}">
							<a id="large_c">${catelist.get(1).ct_large}</a>
							<c:forEach var="Category" items="${catelist}">
								<span class="items">
								
								<a class="c_list" href="list.do?category=${Category.ct_small }">
									${Category.ct_small}</a></span>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="Category" items="${catelist }">
								<span>${Category.ct_small}</span>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</h1>
			</div>

			<!-- 검색 바 -->
			<div class='search_container'>
				<form action="list.do" method="post">
					<div class="search_menu">
						<span class="all_view"><a id="c_all_view"
							href="list.do?category=${catelist.get(0).ct_large}">전체보기</a></span> <label>카테고리
							내 검색</label> 
							<input class='searchtext' type="text" name='searchtext' placeholder='아이템을 입력하세요'> <input type="hidden"
							name="category" value="${param.category}"> <input
							type="submit" value="검색">

					</div>
				</form>
			</div> 

			<!-- 중간 -->
			<section id="wrapper">
			<div id="item_container" category= ${category} searchtext = ${searchtext}>
				<c:forEach var="product" begin="1" end="5" items="${listProduct}">
					<div class="grid" p_id="${product.p_id }">
						<div class="imgholder">
							<img src="image_product/${product.p_img}" />
						</div>
						<div>${product.p_price}</div>
					</div>
				</c:forEach>
				<!-- 아이템뿌려주기 -->
			</div>
			</section>
		</div>
	</div>
</body>
</html>
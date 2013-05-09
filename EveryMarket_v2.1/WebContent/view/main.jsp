<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	
	<!--					 마켓 광고 시작								 -->
	<div id="mid_contents">
	<div class="border_box">
		<div class="box_skitter box_skitter_large">
			<ul>
				<c:forEach var="o4s" items="${listSkitter }">
					<li><a href="#cube"><img src="image_blog/${o4s.owner_b_main }" class="randomSmart"/></a>
						<div class="label_text">
							<div class="slide_marketname">
								<a class="m_font" id="m_nick">${o4s.owner_m_nick }</a> 
								<img alt="" src="images/smarket/smarket4.png">
							</div>
							<div class="m_goods">
								<a class="m_font" id="m_recent">최근 등록한 상품</a>
								<div class="m_innergoods">
									<c:forEach var="product" items="${o4s.listRecentProduct }">
										<div class="goods" p_id="${product.p_id }">
											<img class="good_image" alt="" src="image_product/${product.p_img }">
											<a class="good_name">${product.p_name }</a>
											<img class="coin" alt="" src="images/smarket/coin.png">
											<a class="m_font" id="good_money">${product.p_price }</a>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="m_dangols">
								<a class="m_font" id="recent_dangol">단골 회원</a>
								<div id="m_dangollist">
									<c:forEach var="blog" items="${o4s.listRandomDangol }">
										<div class="dangols">
										<img class="dangol_image" alt="" m_id="${blog.m_id }" 
												src="image_blog/${blog.b_thumb }">
									</div>
									</c:forEach>
								</div>
							</div>
							<div class="m_reviews">
								<a class="m_font" id="recent_review">최근 등록된 리뷰</a>
								<div id="m_reviewlist">
									<c:forEach var="review" items="${o4s.listRecentReview }">
										<div class="reviews">
											<a>${review.r_content }</a>
											<a>${review.r_date }</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
<!--  ////////////////////  즉시구매-->
	<div id="now_sale">
	
		<img alt="" id="sale_image" src="images/smarket/now.png">
		<img alt="" id="sale_image2" src="image_product/${product_min.p_img}">
			<div id="sale_detail">
				<p>[${member_min_nick}]     ${product_min.p_name}</p>
				<p id="sale_cash"><img class="coin" alt="" src="images/smarket/coin.png">${product_min.p_price}</p>
				
					 <!-- <div id="sale_count">
						<p>상품등록일:</p>
							<p>1</p>
							<p>|</p>
						<p>덧글수:</p>
							<p>1</p>
					</div> -->
					<button id="now_buy" p_id="${product_min.p_id}"></button>
			</div>
	</div>


	</div>
	<!--                    	마켓 광고                                       -->
	<form action="goMarket.do" method="post">
		<input type="text" name="m_id" size="10"> <input type="submit"
			value="마켓이동">
	</form>
	
	<!--  리모트 부분 -->
	<div id="remote"></div>
	<!--  끝 -->
	
	
	<c:if test="${error != null }">	${error } </c:if>

	<div id="container_grid">
		<div class='all_content'>
			<div id="wrapper">
			<div id="item_container" category="${category}"
				searchtext="${searchtext}">
				<c:forEach var="product" items="${listProduct}">
					<div class="grid" p_id="${product.p_id}">
						<div class="imgholder">
							<img src="image_product/${product.p_img}" />
						</div>
						<div>${product.p_price}</div>
					</div>
				</c:forEach>
			</div>
			</div>
		</div>
	</div>
	

</body>
</html>
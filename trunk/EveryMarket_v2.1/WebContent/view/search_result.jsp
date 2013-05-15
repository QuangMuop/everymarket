<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
	  
		<div id="menubar">
			<ul class="menu">
				<li id="search_item"  class="active">
					<a class="tab-btn1" id="search_item">아이템</a>
					<a class="tab-btn2" id="search_item" >${product_count }</a>
				</li>
				
				<li id="search_blog">
					<a class="tab-btn1" id="search_blog">가게</a>
					<a class="tab-btn2" id="search_blog">${blog_count }</a>
				</li>			
			</ul>
		</div>
		
<!-- 		///////////////////////아이템///////////////////////      -->

		<div class="content search_item">
			<section id="wrapper">
				<div id="container7">
					<c:choose>
						<c:when test="${searchProduct == null }">
							<img alt="검색결과가 없습니다!" src="images/noSearchResult.gif">
						</c:when>
						<c:otherwise>
							<c:forEach var="product" items="${searchProduct}">
								<div class="grid" p_id="${product.p_id }">
									<div class="imgholder">
										<img src="image_product/${product.p_img}"/>
									</div>
									<div>${product.p_price }</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</section>
		</div>

<!-- 		/////////////////////// 가게 ///////////////////////      -->

		<div class="content search_blog">
			<ul>
				<c:choose>
					<c:when test="${searchBlog == null }">
						<img alt="검색결과가 없습니다!" src="images/noSearchResult.gif">
					</c:when>
					<c:otherwise>
						<c:forEach var="searchBlog" items="${searchBlog }">
							<div class="market-border2">
								<div class="shop-info">			
									<div class="market-detail">
										<div class="market-head">
											<div class="market-name-border" style="background-image: url('image_blog/${searchBlog.b_main}')">
												<div class="market-name">
													<h3 id="name1">${searchBlog.m_nick }님의 가게</h3>
												</div>
											</div>
										</div>
										
										<div class="market-body">
											<a class="market-btn">
												<p class="body-number" id="dan-count">${searchBlog.dg_count }</p>
												<p class="market-body-btn" id="market-dan">단골손님</p>
											</a>
											<a class="market-btn" id="btn-center">
												<p class="body-number" id ="item-count">${searchBlog.p_count }</p>
												<p class="market-body-btn"  id="market-item">아이템</p>
											</a>
											<a class="market-btn">
												<p class="body-number" id ="review-count">${searchBlog.r_count }</p>
												<p class="market-body-btn" id="market-review">구매후기</p>
											</a>			
										</div>	
										
										<div id="zero">
											<a href="goMarket.do?m_id=${searchBlog.m_id }" id="dan-btn">방문하기</a>
										</div>
										
										<div class="market-footer">
											<div class="imgLiquidFill" style="width:94px; height:107px;">
												<img class="market-goods" src="image_product/${searchBlog.p_img1 }"/>
											</div>
											<div class="imgLiquidFill" style="width:94px; height:107px;">
												<img class="market-goods" src="image_product/${searchBlog.p_img2 }"/>
											</div>
											<div class="imgLiquidFill" style="width:94px; height:107px;">
												<img class="market-goods" src="image_product/${searchBlog.p_img3 }"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>		
	</div>
</body>
</html>
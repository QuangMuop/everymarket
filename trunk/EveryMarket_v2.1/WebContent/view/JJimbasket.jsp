<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.ArrayList"%>
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
	<div id="container">
		<div id="menubar">
			<ul class="menu">
				<li id="buy-goods" class="active"><a class="tab-btn1"
					id="buy-goods">���� �� ����</a> <a class="tab-btn2" id="buy-goods">${size_JRListBuy}</a>
				</li>
				<li id="up-goods"><a class="tab-btn1" id="up-goods">���� �� ����</a>
					<a class="tab-btn2" id="up-goods">${size_JRListSell}</a></li>
				<li id="jjim-goods"><a class="tab-btn1" id="jjim-goods">����
						���� ����</a> <a class="tab-btn2" id="jjim-goods">${size_JRListJJim}</a>
				</li>
			</ul>
		</div>

		<span class="clear"></span>

		<!-- ���� �� ���ǵ�! -->
		<div class="content buy-goods">
			<ul>
				<c:forEach var="buy" items="${listBuy}">
					<li>
						<div class="buy-goods-list">
							<div class="buy-goods-border">
								<img class="buy-good-image" src="image_product/${buy.j_img}">
								<p id="buy-good-price">${buy.j_price}</p>
								<p id="buy-good-count">${buy.j_jjimcount }</p>
								<p id="buy-good-review">${buy.j_commentcount}</p>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>

		<!-- ���� �� ���ǵ�! -->
		<div class="content up-goods">
			<ul>
				<c:forEach var="slist" items="${listSell}">
					<li>
						<div class="buy-goods-list">
							<div class="buy-goods-border">
								<img class="buy-good-image" src="image_product/${slist.j_img}">
								<p id="buy-good-price">${slist.j_price}</p>
								<p id="buy-good-count">${slist.j_jjimcount }</p>
								<p id="buy-good-review">${slist.j_commentcount}</p>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>

		<!-- ���� ���� ���ǵ�! -->
		<div class="content jjim-goods">
			<ul>
				<c:forEach var="jjim" items="${listJJim}">
					<li>
						<div class="buy-goods-list">
							<div class="buy-goods-border">
								<img class="buy-good-image" src="image_product/${jjim.j_img}">
								<p id="buy-good-price">${jjim.j_price}</p>
								<p id="buy-good-count">${jjim.j_jjimcount }</p>
								<p id="buy-good-review">${jjim.j_commentcount}</p>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>
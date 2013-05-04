<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function (){
		$(document).on("click", '.grid', function(){
			alert("��ī�ݶ�");
			$.getJSON(
			"http://localhost:8081/EveryMarket_v2/remote.do?p_id="+$(this).attr('id'),	
			function(data){
				alert("���õ�");
				$("#remote").html("");
				$.each(data.remote_list , function(index, product){
					
					var list = "<img src='image_product/"+product.p_img+"' width='50' height='50'/>";
					$("#remote").append(list);
					
				});
			});
		
		});
	});
</script>
</head>
<body>

<!--					 ���� ���� ����								 -->
	<div class="border_box">
			<div class="box_skitter box_skitter_large">
				<ul>
					<li>
						<a href="#cube">
							<img src="images/slide_image/001.jpg" class="cube" />
						</a>
							<div class="label_text">
								<div class="slide_marketname">
									<a class="m_font" id="m_nick">�̽���</a>
									<img alt="" src="images/slide_image/smarket4.png">
								</div>
								<div class="m_goods">
									<a class="m_font" id="m_recent">�ֱٿ� �ø� ��ǰ</a>
										<div class="m_innergoods">
											<div class="goods">
											<img class="good_image" alt="" src="images/slide_image/004.jpg">
												<a class="good_name">���</a>
											<img class="coin" alt="" src="images/slide_image/coin.png">
												<a class="m_font" id="good_money">10000</a>
											</div>
											<div class="goods">
											<img class="good_image" alt="" src="images/slide_image/005.jpg">
												<a class="good_name">���</a>
											<img class="coin" alt="" src="images/slide_image/coin.png">
												<a class="m_font" id="good_money">10000</a>
											</div>
											<div class="goods">
											<img class="good_image" alt="" src="images/slide_image/006.jpg">
												<a class="good_name">���</a>
											<img class="coin" alt="" src="images/slide_image/coin.png">
												<a class="m_font" id="good_money">10000</a>
											</div>
										</div>
								</div>
								<div class="m_dangols">
									<a class="m_font" id="recent_dangol">�ֱ� �ܰ� ȸ��</a>
									<a class="count_font" id="m_dangolcount">0</a>
									<div id="m_dangollist">
										<a>������</a>
									</div>
								</div>
								<div class="m_reviews">
									<a class="m_font" id="recent_review">�ֱ� ��ϵ� ����</a>
									<a class="count_font" id="m_reviewcount">0</a>
									<div id="m_reviewlist">
										
										<a>������ ���Ǵ��� ���ƿ�!</a>
										<a>2013/5/1/11:11</a>
									</div>
								</div>
							</div>
					</li>
					<li>
						<a href="#cube">
							<img src="images/slide_image/002.jpg" class="cube" />
						</a>
							<div class="label_text">
								<div class="slide_marketname">
									<a class="m_font" id="m_nick">�̽���</a>
									<img alt="" src="images/slide_image/smarket4.png">
								</div>
								<div class="m_goods">
									<a class="m_font" id="m_recent">�ֱٿ� �ø� ��ǰ</a>
										<div class="m_innergoods">
											<div class="goods">
											<img class="good_image" alt="" src="images/slide_image/004.jpg">
												<a class="good_name">���</a>
											<img class="coin" alt="" src="images/slide_image/coin.png">
												<a class="m_font" id="good_money">10000</a>
											</div>
											<div class="goods">
											<img class="good_image" alt="" src="images/slide_image/005.jpg">
												<a class="good_name">���</a>
											<img class="coin" alt="" src="images/slide_image/coin.png">
												<a class="m_font" id="good_money">10000</a>
											</div>
											<div class="goods">
											<img class="good_image" alt="" src="images/slide_image/006.jpg">
												<a class="good_name">���</a>
											<img class="coin" alt="" src="images/slide_image/coin.png">
												<a class="m_font" id="good_money">10000</a>
											</div>
										</div>
								</div>
								<div class="m_dangols">
									<a class="m_font" id="recent_dangol">�ֱ� �ܰ� ȸ��</a>
									<a class="count_font" id="m_dangolcount">0</a>
									<div id="m_dangollist">
										<a>������</a>
									</div>
								</div>
								<div class="m_reviews">
									<a class="m_font" id="recent_review">�ֱ� ��ϵ� ����</a>
									<a class="count_font" id="m_reviewcount">0</a>
									<div id="m_reviewlist">
										
										<a>������ ���Ǵ��� ���ƿ�!</a>
										<a>2013/5/1/11:11</a>
									</div>
								</div>
							</div>
					</li>
				</ul>
			</div>
		</div>
	
	
	
<!--                    	���� ����                                       -->
	<form action="goMarket.do" method="post">
		<input type="text" name="m_id" size="10">
		<input type="submit" value="�����̵�">
	</form>
	
	<c:if test="${error != null }">	${error } </c:if>

	<div id="container_grid">
		<div class='all_content'>
			<section id="wrapper">
			<div id="item_container" category="${category}" searchtext="${searchtext}">
				<c:forEach var="product" items="${listProduct}">
					<div class="grid" id="${product.p_id}">
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
	<div id="remote"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAgrj58PbXr2YriiRDqbnL1RSqrCjdkglBijPNIIYrqkVvD1R4QxRl47Yh2D_0C1l5KXQJGrbkSDvXFA" type="text/javascript"></script>
<script src="./scripts/catchHorse.js" type="text/javascript"></script>
</head>
<body>
<center>

	<div id="indivMarketWrapper" owner_id="${owner.m_id }">
		<div id="blog_b_main">
			<img id="b_m_image" src="image_blog/${blog.b_main }">
			<div id="blog_b_main_side">
				<div id="bar_button_indivMarket_left"></div>
				<div id="bar_button_indivMarket_right"></div>
			</div>
		</div>
		<div id="blog_b_thumb">
			<div id="b_f_line">
				<div id="b_thumb_wrapper">
					<img id="b_thumb" src="image_blog/${blog.b_thumb }">
				</div>
				<a class="blog_m_name">${owner.m_name }</a>
				<a id="blog_b_hit">이 가게에 방문한 사람 : ${blog.b_hit }</a>
			</div>
			<div id="b_s_line">
				<p>가게소개</p>
				<a id="blog_b_content"> ${blog.b_content } </a>
			</div>
			<div id="blog_b_map" class="b_s_line_box">
				<c:choose>
					<c:when test="${blog.b_map != null }">
						<img src="${blog.b_map }">	
					</c:when>
					<c:otherwise>
						<img src="image_blog_source/noMap.gif">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="b_s_line_box">
				<div id="count_dangol">
					<a>${count_dangol }</a>
					<img alt="" id="all_f" src="image_blog_source/all_friends.png">
				</div>
			</div>
			<div class="b_s_line_box">
				<div id="count_review">
					<a>${count_review }</a>
					<img alt="" id="review_count" src="image_blog_source/editprofile.png">
				</div>
			</div>
			<div id="b_t_line">
				<a id="b_t_line_first">리뷰</a>
				<a id="b_t_line_center">단골손님</a>
				<a>가게 위치</a>
			</div>
		</div>
	
		<div id="productContainer">	
			<c:forEach var="product" items="${listProduct }">
				<div class="product" p_id="${product.p_id }">
					<img alt="" class="p_img" src="image_product/${product.p_img }">
					<c:if test="${product.p_status == 'y' }">
						<span class="notOnSale">
							<span class="notOnSale-bg"></span>
							<span id="notOnSale_soldOut" class="notOnSale-image"></span>
						</span>
					</c:if>
					<c:if test="${product.p_status == 'w' }">
						<span class="notOnSale">
							<span class="notOnSale-bg"></span>
							<span id="notOnSale_onTrade" class="notOnSale-image"></span>
						</span>
					</c:if>
					<div>
						<p>${product.p_price }</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- 팝업창 : 가게 꾸미기 -->
	<div id="decoBlog" class="popUp hidden">
		<div id="d_b_box">
		<img alt="" id="deco_title" src="image_blog_source/deco_title.png">
			<div id="d_b_box_top">
				<div id="tab_mainImage" class="button_tab checked">메인이미지</div>
				<div id="tab_thumbNail" class="button_tab">썸네일이미지</div>
				<div id="tab_geoLocation" class="button_tab">구글맵API</div>
				<div id="tab_blogContents" class="button_tab">마켓소개글</div>
			</div>
			<div id="mainImage" class="tab">
				<form action="updateBlog.do" method="post" enctype="multipart/form-data">
					<h4>마켓 메인 이미지를 설정해주세요!</h4>
					<img src="C:\Users\kosta.Kitchu\Downloads\wallPaper.png">
					<input type="file" name="uploadFile">
					<input type="hidden" name="updateKey" value="b_main">
					<input type="submit" class="m_i_change" value="변경하기">
				</form>
			</div>
			<div id="thumbNail" class="tab hidden">
				<form action="updateBlog.do" method="post" enctype="multipart/form-data">
					<h4>썸네일이미지 수정폼</h4>
					<input type="file" name="uploadFile">
					<input type="hidden" name="updateKey" value="b_thumb">
					<input type="submit" class="m_i_change" value="변경하기">
				</form>
			</div>
			<div id="geoLocation" class="tab hidden">
				<h4>구글맵API 적용폼</h4>
				<div id="gMapLocationPicker" class="hidden">
					<form id="submitAddress" onsubmit="showAddress(this.address.value); return false;">
						<input type="text" size="55" name="address" 
							placeholder="이곳에 주로 거래 가능한 장소의 주소명을 입력해주세요!" /> 
						<input type="submit" class="m_i_change" value="위도와 경도 찾기!" />			
					</form>
					
					<form action="updateBlog.do" method="post">
						위도: <input type="text" id="lat" name="latitude" size="10" readonly="readonly">
						경도: <input type="text" id="lng" name="longitude" size="10" readonly="readonly">		
						<input type="hidden" name="updateKey" value="b_map">
						<input type="submit" id="api_add" value="해당 위도와 경도로 구글맵API를 적용합니다.">
					</form>
					
					<div align="center" id="map" style="width: 600px; height: 400px"></div>
				</div>
				<div id="opener_locationPicker">위도와 경도를 설정하려면 클릭해주세요!</div>
			</div>
			<div id="blogContents" class="tab hidden">
				<form action="updateBlog.do" method="post">
					<h4>마켓소개글 수정폼</h4>
					<textarea rows="5" cols="30" name="b_content"></textarea>
					<input type="hidden" name="updateKey" value="b_content">
					<input type="submit" class="m_i_change" value="변경하기">
				</form>
			</div>
		</div>
	</div>
	
	<!-- 팝업창 : 상품등록 -->
	<div id="registerProduct" class="popUp hidden">
		<div id="r_p_content">
		<img alt="" id="reg_good_title" src="image_blog_source/reg_good.png">
		<form action="registerProduct.do" method="post" enctype="multipart/form-data">
			<div id="p_name_set">
			<input type="text" name="p_name" size="10" placeholder="상품명을 입력해주세요">					
			</div>
			<div id="p_info_set">			
			<input type="text" name="p_price" size="10" placeholder="가격 입력">				
			<select name="ct_id">
				<option>카테고리를 설정</option>
			</select>
			</div>		
			<div id="p_de_set">					
				<textarea rows="5" cols="30" name="p_detail" placeholder="상품소개를 써주세요"></textarea>	
				<input type="file" name="uploadFile" size="26">				
			</div>	
			<input type="submit"  class="m_i_change" value="상품 등록하기">
		</form>
			
		</div> 
	</div>
	
	<div id="modifyProduct" class="popUp hidden">
		<h4>새로운 상품 등록폼</h4>
		<p>거래의 안전을 위해 상품게시글의 본문만 수정가능해요 ^^</p>
		<form action="modifyProduct.do" method="post">
			상품소개:	<textarea rows="5" cols="30" name="p_detail"></textarea>	
			<input type="hidden" name="p_id" value=""> 
			<input type="submit" value="상품 수정하기">
		</form>
	</div>
	
	<!-- 팝업창 : 단골리스트 -->
	<div id="dangolList" class="popUp hidden"></div>
	
	<!-- 팝업창 : 구매후기리스트 -->
	<div id="review" class="popUp hidden">
		<div id="review_content">
			<div id="scoreRating">
				<div id="r_score">
					<a>평점: <span class="data"></span></a>
					<img alt="" src="image_blog_source/posted_item.png">
				</div>
				<div id="r_score_count">
					<a>평가인원: <span class="data"></span></a>
					<img alt="" src="image_blog_source/invite.png">
				</div>
			</div>
			<div id="reviewList"></div>
		</div>
	</div>
	
	<!-- 팝업창 : 구글맵 마우스오버 팝업 -->
	<div id="googleMap" class="popUp hidden">
		<c:choose>
			<c:when test="${blog.b_map != null }">
				<img src="${blog.b_map }">	
			</c:when>
			<c:otherwise>
				<img src="image_blog_source/noMap.gif">
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- 팝업창 : 애마를잡아라 이벤트 관련 -->
	<div id="horseYelling" class="popUp hidden">꽁꽁 숨었는데 어떠케찾았지 ㅜㅜ</div>
	<div id="notice_addEventCash" class="popUp hidden">
		<p>축하드립니다! 이벤트에 당첨되어 <span id="eventCash_amount"></span>캐쉬를 적립해드렸어요. :-)</p>
	</div>
	
</center>
</body>
</html>
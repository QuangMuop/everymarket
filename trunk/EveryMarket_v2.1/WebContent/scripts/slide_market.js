$(document).ready(function() {
	/*상수 구현부*/
	var contextUrl = "/EveryMarket_v2.1/";
	
//	updateSlide_market();
//	function updateSlide_market(){
//		$.getJSON(
//			contextUrl + "getDataForSkitter.do",
//			function(data){
//				$.each(data.listSkitter, function(index, o4s){
//					$("#mid_contents ul").append(
//						"<li>" +
//							"<a href='#cube'><img src='image_blog/" + o4s.owner_b_main + "' class='randomStart'></a>" +
//								"<div class='label_text'>" +
//									"<div class='slide_marketname'>" +
//										"<a clss='m_font' id='m_nick'>" + o4s.owner_m_nick + "</a>" +
//										"<img alt='' src='images/smarket/smarket4.png'>" +
//									"</div>" +
//									"<div class='m_goods'>" +
//										"<a clss='m_font' id='m_recent'>최근에 올린 상품</a>" +
//										"<div class='innergoods'>" +
//										"</div>" +
//									"</div>" +
//									"<div class='m_dangols'>" +
//										"<a class='m_font' id='recent_dangol'>단골 회원</a>" +
//									"</div>" +
//								"</div>" +
//								"<div class='m_reviews'>" +
//									"<a class='m_font' id='recent_review'>최근 등록된 리뷰</a>" +
//									"<div class='m_reviewlist'>" +
//									"</div>" +
//								"</div>" +
//							"</div>" +
//						"</li>"
//					);
//					$.each(o4s.listRecentProduct, function(index, product){
//						$(".innergoods").append(
//							"<div class='goods'>" +
//								"<img class='good_image' alt='' src='image_product/" + product.p_img + "'>" +
//								"<a class='good_name'>" + product.p_name + "</a>" +
//								"<img class='coin' alt='' src='images/smarket/coin.png'>" +
//								"<a class='m_font' id='good_money'>" + product.p_price + "</a>" +
//							"</div>"
//						);
//					});
//					$.each(o4s.listRandomDangol, function(index, blog){
//						$(".m_dangols").append(
//							"<div class='dangols'>" +
//								"<img class='dangol_image' alt='' m_id='" + blog.m_id + 
//									"' src='image_blog/" + blog.b_thumb + "'>" +
//								"<a class='dangol_name'>" + blog.m_id + "</a>" +
//							"</div>"
//						);
//					});
//					$.each(o4s.listRecentReview, function(index, review){
//						$(".m_reviewlist").append(
//							"<div class='reviews'>" +
//								"<a>" + review.r_content + "</a>" +
//								"<a>" + review.r_date + "</a>" +
//							"</div>"
//						);
//					});
//				});
//			}
//		);
//	}
	
	var options = {};
	if (document.location.search) {
		var array = document.location.search.split('=');
		var param = array[0].replace('?', '');
		var value = array[1];
		
		if (param == 'animation') {
			options.animation = value;
		}
		else if (param == 'type_navigation') {
			options[value] = true;
			if (value == 'dots') $('.border_box').css({'marginBottom': '40px'});
		}
	}
	$('.box_skitter_large').skitter(options);
	
	// Highlight
	$('pre.code').highlight({source:1, zebra:1, indent:'space', list:'ol'});
	
});
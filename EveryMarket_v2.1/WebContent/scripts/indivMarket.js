$(document).ready(function(){
	/*상수 구현부*/
	var contextUrl = "http://localhost:8081/EveryMarket_v2.1/";
	
	/*개인마켓페이지 메인버튼 초기화*/
	refreshButton_indivMarket();
		
	/*AjaxForm 동기화*/
	$("#ajaxForm_registerComments").ajaxForm();
	$("#ajaxForm_registerComments").submit(registerComments);
	
	$(".product").click(popUp_productInfo);
	$("#productPurchase button").click(closePop_productPurchase);
	
	$(document).on('click', ".b_thumb", goMarket);
	
	$(document).on('click', "#button_goMain", goMain);
	$(document).on('click', "#button_showOwnerDangol", popoUp_showOwnerDangol);
	
	$(document).on('click', "#button_decoBlog", popUp_decoBlog);
	$(document).on('click', "#button_registerProduct", popUp_registerProduct);
	$(document).on('click', "#button_showMyDangol", popUp_showMyDangol);
	
	$(document).on('click', "#button_detail_deleteJjim", deleteJjim);
	$(document).on('click', "#button_detail_registerJjim", registerJjim);
//	$(document).on('click', "#button_detail_modifyProduct", modifyProduct);
	$(document).on('click', "#button_detail_buyProduct", buyProduct);
	$(document).on('click', "#button_detail_closeProductInfo", closePop_productInfo);
		
		/*decoBlog: 탭 구동버튼*/
		$("#tab_mainImage").click(tab_mainImage);
		$("#tab_thumbNail").click(tab_thumbNail);
		$("#tab_geoLocation").click(tab_geoLocation);
		$("#tab_blogContents").click(tab_blogContents);
	
		/*decoBlog: mainImage, thunbNail, geoLocation, blogContents 탭 구현*/	
		function tab_mainImage(){
			$("#decoBlog").find(".tab").not("#mainImage").hide();
			$("#mainImage").fadeIn("slow"); }
		function tab_thumbNail(){
			$("#decoBlog").find(".tab").not("#thumbNail").hide();
			$("#thumbNail").fadeIn("slow"); }
		function tab_geoLocation(){
			$("#decoBlog").find(".tab").not("#geoLocation").hide();
			$("#geoLocation").fadeIn("slow"); }
		function tab_blogContents(){
			$("#decoBlog").find(".tab").not("#blogContents").hide();
			$("#blogContents").fadeIn("slow"); }
	
	function deleteJjim(){
		$.ajax({
			url: contextUrl + "deleteJjim.do",
			data: { 'p_id': $("#productInfo").attr("p_id") }
		});
		alert("해당 상품의 찜을 취소했습니다!");
		refreshJjim();
		refreshButton_detail();
	}
	
	function registerJjim(){
		$.ajax({
			url: contextUrl + "registerJjim.do",
			data: { 'p_id': $("#productInfo").attr("p_id") }
		});
		alert("해당 상품을 찜했습니다!");
		refreshJjim();
		refreshButton_detail();
	}
	
	function refreshJjim(){
		$.getJSON(
			contextUrl + "refreshJjim.do?p_id=" 
				+ $("#productInfo").attr("p_id"),
			function(data){
				$("#listJjimer > img").remove();
				$.each(data.listB_thumb, function(index, b_thumb){
					$("#listJjimer").append(
						"<img class='b_thumb' src='image_blog/" + b_thumb + "'>"
					);
				});
			}
		);
	}
	
	function registerComments(){
		alert("댓글이 성공적으로 입력되었습니다. :-)");
		$("input[name='c_content']").val("");
		refreshComments();
	}
	
	function refreshComments(){
		$.getJSON(
			contextUrl + "refreshComments.do?p_id=" 
				+ $("input[name='p_id']").attr("value"),
			function(data){
				$("#productComments > div").remove();
				$.each(data.listComments, function(index, comments){
					$("#productComments").prepend(
						"<div class='hidden'>" + comments.c_name + " : " + comments.c_content + "</div>"
					).find(".hidden").fadeIn('slow');
				});
			}
		);
	}
	
	function refreshButton_indivMarket(){
		$.getJSON(
			contextUrl + "checkSession.do?owner_id=" 
				+ $("#indivMarketWrapper").attr("owner_id"),
			function(data){	
				$("#bar_button_indivMarket").append(
					"<div id='button_goMain' class='button'>메인페이지 가기</div>" +
					"<div id='button_showOwnerDangol' class='button'>마켓주인 단골목록</div>"
				);
				
				if(data.status > 1){
					$("#bar_button_indivMarket").append(
						"<div id='button_decoBlog' class='button'>가게 꾸미기</div>" +
						"<div id='button_registerProduct' class='button'>상품 등록</div>"					);
				}
							
				if(data.status > 0){
					$("#bar_button_indivMarket").append(
						"<div id='button_showMyDangol' class='button'>내 단골 놀러가기</div>"
					);
					$("#ajaxForm_registerComments").css("display", "inherit");
				}
			}
		);
	}
	
	function refreshButton_detail(){
		$.getJSON(
			contextUrl + "checkStatus.do?p_id=" 
				+ $("#productInfo").attr("p_id"),
			function(data){
				$("#bar_button_detail").children().remove();
				if(data.member){
					if(data.own){
						$("#bar_button_detail").append(
							"<div id='button_detail_modifyProduct' class='button_detail'>상품수정하기</div>"
						);
					}else{
						if(data.jjim){
							$("#bar_button_detail").append(
								"<div id='button_detail_deleteJjim' class='button_detail'>찜취소하기</div>"
							);
						}else{
							$("#bar_button_detail").append(
								"<div id='button_detail_registerJjim' class='button_detail'>찜하기</div>"
							);
						}
						$("#bar_button_detail").append(
							"<div id='button_detail_buyProduct' class='button_detail'>구매신청하기</div>"
						);
					}
				}
				
				$("#bar_button_detail").append(
					"<div id='button_detail_closeProductInfo' class='button_detail'>창닫기</div>"
				);
			}
		);
	}	

	/*mainView 가기*/
	function goMain(){
		location.href="enter.go";
	}
	
	/*개인마켓페이지 가기*/
	function goMarket(){
		var src = $(this).attr("src").split("/");
		var b_thumb = src[1];

		indivMarketDwr.getMemberByB_thumb(b_thumb, callback);
		
		function callback(data){
			if(confirm(data.m_name + "님의 가게로 이동하시겠습니까?")){
				location.href="goMarket.do?m_id=" + data.m_id;
			}
		};
	}
	
	function popoUp_showOwnerDangol(){
		$.getJSON(
			contextUrl + "getOwnerDangolList.do?owner_id=" 
				+ $("#indivMarketWrapper").attr("owner_id"),
			function(data){
				$("#dangolList").children().remove();
				$("#dangolList").append( "<p>" + data.owner.m_name + "님의 단골리스트</p>" );
				$.each(data.listDangolB_thumb, function(index, b_thumb){
					$("#dangolList").append(
						"<img class='b_thumb' src='image_blog/" + b_thumb + "'>"
					);
				});
			}
		);
		
		$("#dangolList").bPopup();
	}
	
	/*가게 데코창 띄우기*/
	function popUp_decoBlog(){
		$("#decoBlog").bPopup();
	}	
	
	/*상품 등록창 띄우기*/
	function popUp_registerProduct(){
		$.getJSON(
			contextUrl + "getCategoryList.do",
			function(data){
				$.each(data.listCategory, function(index, category){
					$("#registerProduct select").append(
						"<option value='" + category.ct_id + "'>" + 
						category.ct_large + " : " + category.ct_small + "</option>"
					);
				});
			}
		);
		
		$("#registerProduct").bPopup();
	}
	
	/*내 단골리스트 띄우기*/
	function popUp_showMyDangol(){
		$.getJSON(
			contextUrl + "getMyDangolList.do",
			function(data){
				$("#dangolList").children().remove();
				$("#dangolList").append( "<p>내 단골리스트</p>" );
				$.each(data.listDangolB_thumb, function(index, b_thumb){
					$("#dangolList").append(
						"<img class='b_thumb' src='image_blog/" + b_thumb + "'>"
					);
				});
			}
		);
		
		$("#dangolList").bPopup();
	}
	
	/*상품 상세정보창 띄우기*/
	function popUp_productInfo(){
		/*productInfo div요체 최신화*/
		$.getJSON(
			contextUrl + "getProductInfo.do?p_id=" 
				+ $(this).attr("productId"),
			function(data){
				/*HomeInfo Div*/
				$("#blogB_map").html(data.blog.b_map);
				$("#blogB_content").html(data.blog.b_content);
				
				$("#randomProducts > div").remove();
				$.each(data.randomProducts, function(index, product){
					$("#randomProducts").append(
						"<div>" + product.p_img + "</div>"
					);
				});
				
				var p_date = (data.product.p_date.year + 1900) + "년" +
								(data.product.p_date.month + 1) + "월" +
								data.product.p_date.date + "일";
				
				$("#productP_name").html(data.product.p_name);
				$("#productP_detail").html(data.product.p_detail);
				$("#productP_price").html(data.product.p_price);
				$("#productP_img").html("<img src='image_product/" + data.product.p_img + "'>");
				$("#productP_date").html(p_date);
				
				$("input[name='p_id']").attr("value", data.product.p_id);
				$("#productInfo").attr("p_id", data.product.p_id);
				
				refreshJjim();	
				refreshComments();
				refreshButton_detail();
			}
		);
		
		$('html, body').animate( { 'scrollTop': 0 }, 'slow' );
		
		/*최신화 후 팝업창 출력*/
		$("#productInfo").bPopup({
			fadeSpeed: 'slow',
			follow: [false, false],
			modalClose: false,
			position: [274, 50]
		});
	};
	
	/*상품 구매신청창 띄우기*/
	function buyProduct(){
		/*productPurchase div요체 최신화*/
		$.getJSON(
			contextUrl + "getProductByP_id.do?p_id="
				+ $("#productInfo").attr("p_id"),
			function(data){
				$("#productPurchase").find(".data").remove();
				$("#productP_img_purchase").append(
					"<span class='data'>" +
					"<img src='image_product/" + data.product.p_img + "'>" +
					"</span>"
				);
				$("#productP_name_purchase").append(
					"<span class='data'>" + data.product.p_name + "</span>"
				);
				$("#productP_price_purchase").append(
					"<span class='data'>" + data.product.p_price + "</span>"
				);
				$("#ajaxForm_productPurchase").find("input:[name='p_id']")
					.val($("#productInfo").attr("p_id"));
			}
		);
		
		/*최신화 후 팝업창 출력*/
		$("#productPurchase").bPopup({
			fadeSpeed: 'slow',
			follow: [false, false],
			modalClose: false,
			position: [274, 50]
		});
	}
	
	/*상품 상세정보창 닫기*/
	function closePop_productInfo(){
		$("#productInfo").bPopup().close();
	};
	
	/*상품 구매신청창 닫기*/
	function closePop_productPurchase(){
		$("#productPurchase").bPopup().close();
		return false;
	}
});
$(document).ready(function(){
	/*��� ������*/
	var contextUrl = "/EveryMarket_v2.1/";
	
	/*���θ��������� ���ι�ư �ʱ�ȭ*/
	refreshButton_indivMarket();
		
	/*AjaxForm ����ȭ*/
	$("#ajaxForm_registerComments").ajaxForm();
	$("#ajaxForm_registerComments").submit(registerComments);
	
	$(".product").click(popUp_productInfo);
	$("#count_dangol").click(popUp_showOwnerDangol);
	$("#count_review").click(popUp_showListReview);
	
	$("#productPurchase button").click(closePop_productPurchase);
	
	$("#opener_locationPicker").click(open_locationPicker);
	$("#submitAddress").submit(function(){
		showAddress(this.address.value);
		return false;
	});
	
	$(document).on('click', ".b_thumb", goMarket);
	
	$(document).on('click', "#button_goMain", goMain);
	
	$(document).on('click', "#button_decoBlog", popUp_decoBlog);
	$(document).on('click', "#button_registerProduct", popUp_registerProduct);
	$(document).on('click', "#button_showMyDangol", popUp_showMyDangol);
	
	$(document).on('click', "#button_detail_deleteJjim", deleteJjim);
	$(document).on('click', "#button_detail_registerJjim", registerJjim);
	$(document).on('click', "#button_detail_modifyProduct", modifyProduct);
	$(document).on('click', "#button_detail_buyProduct", buyProduct);
	$(document).on('click', "#button_detail_closeProductInfo", closePop_productInfo);
		
		/*decoBlog: �� ������ư*/
		$("#tab_mainImage").click(tab_mainImage);
		$("#tab_thumbNail").click(tab_thumbNail);
		$("#tab_geoLocation").click(tab_geoLocation);
		$("#tab_blogContents").click(tab_blogContents);
	
		/*decoBlog: mainImage, thunbNail, geoLocation, blogContents �� ����*/	
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
		
		function open_locationPicker(){
			$("#gMapLocationPicker").slideDown("slow");
			$(this).hide();
			loadGBrowser();
		}
		
		/*���۸�API ������*/
		function loadGBrowser() {
			if (GBrowserIsCompatible()) {
				var map = new GMap2(document.getElementById("map"));
				map.addControl(new GSmallMapControl());
				map.addControl(new GMapTypeControl());
				var center = new GLatLng(37.47865, 126.88189);
				map.setCenter(center, 16);
				geocoder = new GClientGeocoder();
				var marker = new GMarker(center, { draggable : true });
				map.addOverlay(marker);
				document.getElementById("lat").value = center.lat().toFixed(5);
				document.getElementById("lng").value = center.lng().toFixed(5);
				GEvent.addListener(marker, "dragend", function() {
					var point = marker.getPoint();
					map.panTo(point);
					document.getElementById("lat").value = point.lat().toFixed(5);
					document.getElementById("lng").value = point.lng().toFixed(5);
				});
				GEvent.addListener(map, "moveend", function() {
					map.clearOverlays();
					var center = map.getCenter();
					var marker = new GMarker(center, { draggable : true });
					map.addOverlay(marker);
					document.getElementById("lat").value = center.lat().toFixed(5);
					document.getElementById("lng").value = center.lng().toFixed(5);
					GEvent.addListener(marker, "dragend", function() {
						var point = marker.getPoint();
						map.panTo(point);
						document.getElementById("lat").value = point.lat().toFixed(5);
						document.getElementById("lng").value = point.lng().toFixed(5);
					});
				});
			}
		}
		
		function showAddress(address) {
			var map = new GMap2(document.getElementById("map"));
			map.addControl(new GSmallMapControl());
			map.addControl(new GMapTypeControl());
			if (geocoder) {
				geocoder.getLatLng(address, function(point) {
					if (!point) {
						alert(address + " not found");
					} else {
						document.getElementById("lat").value = point.lat().toFixed(5);
						document.getElementById("lng").value = point.lng().toFixed(5);
						var lat = document.getElementById("lat").value;
						var lng = document.getElementById("lng").value;
					
						map.clearOverlays();
						map.setCenter(point, 16);
						var marker = new GMarker(point, { draggable : true });
						map.addOverlay(marker);
						GEvent.addListener(marker, "dragend", function() {
							var pt = marker.getPoint();
							map.panTo(pt);
							document.getElementById("lat").value = pt.lat().toFixed(5);
							document.getElementById("lng").value = pt.lng().toFixed(5);
						});
						GEvent.addListener(map, "moveend", function() {
							map.clearOverlays();
							var center = map.getCenter();
							var marker = new GMarker(center, { draggable : true });
							map.addOverlay(marker);
							document.getElementById("lat").value = center.lat().toFixed(5);
							document.getElementById("lng").value = center.lng().toFixed(5);
							GEvent.addListener(marker, "dragend", function() {
								var pt = marker.getPoint();
								map.panTo(pt);
								document.getElementById("lat").value = pt.lat().toFixed(5);
								document.getElementById("lng").value = pt.lng().toFixed(5);
							});
						});
					}
				});
			}
		}
		
	function deleteJjim(){
		$.ajax({
			url: contextUrl + "deleteJjim.do",
			data: { 'p_id': $("#productInfo").attr("p_id") }
		});
		alert("�ش� ��ǰ�� ���� ����߽��ϴ�!");
		refreshJjim();
		refreshButton_detail();
	}
	
	function registerJjim(){
		$.ajax({
			url: contextUrl + "registerJjim.do",
			data: { 'p_id': $("#productInfo").attr("p_id") }
		});
		alert("�ش� ��ǰ�� ���߽��ϴ�!");
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
		alert("����� ���������� �ԷµǾ����ϴ�. :-)");
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
					"<div id='button_goMain' class='button'>���������� ����</div>"
				);
				
				if(data.status > 1){
					$("#bar_button_indivMarket").append(
						"<div id='button_decoBlog' class='button'>���� �ٹ̱�</div>" +
						"<div id='button_registerProduct' class='button'>��ǰ ���</div>"					);
				}
							
				if(data.status > 0){
					$("#bar_button_indivMarket").append(
						"<div id='button_showMyDangol' class='button'>�� �ܰ� �����</div>"
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
							"<div id='button_detail_modifyProduct' class='button_detail'>��ǰ�����ϱ�</div>"
						);
					}else{
						if(data.jjim){
							$("#bar_button_detail").append(
								"<div id='button_detail_deleteJjim' class='button_detail'>������ϱ�</div>"
							);
						}else{
							$("#bar_button_detail").append(
								"<div id='button_detail_registerJjim' class='button_detail'>���ϱ�</div>"
							);
						}
						$("#bar_button_detail").append(
							"<div id='button_detail_buyProduct' class='button_detail'>���Ž�û�ϱ�</div>"
						);
					}
				}
				
				$("#bar_button_detail").append(
					"<div id='button_detail_closeProductInfo' class='button_detail'>â�ݱ�</div>"
				);
			}
		);
	}	

	/*mainView ����*/
	function goMain(){
		location.href="enter.go";
	}
	
	/*���θ��������� ����*/
	function goMarket(){
		var src = $(this).attr("src").split("/");
		var b_thumb = src[1];

		indivMarketDwr.getMemberByB_thumb(b_thumb, callback);
		
		function callback(data){
			if(confirm(data.m_name + "���� ���Է� �̵��Ͻðڽ��ϱ�?")){
				location.href="goMarket.do?m_id=" + data.m_id;
			}
		};
	}
	
	function popUp_showOwnerDangol(){
		$.getJSON(
			contextUrl + "getOwnerDangolList.do?owner_id=" 
				+ $("#indivMarketWrapper").attr("owner_id"),
			function(data){
				$("#dangolList").children().remove();
				$("#dangolList").append( "<p>" + data.owner.m_name + "���� �ܰ񸮽�Ʈ</p>" );
				$.each(data.listDangolB_thumb, function(index, b_thumb){
					$("#dangolList").append(
						"<img class='b_thumb' src='image_blog/" + b_thumb + "'>"
					);
				});
			}
		);
		
		$("#dangolList").bPopup();
	}
	
	function popUp_showListReview(){
		$.getJSON(
			contextUrl + "getReviewList.do?m_id="
				+ $("#indivMarketWrapper").attr("owner_id"),
			function(data){
				$("#scoreRating span:eq(0)").html(data.scoreSum);
				$("#scoreRating span:eq(1)").html(data.countReview);
				$("#reviewList").children().remove();
				$.each(data.listReview, function(index, review){
					var r_date = (review.r_date.year + 1900) + "��" +
								(review.r_date.month + 1) + "��" +
								review.r_date.date + "��";
					
					$("#reviewList").append(
						"<div class='reviewContent' p_id='" + review.p_id + "'>" +
						"<p><span class='productName'></span> ��ǰ�� ������ " +
							"<span class='memberName'></span> ���� ��ǰ�� </p>" +
						"<p><span>(" + review.r_score + ")</span>" + review.r_content + "</p>" +
						"<p>" + r_date + "</p>" +
						"</div>"
					);
					
					indivMarketDwr.getP_nameByP_id(review.p_id, callbackP_name);
					function callbackP_name(p_name){
						$(".reviewContent[p_id='"+review.p_id+"']")	.find(".productName").html(p_name);
					}
					
					indivMarketDwr.getM_nameByP_id(review.p_id, callbackM_name);
					function callbackM_name(m_name){
						$(".reviewContent[p_id='"+review.p_id+"']")	.find(".memberName").html(m_name); 
					}
				});
			}
		);
		
		$("#review").bPopup();
	}
	
	/*���� ����â ����*/
	function popUp_decoBlog(){
		$('html, body').animate( { 'scrollTop': 0 }, 'slow' );
		
		$("#decoBlog").bPopup({
			fadeSpeed: 'slow',
			follow: [false, false],
			modalClose: false,
			position: [274, 50]
		});
	}	
	
	/*��ǰ ���â ����*/
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
	
	/*��ǰ ����â ����*/
	function modifyProduct(){
		/*p_id input��� �ֽ�ȭ*/
		$("#modifyProduct").find("input[name='p_id']").attr("value", $("#productInfo").attr("p_id"));
		
		/*�ֽ�ȭ �� �˾�â ���*/
		$("#modifyProduct").bPopup();
	}
	
	/*�� �ܰ񸮽�Ʈ ����*/
	function popUp_showMyDangol(){
		$.getJSON(
			contextUrl + "getMyDangolList.do",
			function(data){
				$("#dangolList").children().remove();
				$("#dangolList").append( "<p>�� �ܰ񸮽�Ʈ</p>" );
				$.each(data.listDangolB_thumb, function(index, b_thumb){
					$("#dangolList").append(
						"<img class='b_thumb' src='image_blog/" + b_thumb + "'>"
					);
				});
			}
		);
		
		$("#dangolList").bPopup();
	}
	
	/*��ǰ ������â ����*/
	function popUp_productInfo(){
		/*productInfo div��� �ֽ�ȭ*/
		$.getJSON(
			contextUrl + "getProductInfo.do?p_id=" 
				+ $(this).attr("productId"),
			function(data){
				/*HomeInfo Div*/
				$("#blogB_map").html("<img src='" + data.blog.b_map + "'>");
				$("#blogB_content").html(data.blog.b_content);
				
				$("#randomProducts > div").remove();
				$.each(data.randomProducts, function(index, product){
					$("#randomProducts").append(
						"<img src='image_product/" + product.p_img + "'>"
					);
				});
				
				var p_date = (data.product.p_date.year + 1900) + "��" +
								(data.product.p_date.month + 1) + "��" +
								data.product.p_date.date + "��";
				
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
		
		/*�ֽ�ȭ �� �˾�â ���*/
		$("#productInfo").bPopup({
			fadeSpeed: 'slow',
			follow: [false, false],
			modalClose: false,
			position: [274, 50]
		});
	};
	
	/*��ǰ ���Ž�ûâ ����*/
	function buyProduct(){
		/*productPurchase div��� �ֽ�ȭ*/
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
		
		/*�ֽ�ȭ �� �˾�â ���*/
		$("#productPurchase").bPopup({
			fadeSpeed: 'slow',
			follow: [false, false],
			modalClose: false,
			position: [274, 50]
		});
	}
	
	/*��ǰ ������â �ݱ�*/
	function closePop_productInfo(){
		$("#productInfo").bPopup().close();
	};
	
	/*��ǰ ���Ž�ûâ �ݱ�*/
	function closePop_productPurchase(){
		$("#productPurchase").bPopup().close();
		return false;
	}
});
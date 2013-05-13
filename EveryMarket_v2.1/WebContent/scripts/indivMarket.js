$(document).ready(function(){
	/*��� ������*/
	var contextUrl = "/EveryMarket_v2.1/";
		
	/*���θ��������� ���ι�ư �ʱ�ȭ*/
	refreshButton_indivMarket();
		
	/*AjaxForm ����ȭ*/
	$("#ajaxForm_registerComments").ajaxForm();
	$("#ajaxForm_registerComments").submit(registerComments);
	
	$(".product").click(popUp_productInfo);
	$("#blog_b_map").click(popUp_googleMap);
	$("#count_dangol").click(popUp_showOwnerDangol);
	$("#count_review").click(popUp_showListReview);
	
	$("#ajaxForm_productPurchase").submit(function(){
		if(confirm("�ش� ��ǰ�� ���Ž�û�Ͻðڽ��ϱ�?")){
			getElementById("ajaxForm_productPurchase").submit();
		}
		return false; });
	$("#productPurchase button").click(closePop_productPurchase);
	
	$("#form_reportMember").submit(confirmAndCheck_reportMember);
	$("#memberReport button").click(closePop_memberReport);
	$("#form_reportProduct").submit(confirmAndCheck_reportProduct);
	$("#productReport button").click(closePop_productReport);
	
	$("#opener_locationPicker").click(open_locationPicker);
	$("#submitAddress").submit(function(){
		showAddress(this.address.value);
		return false; });
	
	$(document).on('click', ".b_thumb", goMarket);
	$(document).on('click', ".grid", popUp_productInfo);
	$(document).on('click', ".buyj_button", popUp_productInfo);
	$(document).on('click', "#now_buy", popUp_productInfo);
	
	$(document).on('click', "#police_button", popUp_reportMember);
	$(document).on('click', "#button_goMain", goMain);
	
	$(document).on('click', "#button_decoBlog", popUp_decoBlog);
	$(document).on('click', "#button_registerProduct", popUp_registerProduct);
	$(document).on('click', "#button_showMyDangol", popUp_showMyDangol);
	
	$(document).on('click', "#button_detail_deleteJjim", deleteJjim);
	$(document).on('click', "#button_detail_registerJjim", registerJjim);
	$(document).on('click', "#button_detail_modifyProduct", modifyProduct);
	$(document).on('click', "#button_detail_buyProduct", buyProduct);
	$(document).on('click', "#button_detail_reportProduct", popUp_reportProduct);
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
				$("#bar_button_indivMarket_left").append(
					"<div id='button_goMain'  class='b_s_button'><img id='b_m_s_button' src='image_blog_source/go_main.png'></div>"
				);
				
				if(data.status > 0){
					$("#bar_button_indivMarket_left").prepend(
						"<div id='police_button'><img id='button_reportMember' src='image_blog_source/report_button.png'></div>"
					);
					$("#bar_button_indivMarket_right").append(
						"<div id='button_showMyDangol' class='b_s_button'><img id='b_m_s_button' src='image_blog_source/go_r_market.png'></div>"
					);
					$("#ajaxForm_registerComments").css("display", "inherit");
				}
				
				if(data.status > 1){
					$("#bar_button_indivMarket_left #police_button").remove();
					$("#bar_button_indivMarket_right").prepend(
						"<div id='button_decoBlog' class='b_s_button'><img id='b_m_s_button' src='image_blog_source/decorate.png'></div>" +
						"<div id='button_registerProduct' class='b_s_button'><img id='b_m_s_button' src='image_blog_source/goods_register.png'></div>"					);
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
						if(!data.onTrade){
							$("#bar_button_detail").append(
								"<div id='button_detail_buyProduct' class='button_detail'>���Ž�û�ϱ�</div>"
							);
						}
						$("#bar_button_detail").append(
							"<div id='button_detail_reportProduct' class='button_detail'>��ǰ�Ű��ϱ�</div>"
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

		indivMarketDwr.getMemberByB_thumb(b_thumb, dwrCallback_goMarket);
		
		function dwrCallback_goMarket(data){
			if(confirm(data.m_name + "���� ���Է� �̵��Ͻðڽ��ϱ�?")){
				location.href="goMarket.do?m_id=" + data.m_id;
			}
		};
	}
	
	/*���۸� ����*/
	function popUp_googleMap(){
		var blog_b_mapLeft = $("#blog_b_map").offset().left - 11;
		var blog_b_mapTop = $("#blog_b_map").offset().top - 11;
		
		$("#googleMap").bPopup({
			follow: [false, false],
			position: [blog_b_mapLeft, blog_b_mapTop],
			onClose: function(){
				$("#googleMap > img").css({
					'width': '80px',
					'height': '80px'
				});
			}
		});
		
		$("#googleMap").animate({
			'left': '300px',
			'top': '50px'
		}, 500);
		$("#googleMap > img").delay(750).animate({
			'width': '500px',
			'height': '500px'
		}, 500);
	}
	
	/*�������� �ܰ��� ����*/
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
	
	/*������ ����*/
	function popUp_showListReview(){
		$.getJSON(
			contextUrl + "getReviewList.do?m_id="
				+ $("#indivMarketWrapper").attr("owner_id"),
			function(data){
				$("#scoreRating span:eq(0)").html(data.scoreSum);
				$("#scoreRating span:eq(1)").html(data.countReview);
				$("#reviewList").children().remove();
				$.each(data.listReview, function(index, review){
					var r_score = review.r_score;
						if(r_score > 0){ r_score = "+" + r_score; }
					
					var r_date = (review.r_date.year + 1900) + "��" +
								(review.r_date.month + 1) + "��" +
								review.r_date.date + "��";
					
					$("#reviewList").append(
						"<div class='reviewContent' p_id='" + review.p_id + "'>" +
						"<p><span class='productName'></span> ��ǰ�� ������ " +
							"<span class='memberName'></span> ���� ��ǰ�� </p>" +
						"<p><span>(" + r_score + ")</span>" + review.r_content + "</p>" +
						"<p>" + r_date + "</p>" +
						"</div>"
					);
					
					indivMarketDwr.getP_nameByP_id(review.p_id, dwrCallback_P_name);
					function dwrCallback_P_name(p_name){
						$(".reviewContent[p_id='"+review.p_id+"']")	.find(".productName").html(p_name);
					}
					
					indivMarketDwr.getM_nameByP_id(review.p_id, dwrCallback_M_name);
					function dwrCallback_M_name(m_name){
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
				+ $(this).attr("p_id"),
			function(data){
				/*HomeInfo Div*/
				$("#blogB_map").html("<img src='" + data.blog.b_map + "'>");
				$("#blogB_content").html(data.blog.b_content);
				
				$("#randomProducts > img").remove();
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
		var p_id = $("#productInfo").attr("p_id");
		
		tradeDwr.getsession(get_mid);
		
		function get_mid(data){

			tradeDwr.compare_point(p_id, data, get_point);
			
			function get_point(point){
			
				if(point >= 0){

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
						$("#ajaxForm_productPurchase").find("input[name='p_id']")
							.val($("#productInfo").attr("p_id"));
					}
				);			
			
				/*�ֽ�ȭ �� �˾�â ���*/
				$("#productPurchase").bPopup({
					fadeSpeed: 'slow',
					modalClose: false,
					position: [274, 50]
				});
				}else{
					alert("�ŷ� ���� ����Ʈ�� �����մϴ�");
					closePop_productInfo();
				}
			}
		}
	}

	/*ȸ�� �Ű�â ����*/
	function popUp_reportMember(){
		/*memberPurchase div��� �ֽ�ȭ*/
		indivMarketDwr.getMemberByM_id($("#indivMarketWrapper").attr("owner_id"), dwrCallback_reportMember);
		function dwrCallback_reportMember(data){
			$("#memberReport").find(".data").remove();
			$("#memberM_nick_report").append(
				"<span class='data'>" + data.m_nick + "</span>"
			);
			$("#memberM_id_report").append(
				"<span class='data'>" + data.m_id + "</span>"
			);
			$("#form_reportMember").find("input[name='rep_memberId']")
				.val($("#indivMarketWrapper").attr("owner_id"));
		}
		
		$("#memberReport").bPopup();
	}
	
	/*��ǰ �Ű�â ����*/
	function popUp_reportProduct(){
		/*reportPurchase div��� �ֽ�ȭ*/
		$.getJSON(
			contextUrl + "getProductByP_id.do?p_id="
				+ $("#productInfo").attr("p_id"),
			function(data){
				$("#productReport").find(".data").remove();
				$("#productP_name_report").append(
					"<span class='data'>" + data.product.p_name + "</span>"
				);
				$("#productP_detail_purchase").append(
					"<span class='data'>" + data.product.p_detail + "</span>"
				);
				$("#form_reportProduct").find("input[name='rep_productId']")
					.val($("#productInfo").attr("p_id"));
				$("#form_reportProduct").find("input[name='rep_memberId']")
					.val($("#indivMarketWrapper").attr("owner_id"));
			}
		);
		
		$("#productReport").bPopup();
	}
	
	/*ȸ���Ű����� Ȯ��, ���Ǿ��̵�� �ش� ȸ���� �Ű�Ǿ����� Ȯ��*/
	function confirmAndCheck_reportMember(){
		if(confirm("�ش� ȸ���� ������ �Ű��Ͻðڽ��ϱ�?")){
			indivMarketDwr.checkAlreadyReported(
				$("#indivMarketWrapper").attr("owner_id"), 
				dwrCallback_checkAlreadyReported_member);
		} 
		return false; 
	};
	function dwrCallback_checkAlreadyReported_member(data){
		if(data != null){ 
			alert("�ش� ȸ���� ���� �̰�Ű���� �����ϹǷ� ���� �Ű��� �� �����ϴ�."); 
		}
		else{
			alert("�Ű� �����Ǿ����ϴ�.");
			document.getElementById("form_reportMember").submit();
		}
	}
	
	/*��ǰ�Ű����� Ȯ��, ���Ǿ��̵�� �ش� ȸ���� �Ű�Ǿ����� Ȯ��*/
	function confirmAndCheck_reportProduct(){
		if(confirm("�ش� ��ǰ�� ������ �Ű��Ͻðڽ��ϱ�?")){
			indivMarketDwr.checkAlreadyReported(
				$("#indivMarketWrapper").attr("owner_id"), 
				dwrCallback_checkAlreadyReported_product);
		} 
		return false; 
	};
	function dwrCallback_checkAlreadyReported_product(data){
		if(data != null){ 
			alert("�ش� ȸ���� ���� �̰�Ű���� �����ϹǷ� ���� �Ű��� �� �����ϴ�."); 
		}
		else{
			alert("�Ű� �����Ǿ����ϴ�.");
			document.getElementById("form_reportProduct").submit();
		}
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
	
	/*ȸ�� �Ű�â �ݱ�*/
	function closePop_memberReport(){
		$("#memberReport").bPopup().close();
		return false;
	}
	
	/*��ǰ �Ű�â �ݱ�*/
	function closePop_productReport(){
		$("#productReport").bPopup().close();
		return false;
	}
		
	$("#mainImage").find("input[name='uploadFile']").change(function(){
		var srcAddress = $(this).val();  
		alert(srcAddress);
	});
	
	//���θ��� ������ ����
//	var options = {
//	        autoResize: true, 
//	        container: $('#productContainer'), 
//	        offset: 2, 
//	        itemWidth: 210
//					};
//	 var handler = $('.product');
//	handler.wookmark(options);
	
	$('#productContainer').BlocksIt({
		numOfCol : 5,
		offsetX : 5,
		offsetY : 5
	});
});
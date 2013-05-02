$(document).ready(function(){
	/*��� ������*/
	var contextUrl = "http://localhost:8081/EveryMarket_v2.1/";
	
	/*AjaxForm ����ȭ*/
	$("#ajaxForm_registerComments").ajaxForm();
	$("#ajaxForm_registerComments").submit(registerComments);
	
	$(".product").click(popUp_productInfo);
	$(".button:eq(1)").click(popUp_registerProduct);
	
	$(document).on('click', "#button_detail_deleteJjim", deleteJjim);
	$(document).on('click', "#button_detail_registerJjim", registerJjim);
//	$(document).on('click', "#button_detail_modifyProduct", modifyProduct);
//	$(document).on('click', "#button_detail_buyProduct", buyProduct);
	$(document).on('click', "#button_detail_closeProductInfo", closePop_productInfo);
		
	$(".button:last").click(go_main);

	function deleteJjim(){
		$.ajax({
			url: contextUrl + "deleteJjim.do",
			data: { 'p_id': $("#productInfo").attr("p_id") }
		});
		alert("�ش� ��ǰ�� ���� ����߽��ϴ�!");
		refreshJjim();
		refreshButtons();
	}
	
	function registerJjim(){
		$.ajax({
			url: contextUrl + "registerJjim.do",
			data: { 'p_id': $("#productInfo").attr("p_id") }
		});
		alert("�ش� ��ǰ�� ���߽��ϴ�!");
		refreshJjim();
		refreshButtons();
	}
	
	function refreshJjim(){
		$.getJSON(
			contextUrl + "refreshJjim.do?p_id=" + $("#productInfo").attr("p_id"),
			function(data){
				$("#listJjimer > img").remove();
				$.each(data.listB_thumb, function(index, b_thumb){
					$("#listJjimer").append(
						"<img src='image_blog/" + b_thumb + "'>");
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
		$("#productComments > div").remove();
		$.getJSON(
			contextUrl + "refreshComments.do?p_id=" + $("input[name='p_id']").attr("value"),
			function(data){
				$.each(data.listComments, function(index, comments){
					$("#productComments").prepend(
							"<div class='hidden'>" + comments.c_name + " : " + comments.c_content + "</div>")
							.find(".hidden").fadeIn('slow');
				});
			}
		);
	}
	
	function refreshButtons(){
		$("#bar_button_detail").children().remove();
		$.getJSON(
			contextUrl + "checkJjimAndOwn.do?p_id=" + $("#productInfo").attr("p_id"),
			function(data){
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
	
	/*��ǰ ������â �ݱ�*/
	function closePop_productInfo(){
		$("#productInfo").bPopup().close();
	};

	/*��ǰ ������â ����*/
	function popUp_productInfo(){
		/*productInfo Div��ü �ֽ�ȭ*/
		$.getJSON(
			contextUrl + "getProductInfo.do?p_id=" + $(this).attr("productId"),
			function(data){
				/*HomeInfo Div*/
				$("#blogB_map").html(data.blog.b_map);
				$("#blogB_content").html(data.blog.b_content);
				
				$("#randomProducts > div").remove();
				$.each(data.randomProducts, function(index, product){
					$("#randomProducts").append(
						"<div>" + product.p_img + "</div>");
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
				refreshButtons();
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
	
	/*��ǰ ���â ����*/
	function popUp_registerProduct(){
		$.getJSON(
			contextUrl + "getCategoryList.do",
			function(data){
				$.each(data.listCategory, function(index, category){
					$("#registerProduct select").append(
						"<option value='" + category.ct_id + "'>" + 
						category.ct_large + " : " + category.ct_small + "</option>");
				});
			}		
		);
		
		$("#registerProduct").bPopup();
	}
	
	/*MainView ����*/
	function go_main(){
		location.href="enter.go";
	}
});
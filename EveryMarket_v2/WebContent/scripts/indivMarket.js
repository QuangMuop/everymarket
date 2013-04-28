$(document).ready(function(){
	
	/*AjaxForm ����ȭ*/
	$("#ajaxForm_registerComments").ajaxForm();
	$("#ajaxForm_registerComments").submit(registerComments);
	
	$(".product").click(popUp_productInfo);
	$(".button:eq(1)").click(popUp_registerProduct);
	
	$(".button_detail:eq(0)").click(registerJjim);
	$(".button_detail:eq(3)").click(closePop_productInfo);
	
	$(".button:last").click(go_mainView);
	
	function registerComments(){
		alert("����� ���������� �ԷµǾ����ϴ�. :-)");
		$("input[name='c_content']").val("");
		refreshComments();
	}
	
	function refreshComments(){
		$("#productComments > div").remove();
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2/refreshComments.do?p_id=" 
				+ $("input[name='p_id']").attr("value"),
			function(data){
				$.each(data.listComments, function(index, comments){
					$("#productComments").prepend(
							"<div class='hidden'>" + comments.c_name + " : " + comments.c_content + "</div>")
							.find(".hidden").fadeIn('slow');
				});
			}
		);
	}

	/*��ǰ ������â ����*/
	function popUp_productInfo(){
		/*productInfo Div��ü �ֽ�ȭ*/
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2/getProductInfo.do?p_id="
				+ $(this).attr("productId"),
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
			"http://localhost:8081/EveryMarket_v2/getCategoryList.do",
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
	
	function registerJjim(){
		$.ajax({
			url: "http://localhost:8081/EveryMarket_v2/registerJjim.do",
			data: { 'p_id': $("#productInfo").attr("p_id") }
		});
		alert("�ش� ��ǰ�� ���߽��ϴ�!");
		refreshJjim();
	}
	
	function refreshJjim(){
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2/refreshJjim.do?p_id="
				+ $("#productInfo").attr("p_id"),
			function(data){
				$("#listJjimer > span").remove();
				$.each(data.listJjim, function(index, jjim){
					$("#listJjimer").append(
						"<span>" + jjim.b_thumb + "</span>");
				});
			}
		);
	}
	
	
	
	/*��ǰ ������â �ݱ�*/
	function closePop_productInfo(){
		$("#productInfo").bPopup().close();
	};
	
	/*MainView ����*/
	function go_mainView(){
		location.href="enter.do";
	}
});
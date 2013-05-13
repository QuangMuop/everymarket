$(document).ready(function (){
	
	var contextUrl = "/EveryMarket_v2.1/";
	
		$(document).on("click", '.next', function(){
			$.getJSON(
					contextUrl + "remotePage.do?value="+$(".next").attr('value'),		
			function(data){
				$(".next").html("");
				$(".pre").html("");
				$("#remote").html("");
				$.each(data.list , function(index, product){
					var list = "<img src='image_product/"+product.p_img+"' width='50' height='50'/>";
					$("#remote").append(list);
				});
				
				if(data.sizeNum>=5){
					
					if(data.value >= 5){
					$(".pre").html("");
					var text1 = "<a class='pre' value='0'";
					
					text1 += ">이전</a>";
					$("#remote").before(text1);}
				}
				if(data.sizeNum >=5){
			
					if(data.value<5){
					$(".next").html("");
					var text2 = "<a class='next' value='5'";
					
					text2 += ">이후</a>";
					$("#remote").after(text2);
					}
				}
			});
		});
		
		$(document).on("click", '.pre', function(){
			$.getJSON(
					contextUrl + "remotePage.do?value="+$(".pre").attr('value'),		
			function(data){
				$(".next").html("");
				$(".pre").html("");
				$("#remote").html("");
				$.each(data.list , function(index, product){
					var list = "<img src='image_product/"+product.p_img+"' width='50' height='50'/>";
					$("#remote").append(list);
				});
				
				if(data.sizeNum>=5){
					
					if(data.value >= 5){
					
					$("#pre").html("");
					var text1 = "<a class='pre' value='0'";
					
					text1 += ">이전</a>";
					$("#remote").before(text1);}
				}
				if(data.sizeNum >=5){
				
					if(data.value<5){
					$(".next").html("");
					var text2 = "<a class='next' value='5'";
					
					text2 += ">이후</a>";
					$("#remote").after(text2);
					}
				}
			});
		});
		
		$(document).on("click", '.grid', function(){
			
			$.getJSON(
					contextUrl + "remote.do?p_id="+$(this).attr('p_id'),	
			function(data){
				$(".next").html("");
				$(".pre").html("");
				$("#remote").html("");
				$.each(data.list , function(index, product){
					
					var list = "<img src='image_product/"+product.p_img+"' width='50' height='50'/>";
					$("#remote").append(list);
				});
				if(data.sizeNum >=5){
							
					if(data.value<5){
						
				
					var text2 = "<a class='next' value='5'>이후</a>";
					$("#remote").after(text2);
					}
				}
			});
		});
	});


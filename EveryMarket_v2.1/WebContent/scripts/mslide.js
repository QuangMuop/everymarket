$(document).ready(function(){
	alert("test1");
	callBlogList();
	function callBlogList(){
		alert("test2");
//		$("#blogList table tr:gt(0)").remove();
		$.getJSON(
			"http://localhost:8081/EveryMarket_v2.1/callBlogList.do",
			function(data){
				$.each(data.listBlog, function(index, blog){
					
					$(".box_skitter box_skitter_large").appendTo(
						
					
							"<li><a href='#cube'> <img src='images_blog/"+blog.m_id+"' class='cube' />"+
						"</a>"+
							"<div class='label_text'>"+
								"<div class='slide_marketname'>"+
									"<a class='m_font' id='m_nick'> "+blog.b_id +" </a>" +
										"<img src='images/smarket/smarket4.png'>"+
								"</div>"+
								"<div class='m_goods'>"+
									"<a class='m_font' id='m_recent'>�ֱٿ� �ø� ��ǰ</a>"+
									"<div class='m_innergoods'>"+
										"<div class='goods'>"+
											"<img class='good_image' src='images/smarket/004.jpg'>"+
												"<a class='good_name'>���</a>"+ 
											"<img class='coin' src='images/smarket/coin.png'>"+
											"<a class='m_font' id='good_money'>10000</a>"+
										"</div>"+
										"<div class='goods'>"+
										"<img class='good_image' src='images/smarket/004.jpg'>"+
											"<a class='good_name'>���</a>"+ 
										"<img class='coin' src='images/smarket/coin.png'>"+
										"<a class='m_font' id='good_money'>10000</a>"+
										"</div>"+
										"<div class='goods'>"+
										"<img class='good_image' src='images/smarket/004.jpg'>"+
											"<a class='good_name'>���</a>"+ 
										"<img class='coin' src='images/smarket/coin.png'>"+
										"<a class='m_font' id='good_money'>10000</a>"+
										"</div>"+
									"</div>"+
								"</div>"+
								"<div class='m_dangols'>"+
									"<a class='m_font' id='recent_dangol'>�ֱ� �ܰ� ȸ��</a>"+ 
										"<a class='count_font' id='m_dangolcount'>0</a>"+
									"<div id='m_dangollist'>"+
										"<a>������</a>"+
									"</div>"+
								"</div>"+
								"<div class='m_reviews'>"+
									"<a class='m_font' id='recent_review'>�ֱ� ��ϵ� ����</a>"+ 
									"<a class='count_font' id='m_reviewcount'>0</a>"+
									"<div id='m_reviewlist'>"+
										"<a>������ ���Ǵ��� ���ƿ�!</a>"+
										"<a>2013/5/1/11:11</a>"+
									"</div>"+
								"</div>"+
							"</div></li>"
					);
				});
			}
		);
	}
});
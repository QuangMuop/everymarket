/***************************/
//@Author: Adrian "yEnS" Mato Gondelle & Ivan Guardado Castro
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/** ************************ */

$(document).ready(function() {
	$(".menu > li").click(function(e) {
		switch (e.target.id) {
		case "search_item":
			// change status & style menu
			$("#search_item").addClass("active");
			$("#search_blog").removeClass("active");
			// display selected division, hide others
			$("div.search_item").fadeIn();
			$("div.search_blog").css("display", "none");
			/*
			 * $("div.search_blog").css("text-align", "left");
			 * $("div.search_blog").css("float", "left");
			 * $("div.search_blog").css("margin", "0");
			 */
			/* $("#container").css("text-align", "left"); */

			break;
		case "search_blog":
			// change status & style menu
			$("#search_item").removeClass("active");
			$("#search_blog").addClass("active");
			// display selected division, hide others
			$("div.search_blog").fadeIn();
			$("div.search_item").css("display", "none");
			break;

		}
		// alert(e.target.id);
		return false;
	});

	
	
	// tradelist의 탭  : 영준
	$(".trade_menu > li ").click(function(e) {

		switch (e.target.id) {
		case "trade_tab1":
			// change status & style menu
			$("#trade_tab1").addClass("selected");
			$("#trade_tab2").removeClass("selected");
			$("#trade_tab3").removeClass("selected");
			$("#trade_tab4").removeClass("selected");
			$("#trade_tab1").html(
					"<img id='trade_tab1' src='image_trade/buy_info_tab.png'>"
			);
			$("#trade_tab2").html(
					"<img id='trade_tab2' class='t_tab_img' src='image_trade/sell_info_tab_back.png'>"
				);
			$("#trade_tab3").html(
					"<img id='trade_tab3' class='t_tab_img' src='image_trade/trade_info_tab_back.png'>"
				);
			$("#trade_tab4").html(
					"<img id='trade_tab4' class='t_tab_img' src='image_trade/jjim_info_tab_back.png'>"
				);
			// display selected division, hide others
			$("#trade_tab_inner1").fadeIn();
			$("#trade_tab_inner2").css("display", "none");
			$("#trade_tab_inner3").css("display", "none");
			$("#trade_tab_inner4").css("display", "none");

			break;
		case "trade_tab2":
			// change status & style menu
			$("#trade_tab1").removeClass("selected");
			$("#trade_tab2").addClass("selected");
			$("#trade_tab3").removeClass("selected");
			$("#trade_tab4").removeClass("selected");
			$("#trade_tab1").html(
					"<img id='trade_tab1' class='t_tab_img'  src='image_trade/buy_info_tab_back.png'>"
				);
				$("#trade_tab2").html(
						"<img id='trade_tab2' src='image_trade/sell_info_tab.png'>"
					);
				$("#trade_tab3").html(
						"<img id='trade_tab3' class='t_tab_img' src='image_trade/trade_info_tab_back.png'>"
					);
				$("#trade_tab4").html(
						"<img id='trade_tab4' class='t_tab_img' src='image_trade/jjim_info_tab_back.png'>"
					);
			// display selected division, hide others
			$("#trade_tab_inner1").css("display", "none");
			$("#trade_tab_inner2").fadeIn();
			$("#trade_tab_inner3").css("display", "none");
			$("#trade_tab_inner4").css("display", "none");

			break;
		case "trade_tab3":
			// change status & style menu
			$("#trade_tab1").removeClass("selected");
			$("#trade_tab2").removeClass("selected");
			$("#trade_tab3").addClass("selected");
			$("#trade_tab4").removeClass("selected");
			$("#trade_tab1").html(
					"<img id='trade_tab1'  class='t_tab_img' src='image_trade/buy_info_tab_back.png'>"
				);
				$("#trade_tab2").html(
						"<img id='trade_tab2' class='t_tab_img' src='image_trade/sell_info_tab_back.png'>"
					);
				$("#trade_tab3").html(
						"<img id='trade_tab3' src='image_trade/trade_info_tab.png'>"
					);
				$("#trade_tab4").html(
						"<img id='trade_tab4' class='t_tab_img' src='image_trade/jjim_info_tab_back.png'>"
					);
			// display selected division, hide others
			$("#trade_tab_inner1").css("display", "none");
			$("#trade_tab_inner2").css("display", "none");
			$("#trade_tab_inner3").fadeIn();
			$("#trade_tab_inner4").css("display", "none");

			break;
		case "trade_tab4":
			// change status & style menu
			$("#trade_tab1").removeClass("selected");
			$("#trade_tab2").removeClass("selected");
			$("#trade_tab3").removeClass("selected");
			$("#trade_tab4").addClass("selected");
			$("#trade_tab1").html(
					"<img id='trade_tab1' class='t_tab_img' src='image_trade/buy_info_tab_back.png'>"
				);
				$("#trade_tab2").html(
						"<img id='trade_tab2' class='t_tab_img' src='image_trade/sell_info_tab_back.png'>"
					);
				$("#trade_tab3").html(
						"<img id='trade_tab3' class='t_tab_img' src='image_trade/trade_info_tab_back.png'>"
					);
				$("#trade_tab4").html(
						"<img id='trade_tab4' src='image_trade/jjim_info_tab.png'>"
					);
			// display selected division, hide others
			$("#trade_tab_inner1").css("display", "none");
			$("#trade_tab_inner2").css("display", "none");
			$("#trade_tab_inner3").css("display", "none");
			$("#trade_tab_inner4").fadeIn();

			break;
		}

	});

});
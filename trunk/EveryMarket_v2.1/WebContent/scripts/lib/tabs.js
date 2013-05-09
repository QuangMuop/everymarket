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
		
		 alert("하하");
		switch (e.target.id) {
		case "buying_trade":
			// change status & style menu
			$("#buying_trade").addClass("active");
			$("#selling_trade").removeClass("active");
			$("#All_traded").removeClass("active");
			// display selected division, hide others
			$("#buying").fadeIn();
			$("#selling").css("display", "none");
			$("#traded").css("display", "none");
			/*
			 * $("div.search_blog").css("text-align", "left");
			 * $("div.search_blog").css("float", "left");
			 * $("div.search_blog").css("margin", "0");
			 */
			/* $("#container").css("text-align", "left"); */

			break;
		case "selling_trade":
			// change status & style menu
			$("#selling_trade").addClass("active");
			$("#buying_trade").removeClass("active");
			$("#All_traded").removeClass("active");
			// display selected division, hide others
			$("#selling").fadeIn();
			$("#buying").css("display", "none");
			$("#traded").css("display", "none");
			/*
			 * $("div.search_blog").css("text-align", "left");
			 * $("div.search_blog").css("float", "left");
			 * $("div.search_blog").css("margin", "0");
			 */
			/* $("#container").css("text-align", "left"); */

			break;
			
		case "All_traded":
			// change status & style menu
			$("#All_traded").addClass("active");
			$("#buying_trade").removeClass("active");
			$("#selling_trade").removeClass("active");
			// display selected division, hide others
			$("#traded").fadeIn();
			$("#buying").css("display", "none");
			$("#selling").css("display", "none");
			/*
			 * $("div.search_blog").css("text-align", "left");
			 * $("div.search_blog").css("float", "left");
			 * $("div.search_blog").css("margin", "0");
			 */
			/* $("#container").css("text-align", "left"); */

			break;
		}

	});

});
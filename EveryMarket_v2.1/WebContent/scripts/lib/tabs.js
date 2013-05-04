/***************************/
//@Author: Adrian "yEnS" Mato Gondelle & Ivan Guardado Castro
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

$(document).ready(function(){
	$(".menu > li").click(function(e){
		switch(e.target.id){
			case "search_item":
				//change status & style menu
				$("#search_item").addClass("active");
				$("#search_blog").removeClass("active");
				//display selected division, hide others
				$("div.search_item").fadeIn();
				$("div.search_blog").css("display", "none");
			/*	$("div.search_blog").css("text-align", "left");
				$("div.search_blog").css("float", "left");
				$("div.search_blog").css("margin", "0");*/
		/*		$("#container").css("text-align", "left");*/
				
			break;
			case "search_blog":
				//change status & style menu
				$("#search_item").removeClass("active");
				$("#search_blog").addClass("active");
				//display selected division, hide others
				$("div.search_blog").fadeIn();
				$("div.search_item").css("display", "none");
			break;

		}
		//alert(e.target.id);
		return false;
	});
});
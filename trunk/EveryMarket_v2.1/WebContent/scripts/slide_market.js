$(document).ready(function() {
	/*상수 구현부*/
	var contextUrl = "/EveryMarket_v2.1/"; 
	
	$.getJSON(
		contextUrl + "getDataForSkitter.do", 
//			+ $("#indivMarketWrapper").attr("owner_id"),
		function(data){
			
		}
	);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	var options = {};
	if (document.location.search) {
		var array = document.location.search.split('=');
		var param = array[0].replace('?', '');
		var value = array[1];
		
		if (param == 'animation') {
			options.animation = value;
		}
		else if (param == 'type_navigation') {
			options[value] = true;
			if (value == 'dots') $('.border_box').css({'marginBottom': '40px'});
		}
	}
	$('.box_skitter_large').skitter(options);
	
	// Highlight
	$('pre.code').highlight({source:1, zebra:1, indent:'space', list:'ol'});
	
});
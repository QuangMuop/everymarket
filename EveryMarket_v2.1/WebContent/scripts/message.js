$(document).ready(function(){
	
	$("#bt_sellrefuse").click(function(){
		var p_id = $(this).attr("p_id");
		location.href="sellrefuse.do?p_id="+p_id;		
	});
	
	$("#bt_sellapprove").click(function(){
		var p_id = $(this).attr("p_id");
		location.href="sellapprove.do?p_id="+p_id;
	});
	
});



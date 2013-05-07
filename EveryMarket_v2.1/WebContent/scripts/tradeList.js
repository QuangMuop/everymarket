$(document).ready(function() {
	
	
	var t_ids = new Array();
	
	var t_status = new Array();
	
    $("tr[t_ids]").each(function(index){
        
    	 t_ids[index] = $(this).attr("t_ids");
    	 t_status[index] = $(this).attr("t_status");
    	     	 
    	 if(t_status[index] == 1){
    		     		
    		 tradeDwr.db_number_remainday(t_ids[index], show);    	
    		 
    		   		 
    	 }
    	 
    	 function show(data){
    		 
    		    if(data < 0){
    		    	   tradeDwr.trade_delete(t_ids[index]);
    		    	   
    		    }
    		 
    		 
    	    	$('#' + t_ids[index] + "1").append("    입력가능 날짜까지 " + data + "일 남았습니다.");
     	 }
    	 
   	});
    
    
     
    
    
    
     
    
    
    
	
	/*var aa = $("tr[t_ids]:eq(1)").attr("t_ids");*/
    /*alert(aa[1]);*/
		
	var t_status = $("#t_status").attr("name");
	
    // 배송번호 입력했을때 db상태바꿔주는 것
	$(".dn_bt").click(function(event) {
		
		var t_id = $(this).attr("t_id");			
		var db_nb = $("." + t_id + "5").val();
		// db trade status바꿔주고
		tradeDwr.update_db_nb(db_nb, t_id);
		//운송번호로 주문번호 바꿔주기
		$('#' + t_id + "4").text(db_nb);
		
		$("tr[t_ids="+t_id+"]").attr("t_status",2);
		
		
		
		
					
						
		var html = '<input class="db_trace" type="button" value="배송추적" t_id= '
			+ t_id + ' />';
		$("#" + t_id + "1").html("배송중");
		
				
		$("#" + t_id + "2").html(html);
		$("#" + t_id + "4").text(db_nb);
	});

	$(".db_trace").on('click',function() {
		var t_id = $(this).attr("t_id");
		

		window.open("view/popup_deliver.jsp", "배송조회",
		"width=700,height=700,resizalbe=no");
		
		$("#" + t_id + "3").text("배송완료");
		$("#db_text").text("배송완료");
		tradeDwr.update_status(t_id);
	});
});

$(document).on('click',	function() {
	
	$(".db_trace").on('click',function() {
		var t_id = $(this).attr("t_id");
		window.open("view/popup_deliver.jsp", "배송조회",
		"width=700,height=700,resizalbe=no");

		$("#" + t_id + "1").text("배송완료");
		$("#" + t_id + "3").text("배송완료");
		
		$("#db_text").text("배송완료");
		tradeDwr.update_status(t_id);

	});

});



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
    		 
    		 
    	    	$('#' + t_ids[index] + "1").append("    �Է°��� ��¥���� " + data + "�� ���ҽ��ϴ�.");
     	 }
    	 
   	});
    
    
     
    
    
    
     
    
    
    
	
	/*var aa = $("tr[t_ids]:eq(1)").attr("t_ids");*/
    /*alert(aa[1]);*/
		
	var t_status = $("#t_status").attr("name");
	
    // ��۹�ȣ �Է������� db���¹ٲ��ִ� ��
	$(".dn_bt").click(function(event) {
		
		var t_id = $(this).attr("t_id");			
		var db_nb = $("." + t_id + "5").val();
		// db trade status�ٲ��ְ�
		tradeDwr.update_db_nb(db_nb, t_id);
		//��۹�ȣ�� �ֹ���ȣ �ٲ��ֱ�
		$('#' + t_id + "4").text(db_nb);
		
		$("tr[t_ids="+t_id+"]").attr("t_status",2);
		
		
		
		
					
						
		var html = '<input class="db_trace" type="button" value="�������" t_id= '
			+ t_id + ' />';
		$("#" + t_id + "1").html("�����");
		
				
		$("#" + t_id + "2").html(html);
		$("#" + t_id + "4").text(db_nb);
	});

	$(".db_trace").on('click',function() {
		var t_id = $(this).attr("t_id");
		

		window.open("view/popup_deliver.jsp", "�����ȸ",
		"width=700,height=700,resizalbe=no");
		
		$("#" + t_id + "3").text("��ۿϷ�");
		$("#db_text").text("��ۿϷ�");
		tradeDwr.update_status(t_id);
	});
});

$(document).on('click',	function() {
	
	$(".db_trace").on('click',function() {
		var t_id = $(this).attr("t_id");
		window.open("view/popup_deliver.jsp", "�����ȸ",
		"width=700,height=700,resizalbe=no");

		$("#" + t_id + "1").text("��ۿϷ�");
		$("#" + t_id + "3").text("��ۿϷ�");
		
		$("#db_text").text("��ۿϷ�");
		tradeDwr.update_status(t_id);

	});

});



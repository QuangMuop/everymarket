$(document).ready(function() {
	
	
	var t_ids = new Array();
	
	var t_status = new Array();
	
	//���� ��ư��������
	$(".delete_button").click(function(){

	var p_id = $(this).attr("p_id");
	
	$("."+p_id+"j").addClass("none");
	
	tradeDwr.deletejjim_tr(p_id);	
		
	});
	
	
		
	
    $("tr[t_ids]").each(function(index){
        
    	 t_ids[index] = $(this).attr("t_ids");
    	 t_status[index] = $(this).attr("t_status");
    	     	 
    	 if(t_status[index] == 1){
    		     		
    		 tradeDwr.db_number_remainday(t_ids[index], show);    	
    		    		   		 
    	 }    	 
    	 function show(data){ 
    		 
    		 //��۱Ⱓ�� �ʰ��ϸ� �������ش�.
    		    if(data < 0){
    		    	   tradeDwr.trade_delete(t_ids[index]);
    		     }    		 
    	    	$('#' + t_ids[index] + "1s").append("    �Է°��� ��¥���� " + data + "�� ���ҽ��ϴ�.");
     	 }
    	 
   	});      
  
		
	var t_status = $("#t_status").attr("name");
	
    // ��۹�ȣ �Է������� db���¹ٲ��ִ� ��
	$(".dn_bt").click(function(event) {
		
		var t_id = $(this).attr("t_id");			
		var db_nb = $("." + t_id + "5").val();
		
		if(!(db_nb > 10000000 && db_nb < 10000000000) ){
			alert("8�ڸ��� �̻�, 12�ڸ� ������ �˸��� ��۹�ȣ�� �Է����ּ���");
						
		}else{		
		// db trade status�ٲ��ְ�
		tradeDwr.update_db_nb(db_nb, t_id);
		//��۹�ȣ�� �ֹ���ȣ �ٲ��ֱ�
		$('#' + t_id + "4").text(db_nb);
		
		$("tr[t_ids="+t_id+"]").attr("t_status",2);
		
										
		var html = '<input class="db_trace" type="button" value="�������" t_id= '
			+ t_id + ' />';
		$("#" + t_id + "1s").html("�����");
		
				
		$("#" + t_id + "2").html(html);
		$("#" + t_id + "4").text(db_nb);
		}
	});
	
	
	
	
	//====================================ĳ�� �κ�
	$(document)
	.ready(function() {
		$(document).on("click","#accept",
						function() {
							location.href = "accept.do?t_id="
									+ $(this).attr("t_id");					
					//�ŷ� �Ϸῡ append�� ���̱� 								
						});
			
		
			$(document).on("click","#report",function() {

			var t_id = $(this).attr("t_id");

			tradeDwr.getTrade(t_id, popReport);			
			
			
			function popReport(data){
						  
				$("#trade_number").html("�ŷ� ��ȣ : " + data.t_id);
				$("#trade_name").html("�Ű� ��ǰ�� : " + data.p_name);
				$("#rep_memberId").attr("value", data.t_seller);	
				$("#rep_writer").attr("value", data.t_buyer);
				$("#rep_productId").attr("value", data.p_id);
				
				
			}
			
				
			//�Ű��ϱ� �˾�
			$("#main_report").bPopup();
            /*$("#rep_reason").attr("value",$("#report_choice >option:selected").html()); */
				});		
			
			
			$(document).on("click","#review_in_btn",function(){
				
			
				var p_id = $(this).attr("value");
				$("#rp_id").attr("value",p_id);
				
				tradeDwr.getP_name(p_id, reviewShow);
				
				function reviewShow(data){
					
					$("#rp_name").html("��ǰ��: "+ data);
					
				}			
				
				
				$("#review_pop").bPopup();
				
				
			});	
			
				
			
			
			
			});
	
	
	
	
		

});

$(document).on('click',	'.db_trace', function() {
	
	
		
		var t_id = $(this).attr("t_id");
		window.open("view/popup_deliver.jsp", "�����ȸ",
		"width=700,height=700,resizalbe=no");

	//	$("#" + t_id + "1").text("��ۿϷ�");
		
		$("#" + t_id + "3").text("��ۿϷ�");	
		
		$(".db_trace[t_id="+t_id+"]").addClass("none");
		
		var html = '<input type="button" id="accept"  t_id='+t_id+' value="����Ȯ��" />	<input id="report" type="button"  t_id='+t_id+'  value="�Ű��ϱ�" /> ';
			
		$(".bl[t_id='"+t_id+"'] .td_db_trace").append(html);
			
		tradeDwr.update_status(t_id);

 	
	
});



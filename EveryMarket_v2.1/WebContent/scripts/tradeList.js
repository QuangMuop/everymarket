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
	
	
	

});

$(document).on('click',	function() {
	
	$(".db_trace").on('click',function() {
		var t_id = $(this).attr("t_id");
		window.open("view/popup_deliver.jsp", "�����ȸ",
		"width=700,height=700,resizalbe=no");

		$("#" + t_id + "1").text("��ۿϷ�");
		$("#" + t_id + "3").text("��ۿϷ�");	
		
		$(".db_trace").addClass("dis_tr");
		
		var html = '<input type="button"  id="accept"  t_id='+t_id+' value="����Ȯ��" />	<input id="report" type="button"  t_id='+t_id+'  value="�Ű��ϱ�" /> ';
		
		
		
		$("#button").append(html);
			
		
		
		tradeDwr.update_status(t_id);

	});
	
	//����Ȯ���� �������ÿ� �ٲ��ֱ�
	$(".deliver_submit").click(function(){
		   
		var t_id = $(this).attr("t_id");
		
		 if(confirm("��ǰ������ Ȯ���Ͻðڽ��ϱ�?")){
		      tradeDwr.trade_ok(t_id);	
		      $("#" + t_id).addClass("dis_tr");		      
			}else{
			alert("��");
		}
		
		
		
		
		
		
	});
	

});



$(document).ready(function() {
	var t_ids = new Array();
	var t_status = new Array();
	
	//삭제 버튼눌렀을때
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
    		/*배송기간을 초과하면 삭제해준다.*/
    		if(data < 0){
    			tradeDwr.trade_delete(t_ids[index]);
    		}    		 
    		
    		$('#' + t_ids[index] + "1s").append("    입력가능 날짜까지 " + data + "일 남았습니다.");
    	}
    });      
  
	var t_status = $("#t_status").attr("name");
	
    // 배송번호 입력했을때 db상태바꿔주는 것
	$(".dn_bt").click(function(event) {
		var t_id = $(this).attr("t_id");			
		var db_nb = $("." + t_id + "5").val();
		
		if(db_nb.length < 8 || 12 < db_nb.length){
			alert("8자리수 이상, 12자리 이하의 알맞은 운송번호를 입력해주세요");
		}else{
			/*db trade status바꿔주고*/		
			tradeDwr.update_db_nb(db_nb, t_id);
			/*운송번호로 주문번호 바꿔주기*/
			$('#' + t_id + "4").text(db_nb);
			$("tr[t_ids="+t_id+"]").attr("t_status",2);
												
			var html = '<input class="db_trace" type="button" value="배송추적" t_id= ' + t_id + ' />';
			$("#" + t_id + "1s").html("배송중");
				
			$("#" + t_id + "2").html(html);
			$("#" + t_id + "4").text(db_nb);
		}
	});
	
	//====================================캐쉬 부분
	$(document).on("click", "#accept", function(){
		/*거래 완료에 append로 붙이기*/
		location.href = "accept.do?t_id=" + $(this).attr("t_id");					
	});
		
	$(document).on("click", "#report", function(){
		var t_id = $(this).attr("t_id");

		tradeDwr.getTrade(t_id, popReport);			
		function popReport(data){
			$("#trade_number").html("거래 번호 : " + data.t_id);
			$("#trade_name").html("신고 상품명 : " + data.p_name);
			$("#rep_memberId").attr("value", data.t_seller);	
			$("#rep_writer").attr("value", data.t_buyer);
			$("#rep_productId").attr("value", data.p_id);
		}
							
		/*신고하기 팝업*/
		$("#main_report").bPopup();
	});		
		
	/*리뷰부분*/
	$(document).on("click", "#review_in_btn", function(){				
		var p_id = $(this).attr("value");

		$("#rp_id").attr("value",p_id);
		$("#rp_ok1").attr("value", p_id);
		
		tradeDwr.getP_name(p_id, reviewShow);
		function reviewShow(data){
			$("#rp_name").html("물품명: "+ data);					
		}
		
		$("#review_pop").bPopup();
		
		$("#rp_ok1").click(function(){
			alert("ff");
			var r_content= $("#r_content").val();
			var r_score = $("#r_score").val();
			var p_id = $("#rp_id").attr("value");
			
			tradeDwr.insert_Review(r_content, r_score, p_id);
			
			$("#review_in_btn[value="+p_id+"]").addClass("none");
			$("#tr[p_id="+p_id+"]").append("<div>리뷰작성완료</div>");
			$("#review_pop").bPopup().close();
		});
	});	
			
	$(document).on('click',	'.db_trace', function() {
		var p_id = $(this).attr("value");

		$("#rp_id").attr("value",p_id);
		$("#rp_ok1").attr("value", p_id);
		
		tradeDwr.getP_name(p_id, reviewShow);		
		function reviewShow(data){
			$("#rp_name").html("물품명: "+ data);					
		}					
				
		$("#review_pop").bPopup();			
	});	
	
	$("#rp_ok1").click(function(){
		var r_content= $("#r_content").val();
		var r_score = $("#r_score").val();
		var p_id = $("#rp_id").attr("value");
				
		tradeDwr.insert_Review(r_content,r_score,p_id);

		$("#review_in_btn[class='"+p_id+"']").addClass("none");		
		$("#R_td[class='"+p_id+"']").append("<div>리뷰작성완료</div>");
		
		$("#review_pop").bPopup().close();
	});	

	$(document).on('click',	'.db_trace', function() {
		var t_id = $(this).attr("t_id");
		window.open("view/popup_deliver.jsp?t_id="+t_id, "배송조회", "width=800, height=400, resizalbe=no");

		tradeDwr.update_status(t_id);
	});
});
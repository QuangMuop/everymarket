$(document).ready(function() {
	var t_status = $("#t_status").attr("name");
    // ��۹�ȣ �Է������� db���¹ٲ��ִ� ��
	$(".dn_bt").click(function(event) {
		var t_id = $(this).attr("t_id");
		var t1 = t_id + "[0]";
		
		
		var db_nb = $("." + t_id + "5").val();
		// db trade status�ٲ��ְ�
		tradeDwr.update_db_nb(db_nb, t_id);
		
		
	
		// ���� ��¥
		function show(data){
			remain_date = data;		
		}
		
		
		var html = '<input class="db_trace" type="button" value="�������" t_id= '
			+ t_id + ' />';
		$("#" + t_id + "1").html("�����");
		
		tradeDwr.db_number_remainday(t_id,show);
		
		function show(data){
			remain_date = data;		
		}
		
		
		
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



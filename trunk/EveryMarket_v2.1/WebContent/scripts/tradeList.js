$(document)
		.ready(
				function() {

					var t_status = $("#t_status").attr("name");

					// ��۹�ȣ �Է������� db���¹ٲ��ִ� ��
					$(".dn_bt")
							.click(
									function(event) {

										var t_id = $(this).attr("t_id");
										var t1 = t_id + "[0]";
										alert(t_id);

										var db_nb = $(".dn_bt_nb").val();

										// db trade status�ٲ��ְ�
										tradeDwr.update_db_nb(db_nb, t_id);

										// location.href("trade_list.do");

										var html = '<input class="db_trace" type="button" value="�������" t_id= '
												+ t_id + ' />';
										$("#" + t_id + "1").html("�����");
										$("#" + t_id + "2").html(html);
									});
				});

$(document).on(
		'click',
		function() {
			$(".db_trace").on(
					'click',
					function() {

						alert("Ŭ��");
						var t_id = $(this).attr("t_id");

						window.open("view/popup_deliver.jsp", "�����ȸ",
								"width=450,height=300,resizalbe=no");

						$("#" + t_id + "3").html("��ۿϷ�");
						$("#db_text").text("��ۿϷ�");
						tradeDwr.update_status(t_id);

					});

		});

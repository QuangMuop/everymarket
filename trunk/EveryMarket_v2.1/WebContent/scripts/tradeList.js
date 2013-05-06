$(document)
		.ready(
				function() {

					var t_status = $("#t_status").attr("name");

					// 배송번호 입력했을때 db상태바꿔주는 것
					$(".dn_bt")
							.click(
									function(event) {

										var t_id = $(this).attr("t_id");
										var t1 = t_id + "[0]";
										alert(t_id);

										var db_nb = $("." + t_id + "5").val();

										alert(db_nb);
										// db trade status바꿔주고
										tradeDwr.update_db_nb(db_nb, t_id);

										// location.href("trade_list.do");

										var html = '<input class="db_trace" type="button" value="배송추적" t_id= '
												+ t_id + ' />';
										$("#" + t_id + "1").html("배송중");
										$("#" + t_id + "2").html(html);
										$("#" + t_id + "4").text(db_nb);
									});

					$(".db_trace").on(
							'click',
							function() {
								
								var t_id = $(this).attr("t_id");

								window.open("view/popup_deliver.jsp", "배송조회",
										"width=700,height=700,resizalbe=no");

								$("#" + t_id + "3").text("배송완료");
								$("#db_text").text("배송완료");
								tradeDwr.update_status(t_id);

							});

				});

$(document).on(
		'click',
		function() {
			$(".db_trace").on(
					'click',
					function() {

						var t_id = $(this).attr("t_id");

						window.open("view/popup_deliver.jsp", "배송조회",
								"width=700,height=700,resizalbe=no");

						$("#" + t_id + "1").text("배송완료");
						$("#" + t_id + "3").text("배송완료");
						$("#db_text").text("배송완료");
						tradeDwr.update_status(t_id);

					});

		});

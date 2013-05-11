$(document).ready(
		function() {
			// 이건 이번프로젝트 dwr을 쓴 scoll처리 부분입니다!!
			$('#item_container').BlocksIt({
				numOfCol : 6,
				offsetX : 8,
				offsetY : 8
			});

			var category1 = $("#item_container").attr('category');
			var searchtext = $("#item_container").attr('searchtext');

			if (category1 == null) {
				category1 = "All";

			} else {

			}

			var pageNum = 10;

			$(window).scroll(
					function() {

						$('#item_container').BlocksIt({
							numOfCol : 5,
							offsetX : 8,
							offsetY : 8
						});

						if ($(window).scrollTop() == $(document).height()
								- $(window).height()) {

							listDwr.getList(category1, pageNum, searchtext,
									showList);
							pageNum += 5;

							$('#item_container').BlocksIt({
								numOfCol : 5,
								offsetX : 8,
								offsetY : 8

							});
						}
						;
					});

			function showList(data) {

				$.each(data,
						function(index, product) {

							var html = "<div class='grid' p_id = '"
									+ product.p_id + "'>";
							html += "<div class = 'imgholder'>";
							html += "<img src='image_product/" + product.p_img
									+ "'/>";
							html += "</div>";
							html += "<div>" + product.p_price + "</div>";
							html += "</div>";
							$("#item_container").append(html);
						});

				$('#item_container').BlocksIt({
					numOfCol : 5,
					offsetX : 8,
					offsetY : 8
				});

			}
			;

		});

var currentWidth = 1100;

$(window).resize(function() {
	var winWidth = $(window).width();
	var conWidth;
	if (winWidth < 660) {
		conWidth = 440;
		col = 2;
	} else if (winWidth < 880) {
		conWidth = 660;
		col = 3;
	} else if (winWidth < 1100) {
		conWidth = 880;
		col = 4;
	} else {
		conWidth = 1100;
		col = 5;
	}

	if (conWidth != currentWidth) {
		currentWidth = conWidth;
		$('#item_container').width(conWidth);
		$('#item_container').BlocksIt({
			numOfCol : col,
			offsetX : 8,
			offsetY : 8
		});
	}
});

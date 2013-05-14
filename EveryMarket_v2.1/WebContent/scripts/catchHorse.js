$(document).ready(function(){
	/*상수 구현부*/
	var eventDice = /*12*/getRandomInt(1, 12); 
	
	/*eventDice에 따른 이벤트요소 생성*/
	event_generateHorse(eventDice);
	
	/*최소값과 최대값으로 무작위 int값 구하기*/
	function getRandomInt (min, max) { return Math.floor(Math.random() * (max - min + 1)) + min; }
	
	/*무작위 int값에 따른 요소 생성 및 위치 설정*/
	function event_generateHorse(eventDice){
		$("#indivMarketWrapper").append(
			"<img id='eventCoin' class='hidden' src=images/smarket/coin.png>"
		);
		
		var top, left;
		
		if(eventDice == 1){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_top.PNG'>"
			);
			
			top = $("#h_menu").offset().top - 50;
			left = getRandomInt(
					$("#h_logo").offset().left - 125,
					$("#h_logo").offset().left - 55);
		}else if(eventDice == 2){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_top.PNG'>"
			);
			
			top = $("#h_menu").offset().top - 50;
			left = $("#h_logo").offset().left + $("#h_logo").outerWidth() + 20;
		}else if(eventDice == 3){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_top.PNG'>"
			);
			
			top = $("#h_menu").offset().top - 50;
			left = getRandomInt(
					$("#h_searchbar").offset().left + $("#h_searchbar").outerWidth(),
					$("#h_searchbar").offset().left + $("#h_searchbar").outerWidth() + 150);
		}else if(eventDice == 4){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_top.PNG'>"
			);
			
			top = $("#blog_b_thumb").offset().top + $("#blog_b_thumb").height() - 50;
			left = getRandomInt(
					$("#b_s_line").offset().left + 15,
					$("#b_s_line").offset().left + $("#b_s_line").width() -65);
		}else if(eventDice == 5){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_left.png'>"
			);
			
			top = getRandomInt(
					$("#h_menu").offset().top + 15,
					$("#blog_b_thumb").offset().top + $("#blog_b_thumb").height() - 65);
			left = $("#blog_b_thumb").offset().left - 50;
		}else if(eventDice == 6){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_right.png'>"
			);
			
			top = getRandomInt(
					$("#h_menu").offset().top + 15,
					$("#blog_b_thumb").offset().top + $("#blog_b_thumb").height() - 65);
			left = $("#blog_b_thumb").offset().left + $("#blog_b_thumb").width() + 2;
		}else if(eventDice == 7){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_left.png'>"
			);
			top = getRandomInt(
					$("#productContainer").offset().top + 15,
					$("#b_banner1 > img").offset().top - 250);
			left = $("#productContainer").offset().left - 50;
		}else if(eventDice == 8){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_right.png'>"
			);
			top = getRandomInt(
					$("#productContainer").offset().top + 15,
					$("#b_banner1 > img").offset().top - 250);
			left = $("#productContainer").offset().left + $("#productContainer").width() - 10;
		}else if(eventDice == 9){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_top.PNG'>"
			);
			top = $("#b_banner1 > img").offset().top - 45;
			left = getRandomInt(
				$("#b_banner1 > img").offset().left + 15,
				$("#b_banner1 > img").offset().left + 520);
		}else if(eventDice == 10){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_top.PNG'>"
			);
			top = $("#b_banner1 > img").offset().top - 40;
			left = getRandomInt(
				$("#b_banner1 > img").offset().left + 600,
				$("#b_banner1 > img").offset().left + 900);
		}else if(eventDice == 11){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_bottom.png'>"
			);
			top = $("#b_banner2").offset().top + $("#b_banner2").outerHeight();
			left = getRandomInt(
				$("#b_banner2").offset().left + 100,
				$("#b_banner2").offset().left + 450);
		}else if(eventDice == 12){
			$("#indivMarketWrapper").append(
				"<img id='eventHorse' class='hidden' src='images/aema_bottom.png'>"
			);
			top = $("#b_banner2").offset().top + $("#b_banner2").outerHeight();
			left = getRandomInt(
				$("#b_banner2").offset().left + 625,
				$("#b_banner2").offset().left + $("#b_banner2").width() - 65);
		}
		
		$("#eventCoin").css({ 'left': left + 18, 'top': top + 18 });
		$("#eventHorse").css({ 'left': left, 'top': top }).fadeIn(1000).click(event_clickHorse);
	}
	
	/*이벤트애마 클릭했을 때 이펙트 구현 펑션*/
	function event_clickHorse(){
		var coinTop = $(this).offset().top;
		var heightLevel = coinTop / 200;
		
		$("#horseYelling").bPopup({
			fadeSpeed: 1000,
			follow: [false, false],
			modalClose: false,
			position: [$("#eventHorse").offset().left 
			           		+ $("#eventHorse").width()/2
			           		- $("#horseYelling").width()/2, 
			           $("#eventHorse").offset().top - 30],
            speed: 1000,
            opacity: 0.1,
            onOpen: function(){
            	setTimeout(function(){
            		$("#horseYelling").bPopup().close();
            	}, 2000);
            	
            	$("#eventHorse").fadeOut(1000);
        		$("#eventCoin").fadeIn(1000).delay(heightLevel * 100 + 1000)
        			.animate({ 'top': coinTop - 30 }, 500, "easeOutQuint")
        			.animate({ 
        				'top': $(".coin").offset().top, 
        				'left': $(".coin").offset().left 
        		}, heightLevel * 100 + 1000, updateEventCash);
        		
        		$('html, body').delay(heightLevel * 100 + 2000).animate({ 
        			'scrollTop': 0 
        		}, heightLevel * 100 + 1000);
            }
		});
	}
	
	/*이벤트 캐쉬 추가 펑션*/
	function updateEventCash(){
		var eventCash = getRandomInt(10, 100);
		indivMarketDwr.updateEventCash(eventCash, callback_addEventCash);
		
		function callback_addEventCash(m_cash){
			$("#eventCash_amount").html(eventCash);
			$("#notice_addEventCash").bPopup({
				easing: 'easeOutBack',
				fadeSpeed: 'slow',
				follow: [false, false],
				modalClose: false,
				opacity: 0.3,
				position: [$("#header_cash").offset().left - 165, 
				           $("#header_cash").offset().top + 20],
	            speed: 1000,
	            transition: 'slideDown',
	            onOpen: function(){
	            	setTimeout(function(){
	            		$("#notice_addEventCash").bPopup().close();
	            	}, 2500);
	            }
			});
			
			$("#header_cash").append(
				"<span class='hidden'>" + m_cash + "</span>"
			).find(".hidden").fadeIn(1000).end().find("span:eq(0)").remove();
		}
	}
});
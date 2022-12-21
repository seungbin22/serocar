$(function(){
	// family site
	var selectTarget = $('.select_family select'); 
	selectTarget.on('focus',function(){ 
		$(this).parent().addClass('focus'); 
	}); 
	selectTarget.on('blur', function(){ 
		$(this).parent().removeClass('focus'); 
	}); 
	selectTarget.change(function(){ 
		var select_name = $(this).children('option:selected').text(); 
		$(this).siblings('label').text(select_name);
		$(this).siblings('label').removeClass('placeholder');
		window.open(this.options[this.selectedIndex].value,'_blank');
	});

	// all menu
	var btn_allmenu = $('.btn_allmenu');
	var nav_allmenu = $('.nav_allmenu');
	var btn_close = nav_allmenu.find('.btn_close');

	btn_allmenu.click(function(){
		nav_allmenu.slideDown(200, function(){
			btn_close.slideDown(100);
		});
	});

	btn_close.click(function(){
		btn_close.fadeOut(100);
		nav_allmenu.slideUp(200,function(){});
	});

	// header
	var hd = $('#header');
	$(window).scroll(function(){
		var scroll_left = $(this).scrollLeft();
		hd.css('left', - scroll_left);
	});

	// top button
	var speed = 500; // 스크롤속도
    $(".btn_top").css("cursor", "pointer").click(function()
    {
        $('body, html').animate({scrollTop:0}, speed);
    });

});
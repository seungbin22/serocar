$(document).ready(function() {
/*=============================================
	Datepicker, Monthpicker
=============================================*/
	$('.datepicker').datepicker({
		dateFormat: 'yy-mm-dd',
		prevText: '〈',
		nextText: '〉',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		showOtherMonths: true,
		yearSuffix: '년',
	});

	// datepicker_month
	$('.datepicker_month').monthpicker({
		dateFormat: 'yy-mm',
		prevText: '〈',
		nextText: '〉',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});

/*=============================================
	File Upload
=============================================*/
	var fileTarget = $('.wrap_file .upload_hidden');
	fileTarget.on('change', function () { // 값이 변경되면 
		if (window.FileReader) { // modern browser
			if ($(this)[0].files && $(this)[0].files[0]) {
				var filename = $(this)[0].files[0].name;
			}
		} else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		};
		// 추출한 파일명 삽입 
		$(this).siblings('.upload_name').val(filename);
	});
	fileTarget.on({
		focus: function() {
			$(this).closest('.wrap_file').addClass('outline');
		}, focusout: function() {
			$(this).closest('.wrap_file').removeClass('outline');
		}
	});
});

/*=============================================
		레이어팝업(neoModal)

* Basic Open
	- $('#basic_modal').neoModal();
* Basic Close
	- $('#basic_modal').neoModal('close');
* Add Option with open
	- $('#layer2').neoModal({
		dimLayer: false,
		scrollLock: false,
		dimClickClose: false,
	});
* Add Callback
	- $('#layer3').neoModal({
		callBackArray : [
			{
				className: 'popSubmitClose',
				funcName: function() {
					testAlert();
				}
			},
			{
				className: 'popSubmitClose1',
				funcName: function() {
					$('#layer3').neoModal('close');
					$('#layer4').neoModal();
				}
			}
		],
	});

	function testAlert() {
		alert('testAlert');
	}
* Add Message
	$('#layer4').neoModal({
		message: '<div><span>23123</span>tests',
	});
=============================================*/
(function ($) {
	var options = {};
	var visiblePopupsArray = [];
	var focusableElementsString = "a[href], area[href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), button:not([disabled]), iframe, object, embed, *[tabindex], *[contenteditable]";

	var methods = {
		_init: function(el) {
			this.show(el);
		},
		show: function(el) {
			var $el = $(el);
			var childWrap = $el.children('#pop_wrap');

			 // Remember which element had focus before opening a popup
			$el.data('focusedelementbeforepopup', document.activeElement);

			if(options.scrollLock) {
				$('html,body').css('overflow','hidden');
			}

			if(options.dimLayer) {
				$el.css('background', options.dimBackColor);
			}

			// new pop, z-index ++
			if(visiblePopupsArray.length) {
				var elementId = visiblePopupsArray[visiblePopupsArray.length - 1];
				var el5 = document.getElementById(elementId);
				$el.css('z-index', parseInt($(el5).css('z-index')) + 2);
			} else {
				$el.css('z-index', options.minZindex);
			}

			if(options.message !== null) {
				childWrap.children('.messageWrap').html(options.message);
			}
			
			visiblePopupsArray.push(el.id);
			$el.attr('tabindex', -1);
			// layer fadeIn
			$el.fadeIn(options.speed).focus();

			// position center
			childWrap.css("position","absolute");
			childWrap.css("top", "50%");
			childWrap.css("left", "50%");

			if (childWrap.outerHeight() < $(document).height() || childWrap.outerWidth() < $(document).width()) {
				childWrap.css({ marginTop: -childWrap.outerHeight() / 2, marginLeft: -childWrap.outerWidth() / 2 });
			} else {
				childWrap.css({ top: 0, left: 0 });
			}

			var openCallback = options.open;
			if ($.isFunction(openCallback)) {
				openCallback.call(this);
			}

		},
		close: function(el) {
			var $el = $(el);
			var popupIdIndex = $.inArray(el.id, visiblePopupsArray);

			// If popup is not opened, ignore the rest of the function
			if (popupIdIndex === -1) {
				return;
			}
			if(!popupIdIndex) {
				$('html,body').css('overflow','');
			}
			visiblePopupsArray.splice(popupIdIndex, 1);
			// layer fadeOut
			$el.fadeOut(options.speed);

			// Focus back on saved element
			setTimeout(function() {
				if ($($el.data('focusedelementbeforepopup')).is(':visible')) {
					$el.data('focusedelementbeforepopup').focus();
				}
			}, 0);

			var closeCallback = options.close;
			if ($.isFunction(closeCallback)) {
				closeCallback.call(this);
			}
		}
	};

	// Hide pop click button
	$(document).on('click' ,function(e) {
		if(visiblePopupsArray.length) {
			var elementId = visiblePopupsArray[visiblePopupsArray.length - 1];
			var el = document.getElementById(elementId);
			var $eTarget = $(e.target);

			if($eTarget.hasClass(options.closeButton)){
				methods.close(el);
			}

			if(options.dimClickClose) {
				if($eTarget.hasClass('pop_dim_wrap')){
					methods.close(el);
				}
			}
			
			if(options.callBackArray !== null) {
				options.callBackArray.forEach(function(e) {
					if($eTarget.hasClass(e.className)){
						var callback = e.funcName;
						if ($.isFunction(callback)) {
							callback.call(this);
						}
					}
				});
			}
		}
	});

	// Keep keyboard focus inside of popup
	$(document).on('keydown', function(event) {
		if(visiblePopupsArray.length && event.which == 9) {
			var elementId = visiblePopupsArray[visiblePopupsArray.length - 1];
			var el = document.getElementById(elementId);

			// Get list of all children elements in given object
			var popupItems = $(el).find('*');
			// Get list of focusable items
			var focusableItems = popupItems.filter(focusableElementsString).filter(':visible');
			// Get currently focused item
			var focusedItem = $(':focus');
			// Get the number of focusable items
			var numberOfFocusableItems = focusableItems.length;
			// Get the index of the currently focused item
			var focusedItemIndex = focusableItems.index(focusedItem);

			 // If popup doesn't contain focusable elements, focus popup itself
			if (numberOfFocusableItems === 0) {
				$(el).focus();
				event.preventDefault();
			} else {
				if (event.shiftKey) {
					// Back tab
					// If focused on first item and user preses back-tab, go to the last focusable item
					if (focusedItemIndex === 0) {
						focusableItems.get(numberOfFocusableItems - 1).focus();
						event.preventDefault();
					}
				} else {
					// Forward tab
					// If focused on the last item and user preses tab, go to the first focusable item
					if (focusedItemIndex == numberOfFocusableItems - 1) {
						focusableItems.get(0).focus();
						event.preventDefault();
					}
				}
			}

		}
	});

	$.fn.neoModal = function (customOptions) {
		return this.each(function() {
			var newDefaults = $.extend(true, {}, $.fn.neoModal.defaults);

			if (typeof customOptions === 'object') { // e.g. $('#popup').popup({'color':'blue'})
				var opt = $.extend({}, newDefaults, customOptions);
				options = opt;
				methods._init(this);

			} else if (typeof customOptions === 'string') { // e.g. $('#popup').popup('close')
				methods[customOptions](this);
				options = newDefaults;

			} else { // e.g. $('#popup').popup()
				options = newDefaults;
				methods._init(this);

			}
		});
	};

	$.fn.neoModal.defaults = {
		dimLayer: true,
		dimBackColor: 'rgba(0, 0, 0, 0.3)',
		dimClickClose: true, // dim click close
		speed: 400, // modal fadeIn speed
		scrollLock: true, // parent scroll lock
		closeButton: 'pop_btn_close', // closebutton class
		minZindex: 99999,
		callBackArray: null,
		/* callBackArray : [
			{
				className: 'popSubmitClose',
				funcName: function() {
					testAlert();
				}
			},
			{
				className: 'popSubmitClose1',
				funcName: function() {
					$('#layer3').neoModal('close');
					$('#layer4').neoModal();
				}
			}
		], */
		message: null, // message: 'Lorem ipsum dolor sit amet'
	};
})(jQuery);


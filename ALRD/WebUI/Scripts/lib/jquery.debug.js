/**
* @desc: jQuery Plugs for Console and Alert;
* @param: msg (String) this text will pass as alert message. 
*/

(function($){
	$.fn.debug = function(options){
		
		var defaults = {
			msg: 'Enter message'
		};

		var object = jQuery.extend(defaults, options);
		
		if (window.console) {
			console.log(object.msg);
		}else{
			alert(object.msg);
		}		
	};
})(jQuery);
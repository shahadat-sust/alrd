var texthint = {
	dohint : function() {

	    $('.login-frm').find('input[type=password]').each(function () {
			if($(this).hasClass("hregpass")){} else {
				$(this).val("");
			}
		});

        $('.login-frm').find("input,textarea").each(function () {	
			if ($(this).attr("title") == undefined) {
				return;
			}
			
			var hintText = $(this).attr("title"); 
			
			
			if(this.value =="")
			{
				if($(this).attr("type")=="password" && !$(this).hasClass("hregpass")){
							
					var topPos = "0px";
					if($(this).hasClass("loginkeytop")) {
						topPos = "4px";
					}
					var tbx = "<input type='text' class='pHint text-hint' style='position:absolute;left:15px;top:" + topPos + "; float:none; width:27%;' value='" + $(this).attr("title") + "' />";
					if($(this).parent().find(".pHint").first().attr('type') == undefined)
						$(this).after(tbx);
					
					// Set Style;
					$targetPaddingLeft = $(this).css('padding-left');
					$targetLStyle = $(this).css('height');				
					$targetColor = $(this).css('color');
				
					// Set position;
					$(this).parent().find(".pHint").offset({ left:$(this).offset().left });
					$(this).parent().find(".pHint").offset({ top:$(this).offset().top });
					
					
					$(this).next(".pHint").click(function(){
						$(this).prev().focus();
						$(this).remove();
					});				
				}else{
					this.value = hintText; 
				}
								
				
				$(this).addClass("text-hint");
			}
			else if( this.value != hintText )
			{
				$(this).removeClass("text-hint");
			}
			
			
			$(this).focus(function() {
	/*			
				if($(this).attr('id') === 'passwordID'){
					$(this).closest('span').find('.hint').fadeIn('fast');
				}
				*/
				
				var hintText = $(this).attr("title"); 
				
				if (this.value == hintText) {
					this.value = "";				
				}
				$(this).parent().find(".pHint").remove();
				$(this).removeClass("text-hint");
			});
			
			$(this).blur(function() {
				
				/*if($(this).attr("id") == "txtDateOfCare")
					debugger;
				*/
				if (this.value == "") {
					
					var hintText = $(this).attr("title"); 
					
					if ($(this).attr("title2") != undefined) {
						hintText = $(this).attr("title2");
					}					
					
					if($(this).attr("type")=="password"){
						
						var topPos = "0px";
						if($(this).hasClass("loginkeytop")) {
							topPos = "4px";
						}
						
						var tbx = "<input type='text' class='pHint text-hint' style='position:absolute;left:15px;top:" + topPos + "; float:none; width:27%;' value='" + $(this).attr("title") + "' />";
						if($(this).parent().find(".pHint").first().attr('type') == undefined)
							$(this).after(tbx);
						
						// Set Style;
						$targetPaddingLeft = $(this).css('padding-left');
						$targetLStyle = $(this).css('height');				
						$targetColor = $(this).css('color');
						$(this).parent().find(".pHint").css({ color : $targetColor, 'line-height' : $targetLStyle, 'padding-left' : $targetPaddingLeft });

						// Set position;
						$(this).parent().find(".pHint").offset({ left:$(this).offset().left });
						$(this).parent().find(".pHint").offset({ top:$(this).offset().top });
						
						$(this).next(".pHint").click(function(){
							$(this).prev().focus();
							$(this).remove();
						});
						
					} else {
						this.value = hintText; 
					}
					
					$(this).addClass("text-hint");
					

					
				} else {
					
					var hintText = $(this).attr("title"); 
					if($(this).val() !==  hintText) {
						$(this).removeClass("text-hint");
					}
				}

			});	
			
			$(this).change(function() {
				
				/*if($(this).attr("id") == "txtDateOfCare")
					debugger;
				*/
				if (this.value == "") {
					
					var hintText = $(this).attr("title"); 
					
					if ($(this).attr("title2") != undefined) {
						hintText = $(this).attr("title2");
					}					
					
					if($(this).attr("type")=="password"){
						
						var topPos = "0px";
						if($(this).hasClass("loginkeytop")) {
							topPos = "4px";
						}
						
						var tbx = "<input type='text' class='pHint text-hint' style='position:absolute;left:15px;top:" + topPos + "; float:none; width:27%;' value='" + $(this).attr("title") + "' />";
						if($(this).parent().find(".pHint").first().attr('type') == undefined)
							$(this).after(tbx);
						
						// Set Style;
						$targetPaddingLeft = $(this).css('padding-left');
						$targetLStyle = $(this).css('height');				
						$targetColor = $(this).css('color');
						$(this).parent().find(".pHint").css({ color : $targetColor, 'line-height' : $targetLStyle, 'padding-left' : $targetPaddingLeft });

						// Set position;
						$(this).parent().find(".pHint").offset({ left:$(this).offset().left });
						$(this).parent().find(".pHint").offset({ top:$(this).offset().top });
						
						$(this).next(".pHint").click(function(){
							$(this).prev().focus();
							$(this).remove();
						});
						
					} else {
						this.value = hintText; 
					}
					
					$(this).addClass("text-hint");
				} else {
					
					var hintText = $(this).attr("title"); 
					if ($(this).attr("title2") != undefined) {
						hintText = $(this).attr("title2");
					}
					if($(this).val() !==  hintText) {
						$(this).removeClass("text-hint");
					}
				}

			});	
			
			$(this).keyup(function(){ 
				if($(this).next().attr("type")=="password"){
					$(this).next().next(".pHint").remove();
				}
			});		
		});
	}
};

$(document).ready(function(){
	texthint.dohint();
});
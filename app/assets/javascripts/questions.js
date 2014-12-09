
jQuery(function() {
	
	
	
	
	
 $('#question_description').on('keyup focusin input', function(){
	judge.validate(document.getElementById('question_description'), {
  		valid: function(element) {
  			 $(element).css({	 	
  			 'border' : '1px solid rgba(82,168,236,0.8)',
 			 'outline' : 'thin dotted \9',
  			 '-moz-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 '-webkit-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 'box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)'		 	 	
   		     });
   		     $('#question_description').nextAll().remove();
 		},
  		invalid: function(element, messages) {
  			 $(element).css({
           	'border' : '1px solid  #953b39',
           	'outline' : 'thin dotted \9',
           	'-moz-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 6px #d59392',
  			'-webkit-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 6px #d59392',
  			'box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 6px #d59392'		 
   		     });
   		     $('#question_description').nextAll().remove();
   			 $('#question_description').after("<div class=\"error_judge\"><p>"+messages.join("</p><p>")+"</p></div>");
   		//   alert(messages.join(','));
  		}
	});
  });
  $('#question_description').on('focusout', function(){
  	judge.validate(document.getElementById('question_description'), {
  		valid: function(element) {
  			 $(element).css({	 	
  			 'border' : '1px solid rgba(82,168,236,0.8)',
 			 'outline': 'none',
  			 '-webkit-box-shadow': 'none',
  			 '-moz-box-shadow': 'none',
  			 'box-shadow': 'none'	
  			 });
  			 $('#question_description').nextAll().remove();
 		},
  		invalid: function(element, messages) {
  			 $(element).css({
           	'border' : '1px solid  #953b39',
           	'outline': 'none',
           	'-webkit-box-shadow': 'none',
           	'-moz-box-shadow': 'none',
           	'box-shadow': 'none'	
           	});
    		$('#question_description').nextAll().remove();
   			$('#question_description').after("<div class=\"error_judge\"><p>"+messages.join("</p><p>")+"</p></div>");
  		}
	});
 });
 
 
 

 
 
 $('#question_strength').on('keyup focusin input', function(){
	judge.validate(document.getElementById('question_strength'), {
  		valid: function(element) {
  			 $(element).css({	 	
  			 'border' : '1px solid rgba(82,168,236,0.8)',
 			 'outline' : 'thin dotted \9',
  			 '-moz-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 '-webkit-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 'box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)'		 	 	
   		     });
   		     $('#question_strength').nextAll().remove();
 		},
  		invalid: function(element, messages) {
  			 $(element).css({
           	'border' : '1px solid  #953b39',
           	'outline' : 'thin dotted \9',
           	'-moz-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 6px #d59392',
  			'-webkit-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 6px #d59392',
  			'box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 6px #d59392'	
   		     });
   		     $('#question_strength').nextAll().remove();
   			 $('#question_strength').after("<div class=\"error_judge\"><p>"+messages.join("</p><p>")+"</p></div>");

  		}
	});
 });




 $('#question_strength').on('focusout', function(){
 	judge.validate(document.getElementById('question_strength'), {
  		valid: function(element) {
  			 $(element).css({	 	
  			 'border' : '1px solid rgba(82,168,236,0.8)',
 			 'outline': 'none',
  			 '-webkit-box-shadow': 'none',
 			 '-moz-box-shadow': 'none',
			 'box-shadow': 'none'			 	 	
   		     });
   		     $('#question_strength').nextAll().remove();
 		},
  		invalid: function(element, messages) {
  			 $(element).css({
           	'border' : '1px solid  #953b39',
           	'outline': 'none',
           	'-webkit-box-shadow': 'none',
 			'-moz-box-shadow': 'none',
			'box-shadow': 'none'	
   		     });
			 $('#question_strength').nextAll().remove();
   			 $('#question_strength').after("<div class=\"error_judge\"><p>"+messages.join("</p><p>")+"</p></div>");
  		}
	});
 });

});
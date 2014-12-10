
jQuery(function() {

var tab = ["#parameter_us_code", 
		   "#parameter_us_city",
		   "#parameter_us_postalcode",
		   "#parameter_us_street",
		   "#parameter_us_nip",
		   "#parameter_us_regon",
		   "#parameter_us_www",
		   "#parameter_us_house",
		   "#parameter_us_email",
		   "#parameter_us_tel",
		   "#parameter_us_fax",
		   "#parameter_us_name"];

	
	
 $(tab.join(',')).on('keyup focusin input', function(){
	judge.validate(this, {
  		valid: function(element) {
  			 $(element).css({	 	
  			 'border' : '1px solid rgba(82,168,236,0.8)',
 			 'outline' : 'thin dotted \9',
  			 '-moz-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 '-webkit-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 'box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)'		 	 	
   		     });
   	//     console.log();
   		     $(element).nextAll().remove();
 		},
  		invalid: function(element, messages) {
  			 $(element).css({
           	'border' : '1px solid  #953b39',
           	'outline' : 'thin dotted \9',
           	'-moz-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 6px #d59392',
  			'-webkit-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 6px #d59392',
  			'box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 6px #d59392'		 
   		     });
   		     $(element).nextAll().remove();
   			 $(element).after("<div class=\"error_judge\"><p>"+messages.join("</p><p>")+"</p></div>");
   		//   alert(messages.join(','));
  		}
	});
  });
  $(tab.join(',')).on('focusout', function(){
  	judge.validate(this, {
  		valid: function(element) {
  			 $(element).css({	 	
  			 'border' : '1px solid rgba(82,168,236,0.8)',
 			 'outline': 'none',
  			 '-webkit-box-shadow': 'none',
  			 '-moz-box-shadow': 'none',
  			 'box-shadow': 'none'	
  			 });
  			 $(element).nextAll().remove();
 		},
  		invalid: function(element, messages) {
  			 $(element).css({
           	'border' : '1px solid  #953b39',
           	'outline': 'none',
           	'-webkit-box-shadow': 'none',
           	'-moz-box-shadow': 'none',
           	'box-shadow': 'none'	
           	});
    		$(element).nextAll().remove();
   			$(element).after("<div class=\"error_judge\"><p>"+messages.join("</p><p>")+"</p></div>");
  		}
	});
 });
 
 
 


});
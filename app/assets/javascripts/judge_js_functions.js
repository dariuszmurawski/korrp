
function val_in(obj){	
	judge.validate(obj, {
  		valid: function(element) {
  			 $(element).css({	 	
  			 'border' : '1px solid #b7d1e1',
 			 'outline' : 'thin dotted \9',
  			 '-moz-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 '-webkit-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 'box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)'		 	 	
   		     });
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
  		}
	});
  };
  
function val_out(obj){
  	judge.validate(obj, {
  		valid: function(element) {
  			 $(element).css({	 	
  			 'border' : '1px solid #b7d1e1',
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
 };
 
 
 
function val_ok_in(id){
	$(id).css({	 	
  			 'border' : '1px solid #b7d1e1',
 			 'outline' : 'thin dotted \9',
  			 '-moz-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 '-webkit-box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)',
  			 'box-shadow' : 'inset 0 1px 1px rgba(0,0,0,0.075), 0 0 8px rgba(82,168,236,0.6)'		 	 	
   	});
   	$(id).nextAll().remove();
	
} 

function val_ok_out(id){
	$(id).css({	 	
  			 'border' : '1px solid #b7d1e1',
 			 'outline': 'none',
  			 '-webkit-box-shadow': 'none',
  			 '-moz-box-shadow': 'none',
  			 'box-shadow': 'none'	
  	});
 	$(id).nextAll().remove();
	
} 



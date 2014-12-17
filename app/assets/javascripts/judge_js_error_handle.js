


jQuery(function() {
	
//questions
var tab_question = ["#question_description", 
	 	   			"#question_strength"];	
//users	
var tab_user = ["#user_login", 
		   			"#user_forename", 
		   			"#user_name", 
		   			"#user_email"];
//parameters
var tab_parameter = ["#parameter_us_code", 
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
// levels
var tab_level = ["#level_value"];	
//checks
var tab_check = ["#check_forename",
					"#check_name",
					"#check_org_name",
					"#check_city",
					"#check_postal_code",
					"#check_home_no",
					"#check_pesel",
					"#check_regon",
					"#check_nip"];

var tab_poltaxconn = ["#poltaxconn_database", 
		   			"#poltaxconn_username", 
		   			"#poltaxconn_password"];

var tab = tab_question.concat(tab_user).concat(tab_parameter).concat(tab_level).concat(tab_check).concat(tab_poltaxconn);
console.log(tab.join(','));	
	
 $(tab.join(',')).on('keyup focusin change', function(){
	judge.validate(this, {
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
  });
  
  $(tab.join(',')).on('focusout', function(){
  	judge.validate(this, {
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
 });
});

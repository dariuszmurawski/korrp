


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
var tab_check = ["#check_home_no",
//					"#check_forename",
//					"#check_name",
//					"#check_org_name",
					"#check_postal_code",
//					"#check_pesel",
//					"#check_regon",
//					"#check_nip",
					"#check_city"];

var tab_poltaxconn = ["#poltaxconn_database", 
		   			"#poltaxconn_username", 
		   			"#poltaxconn_password"];

var tab = tab_question.concat(tab_user).concat(tab_parameter).concat(tab_level).concat(tab_check).concat(tab_poltaxconn);
//console.log(tab.join(','));	
	
// $(tab.join(',')).on('keyup focusin change', val_in(this));
//$(tab.join(',')).on('focusout', val_out(this));
});

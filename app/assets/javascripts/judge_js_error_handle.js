


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
//X					"#check_forename",
//X					"#check_name",
//X					"#check_org_name",
					"#check_postal_code",
//					"#check_pesel",
//					"#check_regon",
//					"#check_nip",
					"#check_city"];

var tab_poltaxconn = ["#poltaxconn_database", 
		   			"#poltaxconn_username", 
		   			"#poltaxconn_password"];

var tab = tab_question.concat(tab_user).concat(tab_parameter).concat(tab_level).concat(tab_check).concat(tab_poltaxconn);
	
//walidacja bez warunków
$(tab.join(',')).on('keyup focusin change', function(){
	val_in(this);
});
$(tab.join(',')).on('focusout', function(){
	val_out(this);
});


//walidacja warunkowa
$("#check_org_name").on('keyup focusin change', function(){	
	if ($("#check_forename").val()=='' && $("#check_name").val()==''){	
		val_in(this);
	}
	else{
	val_ok_in(this);
	}
});
$("#check_org_name").on('focusout', function(){
	if ($("#check_forename").val()=='' && $("#check_name").val()==''){
		val_out(this);
	}
	else{
	val_ok_out(this);
	}
});


$("#check_name, #check_forename").on('keyup focusin change', function(){	
	if ($("#check_org_name").val()==''){	
		val_in(this);
	}
	else{
	val_ok_in(this);
	}
});
$("#check_name, #check_forename").on('focusout', function(){
	if ($("#check_org_name").val()==''){
		val_out(this);
	}
	else{
	val_ok_out(this);
	}
});

$("#check_regon, #check_nip").on('keyup focusin change', function(){	
	if ($("#check_org_name").val()!=''){	
		val_in(this);
	}
	else{
	val_ok_in(this);
	}
});
$("#check_regon, #check_nip").on('focusout', function(){
	if ($("#check_org_name").val()!=''){
		val_out(this);
	}
	else{
	val_ok_out(this);
	}
});

$("#check_pesel").on('keyup focusin change', function(){	
	if ($("#check_name").val()!='' && $("#check_forename").val()!=''){	
		val_in(this);
	}
	else{
	val_ok_in(this);
	}
});
$("#check_pesel").on('focusout', function(){
	if ($("#check_name").val()!='' && $("#check_forename").val()!=''){
		val_out(this);
	}
	else{
	val_ok_out(this);
	}
});




});

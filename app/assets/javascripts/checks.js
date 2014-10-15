//$(function() {
//	$('#pkd_field').change(function() {
//	test = $('#pkd_field').val();	
//	$('#branch_field').val(test);
//	});
//});





jQuery(function() {
	$('#check_pkd_description').autocomplete({source: $('#check_pkd_description').data('autocomplete-source') 	});




	
	

	$('#check_pkd_description').on('autocompleteclose',function(event, ui){
		var description=$('#check_pkd_description').val();
		
	//	var tmp2 = $.get('/pkds/get_branch', description, function() { });
	
		$('#check_branch').val(description);
	//	alert($('#check_pkd_description').val());
	});





	var val1=$('#check_answers_attributes_0_q_strength + b').html();
	$('#check_answers_attributes_0_q_strength + b').html('0');
//	$('#check_answers_attributes_0_q_strength + b').hide();
	$('#check_answers_attributes_0_q_answer').change(function() {
	var val=$('#check_answers_attributes_0_q_answer').val();
	if (val=='true') {
//		$('#check_answers_attributes_0_q_strength + b').show();
		$('#check_answers_attributes_0_q_strength + b').html(val1);
	} 		
	else {
		$('#check_answers_attributes_0_q_strength + b').html('0');
//		$('#check_answers_attributes_0_q_strength + b').hide();
	}
	
	});



});




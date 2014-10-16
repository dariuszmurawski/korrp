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
		$.get('/checks/get_pkd_branch', description, function() { });
		$('#check_branch').val(description);
	//	alert($('#check_pkd_description').val());
	});


	$('.strength_class').hide();
	$('.answer_class').on('change', function(){
		
		var answer=$(this).attr('id');
		var index=answer.slice(25,26);
		var strength='check_answers_attributes_'+index+'_q_strength';
		var value=$(this).val();
	
		if (value=='true') {
			$('#'+strength+' + b').show();
			$('#'+strength+' + b + b').hide();
		}
		else {
			$('#'+strength+' + b').hide();
			$('#'+strength+' + b + b').show();
		}
		sum_strength();
	});

	
	function sum_strength(){
		var suma=0;
		$('.strength_class:visible').each(function(){
			suma=+suma + +$(this).text();
		});
		$('#check_score').val(suma);
		
	};

//	var val1=$('#check_answers_attributes_0_q_strength + b').html();
//	$('#check_answers_attributes_0_q_strength + b').html('0');
//	$('#check_answers_attributes_0_q_answer').change(function() {
//	var val=$('#check_answers_attributes_0_q_answer').val();
//	if (val=='true') {
//		$('#check_answers_attributes_0_q_strength + b').html(val1);
//	} 		
//	else {
//		$('#check_answers_attributes_0_q_strength + b').html('0');
//	}
	
//	});



});




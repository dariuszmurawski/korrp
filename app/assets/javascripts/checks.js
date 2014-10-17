//$(function() {
//	$('#pkd_field').change(function() {
//	test = $('#pkd_field').val();	
//	$('#branch_field').val(test);
//	});
//});





jQuery(function() {
	
	
	$('#check_pkd_description').autocomplete({source: $('#check_pkd_description').data('autocomplete-source') 	});


	$('#check_pkd_description').on('autocompleteclose input',function(event, ui){
		var description=$('#check_pkd_description').val();	
	//	$('#check_branch').val(description);	
		
		
		
		$.getJSON('/get_branch',{description: description}, function(data) {
					$('#check_branch').val(data.branch);	
	
		})
		.fail(function(){
			$('#check_branch').val("Zły kod PKD!");
		});


		
	});



 





// ryzyko punkty
	$('#check_level').val("NISKI");
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
		$.getJSON('/get_levels', function(data) {
			if (suma < data[0].value){
				$('#check_level').val("NISKI");
			}
			else if (suma < data[1].value){
				$('#check_level').val(data[0].description);
				
			}
			else {
				$('#check_level').val(data[1].description);
			}
			

		});
		
	};




});




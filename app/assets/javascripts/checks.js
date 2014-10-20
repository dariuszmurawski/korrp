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
	
		$.getJSON('/get_branch',{description: description}, function(data) {
					$('#check_branch').val(data.branch);
					$('#check_pkd_full').val($('#check_pkd_description').val());
	
		})
		.fail(function(){
			$('#check_branch').val("Zły kod PKD!");
		});
	
	});



 





// ryzyko punkty start
	$('.strength_class').hide();
	$('#check_level').val("NISKI");
	$('#check_score').val('0');
//init
	$('.answer_class').each(function(){
		init_fields(this);
	});
	
//change
	$('.answer_class').on('change', function(){
		init_fields(this);
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
	
	function init_fields(val){
		var answer=$(val).attr('id');
		var index=answer.slice(25,26);
		var strength='check_answers_attributes_'+index+'_q_strength';
		var value=$(val).val();
	
		if (value=='true') {
			$('#'+strength+' + b').show();
			$('#'+strength+' + b + b').hide();
		}
		else {
			$('#'+strength+' + b').hide();
			$('#'+strength+' + b + b').show();
		}
		
	};




});




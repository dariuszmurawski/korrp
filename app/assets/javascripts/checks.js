//$(function() {
//	$('#pkd_field').change(function() {
//	test = $('#pkd_field').val();	
//	$('#branch_field').val(test);
//	});
//});



jQuery(function() {
//	$('#check_pkd_description').autocomplete({source: ['foo', 'food', 'four']});
	$('#check_pkd_description').autocomplete({source: $('#check_pkd_description').data('autocomplete-source') });

	

});




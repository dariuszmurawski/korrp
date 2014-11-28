
jQuery(function() {
	
 
/*
 $('#question_description').on('keyup', function(){
// alert("Key up detected");
// console.log("sdsdf");
	judge.validate(document.getElementById('question_description'), {
 		valid: function(element) {
    		element.style.border = '10px solid green';
  		},
  			invalid: function(element, messages) {
    			element.style.border = '10px solid red';
    			alert(messages.join(','));
  			}
	});
 });
 */
 
 
 $('#question_strength').on('keyup', function(){
	judge.validate(document.getElementById('question_strength'), {
  		valid: function(element) {
    		element.style.border = '1px solid rgba(82, 168, 236, 0.8)';
    //		$(this).css('box-shadow', '10px 10px 5px #888');
 		},
  		invalid: function(element, messages) {
    	//	element.style.border = '1px solid red';
    	element.style.border = '1px solid  rgba(200,168,136,.6)';
    	//box-shadow
  	  //		alert(messages.join(','));
  		}
	});
 });

});
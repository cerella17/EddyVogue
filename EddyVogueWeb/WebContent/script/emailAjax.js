
$(document).ready(function(){
	$('#email').change(function(){
		console.log("change")
		
		var email = $('#email').val();
		$.ajax({
			type: 'POST',
			data:{email:email},
			url: 'AjaxEmailController',
			success: function(result){
console.log(result)				
				$('#result').text(result.success)

			}
		});
	});
})

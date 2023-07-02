
$(document).ready(function(){
	$('#email').change(function(){
		
		
		let email = $('#email').val();
		$.ajax({
			type: 'POST',
			data:{email:email},
			url: 'AjaxEmailController',
			success: function(result){
				
				$('#result').text(result.success)

			}
		});
	});
})

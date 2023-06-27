
$(document).ready(function(){
	$('email').change(function(){
		
		var email = $('#email').val();
		$.ajax({
			type: 'POST',
			data:{email:email},
			url: '/controllers/user',
			success: function(result){
				$('result').html(result);
			}
		});
	});
})
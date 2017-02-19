$('#message-supplier').click(function(e){
	e.preventDefault();
	var messageId = $(this).attr('title');
	var messageForm = new FormData();
	messageForm.append('message[body]', $('#body').val().trim());
	messageForm.append('message[profile_id]',$('.sender-this').html().trim());

$.ajax({
		url: "/messages/",
		type: "POST",
		data: messageForm,
	   cache: false,
 contentType: false,
 processData: false,
	 success: function(resp){ 
		console.log(resp);
		$('.alert').html("");
		$('.modal-body').prepend("<div class='alert alert-success' role='alert'> Message sent sucessfully!</div>");
		},
		fail:  function(resp){
		$('.alert').html("");
		$('.modal-body').prepend("<div class='alert alert-danger' role='alert'> You cannot send this message at this time!</div>");
		}
	});
});

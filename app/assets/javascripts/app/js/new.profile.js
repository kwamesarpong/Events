$(".full_name").click(function(e){
    $('.full_name_text').attr("contentEditable", "true");
    $('.full_name_text').css("outline","none");
    console.log("it");
});

$(".tagline").click(function(e){
    $('.tagline_text').attr("contentEditable", "true");
    $('.tagline_text').css("outline","none");
    console.log("it");
});

$(".short_desc").click(function(e){
    $('.short_desc_text').attr("contentEditable", "true");
    $('.short_desc_text').css("outline","none");
	$('.short_desc_text').text("");
    console.log("it");
});

$(".long_desc").click(function(e){
    $('.long_desc_text').attr("contentEditable", "true");
    console.log("it");
});

$(".address_text").click(function(e){
    $('.address_text').attr("contentEditable", "true");
    console.log("it");
});

$(".address_text_2").click(function(e){
    $('.address_text_2').attr("contentEditable", "true");
    console.log("it");
});

$(".phone_number_text").click(function(e){
    $('.phone_number_text').attr("contentEditable", "true");
    console.log("it");
});

$(".phone_number_text").click(function(e){
    $('.phone_number_text_2').attr("contentEditable", "true");
    console.log("it");
});

$(".email_text").click(function(e){
    $('.email_text').attr("contentEditable", "true");
    console.log("it");
});

$(".email_text_2").click(function(e){
    $('.email_text_2').attr("contentEditable", "true");
    console.log("it");
});

function previewFile() {
  var preview = document.querySelector('.custom-profile-banner');
  var file    = document.querySelector('input[type=file].upload-custom-banner').files[0];
  var reader  = new FileReader();

  reader.addEventListener("load", function () {
    preview.src = reader.result;
  }, false);

  if (file) {
    reader.readAsDataURL(file);
  }
  console.log(file)
  //console.log(document.querySelector('input[type=file].upload-custom-banner').files[0].name)
}




$(document).keypress(function(e) {
	if(e.which == 13) {
		e.preventDefault();
		var profile;
		var formData = new FormData();
    	$input = $("input[type=file].upload-custom-banner");
		formData.append('profile[banner]', $input[0].files[0]);
		formData.append('profile[name_of_agency]', $('.full_name_text').text());
		formData.append('profile[desc]', $('.long_desc_text').text());
		formData.append('profile[short_desc]', $('.short_desc_text').text());
		formData.append('profile[tagline]', $('.tagline_text').text());
		formData.append('address[physical_address]', $('.address_text').text());
		$('#slider').attr("value", function( i, val ){
			profile = val;
		});
		$.ajax({
		  url: "/profiles/"+profile,
		 type: "PATCH",
		 data: formData,
		cache: false,
  contentType: false,
  processData: false,
	  success: function(resp){ 
			console.log(resp);
			},
		 fail:  function(resp){
			console.log(resp);
	   }
		});
	   

	}


});
$(document).keyup(function(e){
    //e.preventDefault();
    var searchquery = $("#search-form input[type='text']").val().trim();
    if(searchquery.length > 3){
        //todo
        //1. you want to fire request to rails api for suggestion now.

        var searchForm = new FormData();
        searchForm.append("search[q]", searchquery);

  $.ajax({
		  url: "/async_search",
		 type: "POST",
		 data: searchForm,
		cache: false,
  contentType: false,
  processData: false,
	  success: function(resp){ 
			
			},
		 fail:  function(resp){
			console.log(resp);
	   		}
		});
        console.log("fdjhjdshjds");

    }
    
});
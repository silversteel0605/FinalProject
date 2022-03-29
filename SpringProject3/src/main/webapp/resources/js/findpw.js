function pw_search() { 
		var frm = document.pwfindscreen;
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		let email=$('#email').val();
		if(email.trim()=="")
		{
			$('#email').focus();
			return;
		}$.ajax({
		   url : '/project/rest/findpw',
		   type: "POST",
		   dataType : "json",
		   data : {
			"id" : id,
			"email" : email
			},
		   success : function(result) {
               if(result==1)
               {
               	   
               }
               else
               {
                   $('#check_result').html("<font color=red>존재하지 않는 ID 또는 이메일입니다.</font>");
               }
		   },
		   error : function(request, status, error) {
			   console.log(request + "/" + status + "/" + error);
		   }
	   });
		 
	 }
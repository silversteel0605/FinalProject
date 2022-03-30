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
			"member_id" : id,
			"email" : email
			},
		   success : function(result) {
               if(result==1)
               {
               	   
               }
               else
               {
                   $('#check_result').html("<font color=red>아이디 또는 이메일이 존재하지 않습니다</font>");
               }
		   },
		   error : function(request, status, error) {
			   console.log(request + "/" + status + "/" + error);
		   }
	   });
		 
	 }
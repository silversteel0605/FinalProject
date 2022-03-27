$('#join').click(function() {
	console.log('go');
	let id=$('#userid').val();
		if(id.trim()=="")
		{
			$('#userid').focus();
			return;
		}
		
	let pwd=$('#userpw').val();
	if(pwd.trim()=="")
	{
		$('#userpw').focus();
		return;
	}$.ajax({
	   url : '/project/rest/join',
	   type: "GET",
	   dataType : "json",
	   data : {
		   "id" : id,
		   "pwd" : pwd,
		   "member_type" : 0,
	   },
	   success : function(result) {
	    	if(result === 1) {
			  location.href = '/project/member/login';				
			} else {
				alert("ID/PW가 잘못 되었습니다");
			}
	   },
	   error : function(request, status, error) {
		   console.log(request + "/" + status + "/" + error);
	   }
	});
})
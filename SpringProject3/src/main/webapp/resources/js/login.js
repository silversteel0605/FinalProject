$('#join').click(function() {
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
	}
	
	let member_type = $('#member_type').val();
	$.ajax({
	   url : '/project/rest/join',
	   type: "GET",
	   dataType : "json",
	   data : {
		   "member_id" : id,
		   "member_pwd" : pwd,
		   "member_type" : member_type,
	   },
	   success : function(result) {
	    	if(result === 2) {
			  location.href = `/project/member/login?member_id=${id}&member_tyep=${member_type}`;				
			} else if (result === 1) {
				alert("관리자에 의해 승인되지 않은 회원입니다");
			} else {				
				alert("ID/PW가 잘못 되었습니다");
			}
	   },
	   error : function(request, status, error) {
		   console.log(request + "/" + status + "/" + error);
	   }
	});
})
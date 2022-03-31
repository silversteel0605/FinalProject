/**
 * 
 */
function idcheck()
{
	window.open("./ivc","idcheck","width=320,height=300,scrollbars=no");
}

$(function(){
	$('#joinBtn').click(function(){

		let id=$('#id').val();
		
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		
		// 비밀번호
		//const pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; //정규식 영문자+숫자+특수문자 조합으로 8~25
		
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			//alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
			$('#pwd').focus();
			return;
		}
		
		let pwd1=$('#pwd1').val();
		if(pwd1.trim()=="")
		{
			$('#pwd1').focus();
			return;
		}
		
		if(pwd!==pwd1)
		{
			alert("비밀번호를 다시 입력하세요!!");
			$('#pwd1').val("");
			$('#pwd1').focus();
			return;
		}
		
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		
		let email=$('#email').val();
		if(email.trim()=="")
		{
			$('#email').focus();
			return;
		}
		
		let birthday=$('#birthday').val();
		if(birthday.trim()=="")
		{
			$('#birthday').focus();
			return;
		}
		
		let post=$('#post').val();
		if(post.trim()=="")
		{
			$('#post').focus();
			return;
		}
		
		let addr1=$('#addr1').val();
		if(addr1.trim()=="")
		{
			$('#addr1').focus();
			return;
		}
		
		let addr2=$('#addr2').val();
		if(addr2.trim()=="")
		{
			$('#addr2').focus();
			return;
		}
		
		var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
		
		if(tel2=="")
		{
			$('#tel2').focus();
			return;
		}
		
		const tel = $('#tel1 option:selected').val() + $('#tel2').val();
		$.ajax({
		   url : '/project/rest/signin',
		   type: "POST",
		   dataType : "json",
		   data : {
			   "member_id" : id,
			   "member_pwd" : pwd,
			   "member_name" : name,
			   "birthday" : birthday,
			   "post" : post,
			   "addr1" : addr1,
			   "addr2" : addr2,
			   "email" : email,
			   "tel" : tel,
			   "member_type" : 0
		   },
		   success : function(result) {
			  alert("회원가입에 성공했습니다. 로그인 해주십시오");
			  location.href = '/project/login';
            
		   },
		   error : function(request, status, error) {
			   console.log(request + "/" + status + "/" + error);
		   }
   		});
	});
});

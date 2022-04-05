<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row1{
  margin: 0px auto;
  width:700px;
}
</style>
</head>
<body>
 <div style="height: 30px"></div>
  <div class="row row1">
    <h1 class="text-center">회원가입</h1>
    <form name="joinFrm" id="joinFrm">
    <table class="table">
     <tr>
       <th class="text-right danger" width="15%">아이디</th>
       <td width=85%>
         <input type=text name=id class="input-sm" size=15 readonly id="id">
         <input type=button value="중복체크" class="btn btn-sm btn-primary" onclick="idcheck()">
       </td>
     </tr>
     <tr>
       <th class="text-right danger" width="15%">비밀번호</th>
       <td width=85%>
         <input type=password name=pwd class="input-sm" size=15 id="pwd">
         &nbsp;재입력:<input type=password name=pwd1 class="input-sm" size=15 id="pwd1">
       </td>
     </tr>
     <tr>
       <th class="text-right danger" width="15%">이름</th>
       <td width=85%>
         <input type=text name=name class="input-sm" size=15 id="name">
       </td>
     </tr>
     <tr>
       <th class="text-right danger" width="15%">이메일</th>
       <td width=85%>
         <input type=text name=email class="input-sm" size=45 id="email">
       </td>
     </tr>
     <tr>
       <th class="text-right danger" width="15%">생년월일</th>
       <td width=85%>
         <input type=data name=birthday class="input-sm" size=25 id="birthday">
       </td>
     </tr>
     <tr>
       <th class="text-right danger" width="15%">우편번호</th>
       <td width=85%>
         <input type=text name=post class="input-sm" size=7 readonly id="post">
         <input type=button value="우편번호" class="btn btn-sm btn-primary" onclick="findAdr()">
       </td>
     </tr>
     <tr>
       <th class="text-right danger" width="15%">주소</th>
       <td width=85%>
         <input type=text name=addr1 class="input-sm" size=45 readonly id="addr1">
       </td>
     </tr>
     <tr>
       <th class="text-right danger" width="15%">상세주소</th>
       <td width=85%>
         <input type=text name=addr2 class="input-sm" size=45 id="addr2">
       </td>
     </tr>
     <tr>
       <th class="text-right danger" width="15%">전화번호</th>
       <td width=85%>
         <select name=tel1 id="tel1">
           <option>010</option>
           <option>011</option>
           <option>017</option>
         </select>
         <input type=number name=tel2 class="input-sm" size=15 id="tel2">
       </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center">
         <input type=button value="회원가입" class="btn btn-sm btn-danger" id="joinBtn">
         <input type=button value="취소" class="btn btn-sm btn-warning"
           onclick="javascript:history.back()"
         >
       </td>
     </tr>
    </table>
    </form>
  </div>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value="/resources/js/set.post.js?after"/>"></script>
<script type="text/javascript">
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
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
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
</script>
</body>
</html>
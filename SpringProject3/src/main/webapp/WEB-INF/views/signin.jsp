<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/signin.css?after"/>" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=77mbzylhqr"></link>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>"/>
	<!-- header css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/renewal_nav.css"/>"/>
    <!--��ũ��� ���� css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
    <!-- ��� css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>"/>
<style type="text/css">.row1{
  margin: 0px auto;
  width:700px;
}
</style>

</head>
<body style="overflow-x: hidden">
<jsp:include page='renewal_nav.jsp'/>

<section class="wrap">
	<div class="container-lg bb mb-5">
	<div class="sub_title">
		<div class="tit mb-2">JOIN</div>
		<div class="txt">ȸ������</div>
	</div>
</div>


<div id ="contants" style="padding-top: 76px" class="container-lg lbb">
  
  <div class="row row1">
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
</div>


	
</section>



 
  <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- ��ũ��� js-->
	<script src="<c:url value="/resources/js/main_ani.js"/>"></script>
	<script src="<c:url value="/resources/js/anime.min.js"/>"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="<c:url value="/resources/js/darkmode.js"/>"></script>
    <!-- ��� JS -->
    <script src="<c:url value="/resources/js/modal.js"/>"></script>
 <script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value="/resources/js/set.post.js?after"/>"></script>
<script type="text/javascript" charset="utf-8">
function idcheck()
{
	window.open("./ivc","idcheck","width=320,height=300,scrollbars=no");
}

$(function(){
	$('#joinBtn').click(function(){

		//아이디
		let id=$('#id').val();
		const idRule = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		
		if(!idRule.test(id))
		{
			alert("ID 영문자로 시작하는 영문자 또는 숫자 6~20자 사용해야 합니다.");
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
		
		const pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; //정규식 영문자+숫자+특수문자 조합으로 8~25
		if(!pwdCheck.test(pwd))
		{
			alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
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
		
		//이름
		let name=$('#name').val();
		const nameRule =/[\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]/g;
		
		if(name.trim()=="")
		{
			alert("이름을 입력하세요.");
			$('#name').focus();
			return;
		}
		
		if(!nameRule.test(name)){
			alert("이름은 한글, 영문으로만 사용해야 합니다.");
			$('#name').focus();
			return;
		}
		
		let email=$('#email').val();
		const emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		if(email.trim()=="")
		{
			alert("이메일을 입력하세요.");
			$('#email').focus();
			return;
		}
		
		if(!emailRule.test(email))
		{
			alert("이메일 양식이 아닙니다.");
			$('#email').focus();
			return;
		}
		
		let birthday=$('#birthday').val();
		const birthdayRule1 = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		const birthdayRule2 = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		
		if(birthday.trim()=="")
		{
			alert("생년월일을 입력하세요.");
			$('#birthday').focus();
			return;
		}
		
		if(!birthdayRule1.test(birthday) && !birthdayRule2.test(birthday))
		{
			alert("ex) '2000-01-01' 또는 '20000101' 로 사용해야 합니다.");
	
			$('#birthday').focus();
			return;
		}
		
		let post=$('#post').val();
		if(post.trim()=="")
		{
			alert("우편번호를 입력하세요.");
			$('#post').focus();
			return;
		}
		
		let addr1=$('#addr1').val();
		if(addr1.trim()=="")
		{
			alert("주소를 입력하세요.");
			$('#addr1').focus();
			return;
		}
		
		let addr2=$('#addr2').val();
		if(addr2.trim()=="")
		{
			alert("상세주소를 입력하세요.");
			$('#addr2').focus();
			return;
		}
		
		const tel2Rule = ^\\d{7,8}$;
		if(tel2=="")
		{
			alert("전화번호를 입력하세요.");
			$('#tel2').focus();
			return;
		}
		
		if(!tel2Rule.test(tel2))
		{
			alert("전화번호 양식에서 벗어납니다.");
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
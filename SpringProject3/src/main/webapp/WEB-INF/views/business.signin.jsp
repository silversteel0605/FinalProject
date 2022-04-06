<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/signin.css?after"/>" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=77mbzylhqr"></link>
	<link href="<c:url value="/resources/css/findid.css?after"/>" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=77mbzylhqr"></link>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>"/>
	<!-- header css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/renewal_nav.css"/>"/>
    <!--다크모드 관련 css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
    <!-- 모달 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>"/>
    
<style type="text/css">
.row1{
  margin: 0px auto;
  width:700px;
}
</style>
</head>

<body style="overflow-x: hidden">
<jsp:include page='renewal_nav.jsp'/>
 <div style="height: 30px"></div>
 <section class="wrap">
	<div class="container-lg bb mb-5">
	<div class="sub_title">
		<div class="txt">JOIN</div>
		<div class="txt">회원가입</div>
	</div>
</div>

 
  <div class="row row1">
  
    <form name="joinFrm" id="joinFrm">
    <table class="table">
     <tr>
       <th class="text-right danger" width="25%">캠핑장 이름</th>
       <td width=85%>
         <input type=data name=camp class="input-sm" size=25 id="camp">
       </td>
     </tr>
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
       <th class="text-right danger" width="15%">사업자 등록증</th>
       <td width=85%>
         <input type="file" name="file" id="imageFileOpenInput" accept="image/*">
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
  <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 다크모드 js-->
	<script src="<c:url value="/resources/js/main_ani.js"/>"></script>
	<script src="<c:url value="/resources/js/anime.min.js"/>"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="<c:url value="/resources/js/darkmode.js"/>"></script>
    <!-- 모달 JS -->
    <script src="<c:url value="/resources/js/modal.js"/>"></script>
 <script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value="/resources/js/set.post.js?after"/>"></script>
<script type="text/javascript">
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
		
		let camp=$('#camp').val();
		if(camp.trim()=="")
		{
			$('#camp').focus();
			return;
		}
		
	
		$.ajax({
		   url : '/project/rest/signin',
		   type: "POST",
		   dataType : "json",
		   data : {
			   "member_id" : id,
			   "member_pwd" : pwd,
			   "member_name" : name,
			   "camp" : camp,
			   "email" : email,
			   "member_type" : 1,
			   "permit" : 0
		   },
		   success : function(result) {
			  alert("회원가입 신청을 완료했습니다");
			  location.href = '/project/about';
            
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
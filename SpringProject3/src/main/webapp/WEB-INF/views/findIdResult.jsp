<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
</head>
<body style="overflow-x: hidden">
	<jsp:include page='renewal_nav.jsp'/>
	<section class="wrap">
	<div class="container-lg bb mb-5">
	<div class="sub_title">
		<div class="tit mb-2">본인 확인</div>
		<div class="txt">휴대폰 인증</div>
	</div>
</div>
</section>

      <c:choose>
      	<c:when test="${!empty id }">
      		<div class = "tit mb-2 text-center container">
      			<div class = "tit mb-2 text-center found-success">
	      			<h4>  회원님의 아이디는 </h4>  
	      			<div class ="found-id">${id }</div>
	      			<h4>  입니다 </h4>
	   		   </div>
	     		<div class = "text-center found-login">
 		    		<a href="./login">로그인</a>
       			</div>
       		</div>	
      	</c:when>
      	<c:when test="${empty id }">
      		 <div class = "container">
		      	<div class = "tit mb-2 text-center found-fail">
			      <h4>  등록된 정보가 없습니다 </h4>  
			     </div>
			     <div class = "tit mb-2 text-center found-login">
		 		    <input class="btn btn-sm btn-danger" type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
		 		    <a href="./signin"></a>
		       	</div>
		       </div>  
      	</c:when>
      </c:choose>
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
      
</body>
</html>
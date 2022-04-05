<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %>
<% response.setStatus(500); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<body style="overflow-x: ">
	
	<!-- header 호출 -->
	<jsp:include page='renewal_nav.jsp'/>

	<div id="main_ani">
		<h2 id=main_text><span>Let's go</span><br>Camping</h2>
		<img src="resources/images/moon.png" id="moon">
		<img src="resources/images/bird1.png" id="bird1">
		<img src="resources/images/bird2.png" id="bird2">
		<img src="resources/images/forest.png" id="forest">
		<img src="resources/images/rocks.png" id="rocks">
		<img src="resources/images/water.png" id="water">
	</div>

	
	<!-- 실내용 기입란 -->
	<section id ="contants">
		
	</section>
	
	
	
	


	<!-- footer 호출 -->



	<script src="<c:url value="/resources/js/main_ani.js"/>"></script>
	<script src="<c:url value="/resources/js/anime.min.js"/>"></script>
	<!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 다크모드 js-->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="<c:url value="/resources/js/darkmode.js"/>"></script>
    <!-- 모달 JS -->
    <script src="<c:url value="/resources/js/modal.js"/>"></script>
</body>

</html>
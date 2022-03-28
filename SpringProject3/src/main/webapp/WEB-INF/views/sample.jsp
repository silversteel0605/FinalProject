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
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery.timepicker.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>"/>
	
	<!-- dropdown -->
	<link rel="stylesheet" href="<c:url value="/resources/css/dropdown.css"/>"/>
    <!--다크모드 관련 css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/nav.css"/>"/>
</head>
<body style="overflow-x: hidden">
	
	<!-- header 호출 -->
	<jsp:include page='nav.jsp'/>
	
	
	<section id="mainimg" class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('resources/images/bg_1.jpg');">
	  <div class="overlay"></div>
	  <div class="container">
	    <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
	      <div class="col-md-9 ftco-animate pb-5 text-center">
	       <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span> <span>Blog <i class="fa fa-chevron-right"></i></span></p>
	       <h1 class="mb-0 bread">Blog</h1>
	     </div>
	   </div>
	 </div>
	</section>
	
	<!-- 실내용 기입란 -->
	
	
	
	

    
	<!-- footer 호출 -->
    <jsp:include page='footer.jsp'/>

    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen">
    	<svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
        </svg>
    </div>


    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap-datepicker.js"/>"></script>
	<script src="<c:url value="/resources/js/scrollax.min.js"/>"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<c:url value="/resources/js/google-map.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>

    <!-- 다크모드 js-->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="<c:url value="/resources/js/darkmode.js"/>"></script>
</body>

</html>
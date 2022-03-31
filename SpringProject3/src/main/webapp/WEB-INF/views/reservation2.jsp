<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="<c:url value="resources/css/animate.css"/>"/>
  <link rel="stylesheet" href="<c:url value="resources/css/owl.carousel.min.css"/>"/>
  <link rel="stylesheet" href="<c:url value="resources/css/owl.theme.default.min.css"/>"/>
  <link rel="stylesheet" href="<c:url value="resources/css/magnific-popup.css"/>"/>
  <link rel="stylesheet" href="<c:url value="resources/css/bootstrap-datepicker.css"/>"/>
  <link rel="stylesheet" href="<c:url value="resources/css/jquery.timepicker.css"/>"/>
  <link rel="stylesheet" href="<c:url value="resources/css/flaticon.css"/>"/>
  <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
   <div class="container">
     <a class="navbar-brand" href="index.html">Pacific<span>Travel Agency</span></a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="oi oi-menu"></span> Menu
     </button>

     <div class="collapse navbar-collapse" id="ftco-nav">
       <ul class="navbar-nav ml-auto">
         <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
         <li class="nav-item active"><a href="about.html" class="nav-link">About</a></li>
         <li class="nav-item"><a href="destination.html" class="nav-link">Destination</a></li>
         <li class="nav-item"><a href="hotel.html" class="nav-link">Hotel</a></li>
         <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
         <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
       </ul>
     </div>
   </div>
 </nav>
 <!-- END nav -->
 <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('resources/images/bg_1.jpg');">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
      <div class="container" role="main">
			
		
	</div>	
     </div>
   </div>
</section>

 	
 
 	<section class="ftco-section">
 		<input type="radio" name="slide" id="slide01"checked>
 		<input type="radio" name="slide" id="slide02">
 		<input type="radio" name="slide" id="slide03">
				 <div class="project-wrap">
				 	<ul class="slidelist">
				 		<li>
				 			<a>
				 				<label for="slide03" class="left"></label>
				 				<img class="img" src="resources/images/destination-8.jpg">
				 				<label for="slide02" class="right"></label>
				 				<span class="price">예약 가능</span>
				 			</a>
				 			<div class="text p-4">
						        <span class="days">2일 숙박</span>
						        <h3><a href="#">어느곳</a></h3>
						        <p class="location"><span class="fa fa-map-marker"></span> 위치정보</p>
						        <ul>
						           <li>사이드 주차</li>
						          <li>전기사용 가능</li>
						          <li>자리 지정</li>
				       			</ul>
				   			</div>
				 		</li>
				 		<li>
				 			<a>
				 				<label for="slide01" class="left"></label>
				 				<img class="img" src="resources/images/destination-7.jpg">
				 				<label for="slide03" class="right"></label>
				 				<span class="price">예약 가능</span>
				 			</a>
				 			<div class="text p-4">
						        <span class="days">2일 숙박</span>
						        <h3><a href="#">어느곳</a></h3>
						        <p class="location"><span class="fa fa-map-marker"></span> 위치정보</p>
						        <ul>
						           <li>사이드 주차</li>
						          <li>전기사용 가능</li>
						          <li>자리 지정</li>
				       			</ul>
				   			</div>
				 		</li>
				 		<li>
				 			<a>
				 				<label for="slide02" class="left"></label>
				 				<img class="img" src="resources/images/destination-6.jpg">
				 				<label for="slide01" class="right"></label>
				 				<span class="price">예약 가능</span>
				 			</a>
				 			<div class="text p-4">
						        <span class="days">2일 숙박</span>
						        <h3><a href="#">어느곳</a></h3>
						        <p class="location"><span class="fa fa-map-marker"></span> 위치정보</p>
						        <ul>
						           <li>사이드 주차</li>
						          <li>전기사용 가능</li>
						          <li>자리 지정</li>
				       			</ul>
				   			</div>
				 		</li>		 		
				 	</ul>  
				</div>
	</section>			
	
	<section class="ftco-section ftco-no-pb">
	   	<div class="container">
	      <div class="row">
	       <div class="col-md-12">
	          <div class="search-wrap-1 ftco-animate">
	             <form action="#" class="search-property-1">
	                <div class="row no-gutters">
				           <div class="col-lg d-flex">
				               <div class="form-group p-4">
				               <label for="#">체크인</label>
				                 <div class="form-field">
				                   <div class="icon"><span class="fa fa-calendar"></span></div>
				                       <input type="text" class="form-control checkin_date" placeholder="Check In Date">
				                   </div>
				               </div>
				           </div>
				           <div class="col-lg d-flex">
				              	<div class="form-group p-4">
				                <label for="#">체크아웃</label>
				                 	<div class="form-field">
				                   		<div class="icon"><span class="fa fa-calendar"></span></div>
				                   		<input type="text" class="form-control checkout_date" placeholder="Check Out Date">
				               		</div>
				           		</div>
				       		</div>
       						
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
	
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="img" style="background-image: url(resources/images/bg_3.jpg);">
             			<div class="overlay"></div>
							<h3 class="h3">체크인 ~시부터</h3>
							<h3 class="h3">체크아웃 ~시까지</h3>
							<h4 class="h4">가격</h4>
							<h4 class="h4">80000원</h4>
						</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco-section">
		<div class= "info container">
				<p>기본정보</p>
			
		</div>
		<div class="reserve-info container">
			<p>예약 정보</p>
		</div>
	</section>
		
 	
		





<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.waypoints.min.js"></script>
<script src="resources/js/jquery.stellar.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.animateNumber.min.js"></script>
<script src="resources/js/bootstrap-datepicker.js"></script>
<script src="resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="resources/js/google-map.js"></script>
<script src="resources/js/main.js"></script>

</body>
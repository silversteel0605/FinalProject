<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	<link rel="stylesheet" href="<c:url value="./resources/css/animate.css"/>"/>
	<link rel="stylesheet" href="<c:url value="./resources/css/owl.carousel.min.css"/>"/>
	<link rel="stylesheet" href="<c:url value="./resources/css/owl.theme.default.min.css"/>"/>
	<link rel="stylesheet" href="<c:url value="./resources/css/magnific-popup.css"/>"/>
	<link rel="stylesheet" href="<c:url value="./resources/css/bootstrap-datepicker.css"/>"/>
	<link rel="stylesheet" href="<c:url value="./resources/css/jquery.timepicker.css"/>"/>
	<link rel="stylesheet" href="<c:url value="./resources/css/flaticon.css"/>"/>
	<link rel="stylesheet" href="<c:url value="./resources/css/style.css"/>"/>
	<link rel="stylesheet" href="<c:url value="./resources/css/review.css"/>"/>
	

	
	<!-- star rating -->
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	
	<script type="text/javascript" src="./resources/js/ckeditor/ckeditor.js"></script>
  
  <!-- naver map -->
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=rlwhiqh9cv"></script>
  <link rel="stylesheet" href="./resources/css/camping_index_style.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light bgc-light" id="ftco-navbar">
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
	    <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
	      <div class="col-md-9 ftco-animate pb-5 text-center">
	       <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span> <span>Blog <i class="fa fa-chevron-right"></i></span></p>
	       <h1 class="mb-0 bread">Blog</h1>
	     </div>
	   </div>
	 </div>
	</section>
	
	<section class="ftco-section services-section">
	  	<div class="container">
			<form name="form" id="form" role="form" method="get" action="./reviewSave">
				
				<!-- <input type="text" style="display: none" name="contentId" value="<%= request.getAttribute("contentId")%>"> -->
				<!-- create review JSP JavaScript -->
				<script type="text/javascript" charset="EUC-KR" src="./resources/js/create_code/create_review_content.js"></script >
				
				<script>
					create_review_save_content(<%= request.getAttribute("contentId")%>);
				</script>
				
			</form>
			
		</div>
	</section>
	
	<footer class="ftco-footer bg-bottom ftco-no-pt" style="background-image: url(images/bg_3.jpg);">
		 <div class="container">
		   <div class="row mb-5">
		     <div class="col-md pt-5">
		       <div class="ftco-footer-widget pt-md-5 mb-4">
		         <h2 class="ftco-heading-2">About</h2>
		         <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		         <ul class="ftco-footer-social list-unstyled float-md-left float-lft">
		           <li class="ftco-animate"><a href="#"><span class="fa fa-twitter"></span></a></li>
		           <li class="ftco-animate"><a href="#"><span class="fa fa-facebook"></span></a></li>
		           <li class="ftco-animate"><a href="#"><span class="fa fa-instagram"></span></a></li>
		         </ul>
		       </div>
		     </div>
		     <div class="col-md pt-5 border-left">
		       <div class="ftco-footer-widget pt-md-5 mb-4 ml-md-5">
		         <h2 class="ftco-heading-2">Infromation</h2>
		         <ul class="list-unstyled">
		           <li><a href="#" class="py-2 d-block">Online Enquiry</a></li>
		           <li><a href="#" class="py-2 d-block">General Enquiries</a></li>
		           <li><a href="#" class="py-2 d-block">Booking Conditions</a></li>
		           <li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
		           <li><a href="#" class="py-2 d-block">Refund Policy</a></li>
		           <li><a href="#" class="py-2 d-block">Call Us</a></li>
		         </ul>
		       </div>
		     </div>
		     <div class="col-md pt-5 border-left">
		      <div class="ftco-footer-widget pt-md-5 mb-4">
		       <h2 class="ftco-heading-2">Experience</h2>
		       <ul class="list-unstyled">
		         <li><a href="#" class="py-2 d-block">Adventure</a></li>
		         <li><a href="#" class="py-2 d-block">Hotel and Restaurant</a></li>
		         <li><a href="#" class="py-2 d-block">Beach</a></li>
		         <li><a href="#" class="py-2 d-block">Nature</a></li>
		         <li><a href="#" class="py-2 d-block">Camping</a></li>
		         <li><a href="#" class="py-2 d-block">Party</a></li>
		       </ul>
		     </div>
		   </div>
		   <div class="col-md pt-5 border-left">
		     <div class="ftco-footer-widget pt-md-5 mb-4">
		      <h2 class="ftco-heading-2">Have a Questions?</h2>
		      <div class="block-23 mb-3">
		        <ul>
		          <li><span class="icon fa fa-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
		          <li><a href="#"><span class="icon fa fa-phone"></span><span class="text">+2 392 3929 210</span></a></li>
		          <li><a href="#"><span class="icon fa fa-paper-plane"></span><span class="text">info@yourdomain.com</span></a></li>
		        </ul>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="row">
		 <div class="col-md-12 text-center">
		
		   <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		   Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
		   <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
		    </div>
		  </div>
		</div>
	</footer>
 

<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="./resources/js/popper.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/jquery.easing.1.3.js"></script>
<script src="./resources/js/jquery.waypoints.min.js"></script>
<script src="./resources/js/jquery.stellar.min.js"></script>
<script src="./resources/js/owl.carousel.min.js"></script>
<script src="./resources/js/jquery.magnific-popup.min.js"></script>
<script src="./resources/js/jquery.animateNumber.min.js"></script>
<script src="./resources/js/bootstrap-datepicker.js"></script>
<script src="./resources/js/scrollax.min.js"></script>
<script src="./resources/js/comping_index_carousel_js.js"></script>
<script src="./resources/js/main.js"></script>
<script src="./resources/js/camping_index.js"></script>
<script src="./resources/js/review.js"></script>

</body>
</html>
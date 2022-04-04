<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap CSS -->
	<title>Insert title here</title>
	<!-- 페이지 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value="/resources/css/jangec.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
	<script src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
</head>
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
         <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
         <li class="nav-item"><a href="destination.html" class="nav-link">Destination</a></li>
         <li class="nav-item"><a href="hotel.html" class="nav-link">Hotel</a></li>
         <li class="nav-item active"><a href="blog.html" class="nav-link">Blog</a></li>
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

<!-- 수정 -->
<!-- 컨텐츠 -->
<section class="section">
	<div class="container-lg">
		<div class="d-flex justify-content-center">
			<c:choose>
			<c:when test="${board_class eq 'freeBoard' }">
			<div class="mt-5 mb-5 d-flex flex-column">
				<p class="h1 text-center">B&nbsp;O&nbsp;A&nbsp;R&nbsp;D</p>
				<p class="text-center">마음껏&nbsp;즐기다</p>
			</div>
			</c:when>
			<c:otherwise>
			<div class="mt-5 mb-5 d-flex flex-column">
				<p class="h1 text-center">C&nbsp;O&nbsp;N&nbsp;T&nbsp;A&nbsp;C&nbsp;T</p>
				<p class="text-center">고객의&nbsp;소리에&nbsp;귀&nbsp;기울입니다</p>
			</div>
			</c:otherwise>
			</c:choose>
		</div>
		<div class="border-top mb-3 border-dark border-3"></div>
	</div>
	<div class="container-lg">
	    <form id="writeForm">
	    	<div class="row">
	    	<c:choose>
			<c:when test="${board_class eq 'freeBoard' }">
				<div class="input-group mb-3">
					<div class="col-md-1">
						<select id="writeCategory" class="form-select" name="contents_category">
							<option selected value="daily">자유</option>
							<option value="showoff">자랑</option>
							<option value="buy">삽니다</option>
							<option value="sell">팝니다</option>
						</select>
					</div>
					<div class="col-md-11">
						<input type="text" class="form-control col-md-9" aria-label="Text input with dropdown button" name="title" id="title" placeholder="제목을 입력해 주세요">
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="input-group mb-3">
					<div class="col-md-1">
						<select id="writeCategory" class="form-select col-md-3" name="contents_category">
							<c:if test="${manager eq 'admin' }">
								<option selected value="notice">공지사항</option>
							</c:if>
							<option value="askEdit">건의사항</option>
						</select>
					</div>
					<div class="col-md-11">
						<input type="text" class="form-control" aria-label="Text input with dropdown button" name="title" id="title" placeholder="제목을 입력해 주세요" value="writeTestTitle">
					</div>
				</div>
			</c:otherwise>
	    	</c:choose>
	    	</div>
   			<div class="mb-3">
				<label for="writeEditor">내용</label>
				<textarea class="form-control" rows="5" name="contents" id="writeEditor" placeholder="내용을 입력해 주세요" >
					<c:if test="${contents.contents != null }">
						${contents.contents }
					</c:if>
				</textarea>
			</div>	
	    </form>
	</div>
	<div class="container-lg">
		<div class="d-flex justify-content-end">
			<button id="writeSavBtn" class="btn">저장</button>
		</div>
	</div>
</section>
<!-- /컨텐츠 -->	

<!-- 변수 -->
<input type="hidden" id="board_class" value="${board_class }" />
<input type="hidden" id="post_id" value="${post_id }" />
<c:if test="${contents.contents != null }">
<input type="hidden" id="edit" value="true" />
</c:if>

<!-- /수정 -->

<section class="ftco-intro ftco-section ftco-no-pt">
 <div class="container">
  <div class="row justify-content-center">
   <div class="col-md-12 text-center">
    <div class="img"  style="background-image: url(resources/images/bg_2.jpg);">
     <div class="overlay"></div>
     <h2>We Are Pacific A Travel Agency</h2>
     <p>We can manage your dream building A small river named Duden flows by their place</p>
     <p class="mb-0"><a href="#" class="btn btn-primary px-4 py-3">Ask For A Quote</a></p>
   </div>
 </div>
</div>
</div>
</section>

<footer class="ftco-footer bg-bottom ftco-no-pt" style="background-image: url(resources/images/bg_3.jpg);">
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



<!-- loader -->
<%-- <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> --%>

<!-- 페이지 js -->
<script src="<c:url value="/resources/js/jangec.js"/>"></script>
<script src="<c:url value="/resources/js/jangWriteTest.js"/>"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
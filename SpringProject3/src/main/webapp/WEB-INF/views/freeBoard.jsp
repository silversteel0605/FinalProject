<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
  <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>" />
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
  <!-- 페이지 css -->
  <link rel="stylesheet" href="<c:url value="/resources/css/jangec.css"/>"/>
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
<section class="ftco-section">
	<div class="container">
		<!-- Board Nav -->
		<nav class="navbar navbar-expand-lg navbar-light p-0">
		  <div class="container-fluid p-0">
		    <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
			      <form class="d-flex" action="./board" method="POST" accept-charset="EUC-KR">
					<div class="input-group mb-3">
						<select id="inputState" class="form-select col-md-3" name="searchByWhat">
							<option selected value="all">전체</option>
							<option value="title">제목</option>
							<option value="contents">내용</option>
						</select>
						<input type="text" class="form-control" aria-label="Text input with dropdown button" name="searchKeyword">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</div>
			      </form>
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="./board?categoryName=boardAll">전체</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="./board?categoryName=daily">자유</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="./board?categoryName=showoff">자랑</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="./board?categoryName=buy">삽니다</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="./board?categoryName=sell">팝니다</a>
		        </li>
		      </ul>
		    </div>
		   	<a class="btn" href="./write?board_class=freeBoard">글쓰기</a>
		  </div>
		</nav>
		<hr />
		<!-- /Board Nav -->
		<!-- 컨텐츠 -->
		<div class="contents">
			<div class="container">
				<div class="row">
					<c:forEach items="${freeBoardContentsList }" var="boardContents">
					<div class="col-md-6 mb-5">
						<div class="card border-top-0 border-start-0 border-end-0">
							<div class="card-header bg-transparent border-0">
								<c:choose>
								<c:when test="${boardContents.contents_category eq 2 }">
								<small>일상</small>
								</c:when>
								<c:when test="${boardContents.contents_category eq 3 }">
								<small>자랑</small>
								</c:when>
								<c:when test="${boardContents.contents_category eq 4 }">
								<small>삽니다</small>
								</c:when>
								<c:when test="${boardContents.contents_category eq 5 }">
								<small>팝니다</small>
								</c:when>
								</c:choose>
							</div>
							<div class="card-body mb-3 pointer" onClick="mainContents(${boardContents.post_id})">
								<h5 class="card-title">${boardContents.title }</h5>
								<p>${boardContents.contents }</p>
							</div>
							<div class="card-footer mb-1 text-end bg-transparent border-0">
								<span class="userId pointer">${boardContents.member_id }</span><br/>
								<small class="text-muted">${boardContents.reg_date }</small>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>		
		<!-- /컨텐츠 -->
		<!-- Paging -->
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<li><a href="./board?nowPage=1&cntPerPage=${paging.cntPerPage}">&lt;&lt;</a></li>
							<c:choose>
								<c:when test="${paging.startPage != 1}">
									<li><a href="./board?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="./board?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
								</c:otherwise>
							</c:choose>      
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<li class="active"><a href="./board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<li><a href="./board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${paging.endPage != paging.lastPage}">
									<li><a href="./board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="./board?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
								</c:otherwise>
							</c:choose>
						<li><a href="./board?nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}">&gt;&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /paging -->	
		<!-- /페이지 번호 -->
	</div>
</section>

<!-- 스크립트 -->

<!-- Modal & PopUp Menu -->
<div id="popUpMenu" style="display:none;">
	<ul class="list-group list-group-flush">
		<li id="memberPost" class="indiPopUp list-group-item list-group-item-primary opacity-75" style="cursor:pointer">작성글 보기</li>
	</ul>
</div>
	
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
<!-- 페이지 js -->
<script src="<c:url value="/resources/js/jangec.js"/>"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
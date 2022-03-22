<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/width.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/john.css?after"/>"/>
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
         <li class="nav-item active"><a href="destination.html" class="nav-link">Destination</a></li>
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
      <div class="col-md-9 ftco-animate pb-6 text-center">
         <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span> <span>캠핑장 검색 <i class="fa fa-chevron-right"></i></span></p>
         <h1 class="mb-0 bread">캠핑장 검색</h1>
     </div>
 </div>
</div>
</section>

<section class="ftco-section ftco-no-pb ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="ftco-search d-flex justify-content-center">
						<div class="row">
							<div class="col-md-12 nav-link-wrap" id="search-link">
								<div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
									<a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Search Tour</a>

									<a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Hotel</a>

								</div>
							</div>
							<div class="col-md-12 tab-wrap" id="search-tab">
								
								<div class="tab-content" id="v-pills-tabContent">

									<div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
										<form action="./search" class="search-property-1" id="search">
											<div class="row no-gutters">
												<input type="hidden" name="searchTy" value="condition" class="form-control" placeholder="Search place">
												<div class="col-lg d-flex">
													<div class="form-group p-4 border-0">
														<label>지역</label>
														<div class="form-field">
															<div class="icon"><span class="fa fa-map-marker"></span></div>
																<select name="sido" id="sido1"></select>
																<select name="gugun" id="gugun1"></select>
														</div>
													</div>
												</div>
												
												<div class="col-lg d-flex">
													<div class="form-group p-4">
														<label>입지 테마</label>
														<div class="form-field">
															<div class="icon"><span class="fa fa-search"></span></div>
															<select name="locThem" id="locThem">
																<option value="">전체테마</option>
																<option value="해변">해변</option>
																<option value="섬">섬</option>
																<option value="산">산</option>
																<option value="숲">숲</option>
																<option value="계곡">계곡</option>
																<option value="강">강</option>
																<option value="호수">호수</option>
																<option value="도심">도심</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-lg d-flex">
													<div class="form-group p-4">
														<label>키워드</label>	
														<div class="form-field">
															<div class="icon"><span class="fa fa-search"></span></div>
															<input type="text" name="keyword" class="form-control" placeholder="Search place">
														</div>
													</div>
												</div>
												<div class="col-lg d-flex">
													<div class="form-group d-flex w-100 border-0">
														<div class="form-field w-100 align-items-center d-flex">
															<input type="submit" value="Search" class="align-self-stretch form-control btn btn-primary p-0">
															<button type="button" class="align-self-stretch form-control btn btn-primary p-0 rounded" onclick="moreInfoFunc()">
																상세 조건 추가
															</button>
														</div>
													</div>
												</div>
											</div>
										</form>
										<div id="mores" class="col-md-12 bg-light rounded">
											<input type="checkbox" name="facltDivNm" value="지자체" form="search" /> 지자체
											<input type="checkbox" name="facltDivNm" value="국립공원" form="search" /> 국립공원
											<input type="checkbox" name="induty" value="일반야영장" form="search"/> 일반야영장
											<input type="checkbox" name="induty" value="자동차야영장" form="search"/> 자동차야영장
											<input type="checkbox" name="themaEnvrnCl" value="일출명소" form="search"/> 일출명소
											<input type="checkbox" name="themaEnvrnCl" value="일몰명소" form="search"/> 일물명소
											<input type="checkbox" name="sbrsCl" value="전기" form="search"/> 전기
											<input type="checkbox" name="sbrsCl" value="무선인터넷" form="search"/> 무선인터넷
											<input type="submit" value="검색" form="search"/>
										  	<button onclick="moreInfoFunc()">X</button>
										</div>
									</div>

									<div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab">
										<div class="btn_group">
											<ul>
												<li><button type="button" id="1" class="tag btn btn-outline-dark no">#별 보기 좋은</button></li>
												<li><button type="button" id="2" class="tag btn btn-outline-dark no">#친절한</button></li>
												<li><button type="button" id="3" class="tag btn btn-outline-dark no">#바다가 보이는</button></li>
												<li><button type="button" id="4" class="tag btn btn-outline-dark no">#자전거 타기 좋은</button></li>
												<li><button type="button" id="5" class="tag btn btn-outline-dark">#그늘이 많은</button></li>
												<li><button type="button" id="6" class="tag btn btn-outline-dark">#익스트림</button></li>
												<li><button type="button" id="7" class="tag btn btn-outline-dark">#깨끗한</button></li>
												<li><button type="button" id="8" class="tag btn btn-outline-dark">#아이들 놀기 좋은</button></li>
												<li><button type="button" id="9" class="tag btn btn-outline-dark">#생태교육</button></li>
												<li><button type="button" id="10" class="tag btn btn-outline-dark">#커플</button></li>
											</ul>
										</div>
										<button type="button" class="tagSearch btn btn-outline-dark">검색</button>							
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</section>



<section class="ftco-section">
   <div class="container">
    	<div class="row" id="camping_list">
       
		</div>
	</div>
	<div class="row mt-5">
  		<div class="col text-center">
    		<div class="block-27">
      			
			</div>
		</div>
	</div>
</section>



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
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="<c:url value="/resources/js/rest.search.js"/>"></script>
<script>
	function moreInfoFunc() {
	  var mores = document.getElementById("mores");
	  if (mores.style.display === "none" || mores.style.display === "") {
	    mores.style.display = "block";
	  } else {
	    mores.style.display = "none";
	  }
	}
	
	var tags = document.querySelectorAll('.tag ');
	tags.forEach(tag => {
		tag.onclick = () => {
			if (tag.classList.contains('active')) {				
				tag.style.backgroundColor = "#ffffff";
				tag.style.color = "#343a40";
				tag.classList.remove('active');
				
			} else {
				tag.style.backgroundColor = "#343a40";
				tag.style.color = "#ffffff";
				tag.classList.add('active');
			}
		}
	})
	var searchBtn = document.getElementsByClassName('tagSearch')[0];
	console.log(searchBtn);
	searchBtn.onclick = () => {
		let uri = './search2?searchTy=tag';
		tags.forEach(tag => {
			if(tag.classList.contains('active')) {
				let id = tag.id;
				uri += '&tagid=' + id;
			}
		})
		location.href = uri;
	}
	var Url = '/project/rest/search?${tags.uri }&nowPage=${nowPage}';
	var nowPage = ${nowPage};
	$.ajax({
	  url: Url,
	  dataType: "json",
	  type: "GET"
  	}).done(res => {
  		res.forEach((camping) => {
  			makeList(camping);
  		})
	});	
</script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery-chained/1.0.1/jquery.chained.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
<script src="<c:url value="/resources/js/main.js"/>"></script>
<script src="<c:url value="/resources/js/chain.select.js?after"/>"></script>
</body>
</html>
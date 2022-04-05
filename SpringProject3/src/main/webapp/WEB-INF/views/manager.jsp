<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String member_id = (String)session.getAttribute("member_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!--  
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  -->
  <link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/jquery.timepicker.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/jangec.css"/>"/>
</head>
<body>
	<script>
		<c:if test="${member_id ne 'admin'}">
			alert("권한이 없습니다");
			location.href = './about';
		</c:if>
	</script>
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
	<!-- 컨텐츠 -->
	<div class="container">
		<!-- 네비게이션 -->
		<ul class="nav nav-tabs navTabs mb-5">
	      <li class="nav-item">
	        <a class="nav-link active" data-toggle="tab" href="#memberManagement" id="member">회원관리</a>
	      </li>
	      
	      <li class="nav-item">
	        <a class="nav-link" data-toggle="tab" href="#BmemberManagement" id="Bmember">사업자관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-toggle="tab" href="#siteManagement" id="camp">캠핑장관리</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-toggle="tab" href="#supportManagement" id="sup">고객센터</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-toggle="tab" href="#board-tab" id="board">자유게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-toggle="tab" href="#comment-tab" id="comment">댓글</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" data-toggle="tab" href="#review-tab" id="review">리뷰</a>
	      </li>
	    </ul>
	    <!-- /네비게이션 -->
	    <div class="tab-content">
			<!-- 회원관리 -->
		    <div class="tab-pane fade show active" id="memberManagement">
		    	<div class="row">
		    		<div class="col">
		    			<p>회원가입</p>
		    		</div>
				</div>
				<hr />
				<div class="searchMember">
					<div class="d-flex justify-content-between mb-3">
						<p class="">회원검색</p>
						<div class="d-flex flex-row">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="member_search">
							<button class="btn btn-outline-success" id="member_sub">Search</button>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>ID</th>
								<th>이름</th>
								<th>주소</th>
								<th>이메일</th>
							</tr>
						</thead>
						<tbody id="member_body" type="0">
							
						</tbody>
					</table>
				</div>
			</div>
	      	<!-- /회원관리 -->
	      	 <div class="tab-pane fade" id="BmemberManagement">
		    	<div class="row">
		    		<div class="col">
		    			<p>회원가입</p>
		    		</div>
				</div>
				<select id="Bm_selc">
					<option value="">모든 회원보기</option>
					<option value="&permit=0">가입허용 안된 회원만 보기</option>
				</select>
				<hr />
				<div class="searchMember">
					<div class="d-flex justify-content-between mb-3">
						<p class="">회원검색</p>
						<div class="d-flex flex-row">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="Bmember_search">
							<button class="btn btn-outline-success" id="Bmember_sub" >Search</button>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>ID</th>
								<th>이름</th>
								<th>캠핑장</th>
								<th>가입상태</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="Bmember_body" type="1">
							
						</tbody>
					</table>
				</div>
			</div>
	      	<!-- 예약관리
	      	<div class="tab-pane fade" id="reservationManagement">
		      	<div class="reservationManagement">
					<div class="d-flex justify-content-between mb-3">
						<p class="">회원검색</p>
						<form class="d-flex flex-row">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>예약자</th>
								<th>ID</th>
								<th>예약일</th>
								<th>특이사항</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>김덕팔</td>
								<td>abcde</td>
								<td>2022/01/01</td>
								<td>요주의 인물</td>
								<td>
									<button type="button" class="btn btn-link">수정</button>
									<button type="button" class="btn btn-link">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
	      	</div>
	      	 /예약관리 -->
	      	<!-- 캠핑장관리 -->
	      	<div class="tab-pane fade" id="siteManagement">
	      		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				  <li class="nav-item" role="presentation">
				    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">캠핑장검색</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">캠핑장 추가</button>
				  </li>
				</ul>
				<select id="camp_selc">
					<option value="keyword">캠핑장 이름으로 검색</option>
					<option value="contentId">캠핑장 ID로 검색</option>
				</select>
				<div class="tab-content" id="pills-tabContent">
				  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
					<div class="reservationManagement">
						<div class="d-flex justify-content-between mb-3">
							<p class="">캠핑장검색</p>
							
							<div class="d-flex flex-row">
								<input class="form-control me-2" id="camp_search" type="search" placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success" id="camp_submit">Search</button>
							</div>
						</div>
					<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>캠핑장ID</th>
									<th>이름</th>
									<th>등록일</th>
									<th>특이사항</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="camp_body">
								
							</tbody>
						</table>
					</div>
				  </div>
				  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
			      	<form  id="needs-validation" class="row">

					  	<div class="form-group col-md-6">
					      <label for="nameOfSite" class="form-label">캠핑장 이름</label>
					      <input type="text" class="form-control" id="nameOfSite" placeholder="캠핑장 이름" required="" minlength="1">
					      <div class="valid-feedback">
					        Looks good!
					      </div>
					      <div class="invalid-feedback">
					        캠핑장 이름을 기입하세요
					      </div>
					    </div>
			      		<div class="col-md-6">
						    <label for="lineIntro" class="form-label">한줄소개</label>
						    <input type="text" class="form-control" id="lineIntro">
					  	</div>
					  	<div class="col-md-4 mb-3">
							<label for="postNumOfSite" class="form-label">우편번호</label>
					  		<div class="input-group">
							  	<input type="text" class="form-control" id="postNumOfSite" readonly>
							  	<button class="btn btn-outline-secondary" type="button" id="post" onclick="findAdr()">우편번호찾기</button>
							</div>
					  	</div>
					  	<div class="row mb-3">
						  	<div class="form-group col-md-6">
						      <label for="adrOfSite" class="form-label">캠핑장 주소</label>
						      <input type="text" class="form-control" id="addr1" readonly>
						      <div class="valid-feedback">
						        Looks good!
						      </div>
						      <div class="invalid-feedback">
						        캠핑장 주소를 입력해주세요
						      </div>
						    </div>
						  	<div class="col-md-6">
							    <label for="specificAdrOfSite" class="form-label">&nbsp;</label>
							    <input type="text" class="form-control" id="addr2" placeholder="상세주소">
						  	</div>
					  	</div>
					  	<div class="mb-3">
						  <label for="pictureOfSite" class="form-label">첨부파일</label>
						  <input class="form-control form-control-sm" id="pictureOfSite" type="file" multiple>
						</div>
			      	</form>
			      	<button type="button" class="btn btn-dark" id="camp_add">추가</button>
				  </div>
				</div>
	      	</div>	
	      	<!-- 캠핑장관리 -->
      		<!-- 고객지원 -->
	      	<div class="tab-pane fade" id="supportManagement">
		      	<div class="supportManagement row">
					<div class="d-flex justify-content-between mb-3">
						<p class="">문의사항</p>
						<select class="decl_selc" name="sup">
							<option value="">기본순으로 보기</option>
							<option value="&order=decl">신고순으로 보기</option>
						</select>	
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>게시글ID</th>
								<th>작성자ID</th>
								<th>제목</th>
								<th>등록일</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="sup_body">
						</tbody>
					</table>
				</div>
	      	</div>
	      	<!-- /고객지원 -->
	      	<!-- 자유 게시판 -->
	      	<div class="tab-pane fade" id="board-tab">
		      	<div class="board row">
					<div class="d-flex justify-content-between mb-3">
						<p class="">자유게시판</p>
						<select class="decl_selc" name="board">
							<option value="">기본순으로 보기</option>
							<option value="&order=decl">신고순으로 보기</option>
						</select>	
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>게시글ID</th>
								<th>작성자ID</th>
								<th>제목</th>
								<th>등록일</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="board_body">
						</tbody>
					</table>
				</div>
	      	</div>
	      	<!-- /자유 게시판 -->
	      	<!-- 댓글 -->
	      	<div class="tab-pane fade" id="comment-tab">
		      	<div class="comment row">
					<div class="d-flex justify-content-between mb-3">
						<p class="">댓글</p>
						<select class="decl_selc" name="comment">
							<option value="">기본순으로 보기</option>
							<option value="&order=decl">신고순으로 보기</option>
						</select>	
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>게시글ID</th>
								<th>등록자ID</th>
								<th>댓글</th>
								<th>신고수</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="comment_body">
						</tbody>
					</table>
				</div>
	      	</div>
	      	<!-- /댓글 -->
	      	<!-- 리뷰 -->
	      	<div class="tab-pane fade" id="review-tab">
		      	<div class="review row">
					<div class="d-flex justify-content-between mb-3">
						<p class="">리뷰</p>
						<select class="decl_selc" name="review">
							<option value="">기본순으로 보기</option>
							<option value="&order=decl">신고순으로 보기</option>
						</select>	
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>리뷰ID</th>
								<th>제목</th>
								<th>리뷰</th>
								<th>등록일</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="review_body">
						</tbody>
					</table>
				</div>
	      	</div>
	      	<!-- /리뷰 -->
	    </div>
	<!-- /컨텐츠 -->
</div>
<div class="row mt-5">
  <div class="col text-center">
    <div class="block-27">
      <ul id="paging"> 	
		
      </ul>
</div>
</div>
</div>
</section>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<p>너네는 돈받고 일은 안하니?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
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
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
<!-- <script src="<c:url value="/resources/js/popper.min.js"/>"></script>-->
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="<c:url value="/resources/js/jangManager.js?after"/>"></script>
<script src="<c:url value="/resources/js/manager.set.data.js?after"/>"></script>
<script src="<c:url value="/resources/js/pagination.js?after"/>"></script>
<script src="<c:url value="/resources/js/set.post.js?after"/>"></script>
<script src="<c:url value="/resources/js/contextpath.js?after"/>"></script>
<script src="<c:url value="/resources/js/manager.rest.js?after"/>"></script>

<!-- 주소검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html></html>
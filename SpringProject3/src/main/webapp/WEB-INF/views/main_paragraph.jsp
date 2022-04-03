<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Camping</title>
<!-- 페이지 CSS-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/resources/css/jangec.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/jang_main_paragraph.css"/>"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
		<!-- 컨텐츠 -->
		<div class="contents">
			<p class="fs-3">${contents.title }</p>
			<div class="paragraph_header d-flex justify-content-between">
				<span id="${contents.member_id }" class="userId pointer">${contents.member_id }</span>
				<div>
					<span id="report"></span>
					<span>${contents.reg_date }|</span>
					<span>조회수&nbsp;${contents.views }</span>
				</div>
			</div> <hr/>
			<div class="paragraph_body">
				<p>${contents.contents }</p>
			</div>
			<div class="paragraph_comments">
				<div class="comments_header">
					<p>COMMENTS</p>
				</div> <hr />
				<div class="comments_body mb-5" id="comments_body">
					<c:if test="${not empty commentsList }">
						<c:forEach items="${commentsList }" var="comment">
						<div id="${comment.comment_id }" class="mb-3 border-bottom">
							<span class="userId">${comment.member_id}</span><br/>
							<div class="d-flex justify-content-start">
								<p>${comment.comments}</p>
								<i id="comment_deleteBtn_${comment.comment_id}" class="bi bi-x-circle comment_icon"></i>
								<i id="comment_editBtn" class="bi bi-pen comment_icon"></i>
								<i id="co_comment_newBtn_${comment.comment_id}" class="bi bi-chat-dots comment_icon co_comment_newBtn"></i>
								<input id="comment_commentId_${comment.comment_id }" type="hidden" value="${comment.comment_id }" />
								<input id="comment_postId" type="hidden" value="${comment.post_id }" />
								<input id="comment_ordernum" type="hidden" value="${comment.ordernum }" />
								<input id="comment_categoryId" type="hidden" value="${comment.category_id }" />
							</div>
						</div>
						</c:forEach>
					</c:if>
				</div>
				<!-- comments 입력 -->
				<div id="comment">
					<div class="form-floating">
					  <input type="hidden" class="commentForm" name="commentPostId" value="${contents.post_id }"/>
					  <input type="hidden" class="commentForm" name="commentBoardClass" value="${contents.board_class }"/>
					  <textarea class="form-control commentForm" placeholder="Leave a comment here" name="commentComments" id="commentTextarea"></textarea>
					  <label for="commentTextarea">Comments</label>
					</div>
					<div class="d-flex justify-content-end">
						<button id="comment_saveBtn" class="btn btn-outline-success" type="button">저장</button>
					</div>
				</div>
				<!-- /comments 입력 -->
			</div> <hr/>
			<div class="paragraph_footer d-flex justify-content-between mb-5">
				<div>
					<button id="reportBtn" class="btn">신고</button>
				</div>
				<div>
					<c:if test="${editAuth eq true }">
						<button id="contentsEdit" class="btn">수정</button>
						<button id="contentsDelete" class="btn">삭제</button>
					</c:if>
					<input id="editAuth" type="hidden" value="${editAuth }" />
					<button id="goBoard" class="btn" onClick="goBoard(${contents.board_class })">목록</button>
				</div>
			</div>
		</div>		
		<!-- /컨텐츠 -->
	</div>
</section>
<!-- 변수 -->
<input type="hidden" id="board_class" value="${contents.board_class }" />
<input type="hidden" id="post_id" value="${contents.post_id }" />
<input type="hidden" id="commentsEA" value="${commentsEA }" />
<input type="hidden" id="reportNum" value="${reportNum }"/>

<!-- Modal -->
<div id="popUpMenu" style="display:none;">
	<ul class="list-group list-group-flush">
		<li id="memberPost" class="indiPopUp list-group-item list-group-item-primary opacity-75" style="cursor:pointer"
		role="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">작성글 보기</li>
	</ul>
</div>

<div class="modal fade" id="staticBackdrop" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div id="individual" class="modal-body">
      </div>
      <div class="modal-footer">
        <button id="modalBtn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- /Modal -->
	
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
<!-- 개인 JS -->
<script src="<c:url value="/resources/js/jang_main_paragraph.js"/>"></script>
<script src="<c:url value="/resources/js/jangec.js"/>"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
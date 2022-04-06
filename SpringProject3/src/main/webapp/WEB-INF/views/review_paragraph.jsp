<%@page import="com.spring.project.review.DTO.CampingReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="<c:url value="/resources/css/template.css?after"/>" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=77mbzylhqr"></link>

  	<link rel="stylesheet" href="<c:url value="/resources/css/jangec.css"/>"/>
  	<link rel="stylesheet" href="<c:url value="/resources/css/review.css"/>"/>
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="<c:url value="/resources/js/review.js"/>" charset="UTF-8"></script>
	
	<!-- header css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/renewal_nav.css"/>"/>
    <!--다크모드 관련 css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
</head>
<body>
		
<header>
	<jsp:include page='renewal_nav.jsp'/>
</header>

<section class="wrap">
	<div class="container-lg bb mb-5">
	<div class="sub_title">
		<div class="tit mb-2">페이지 타이틀</div>
		<div class="txt">부제</div>
	</div>
</div>
</section>

<div class="container-lg lbb">
	<% CampingReviewDTO info = (CampingReviewDTO)request.getAttribute("r_dto"); %>
	<section class="ftco-section">
	<div class="container">
		<!-- 컨텐츠 -->
		<div class="contents">
			<p class="fs-3"><%= info.getTitle() %></p>
			<div class="paragraph_header d-flex justify-content-between">
				<span id="id" data-bs-toggle="modal" data-bs-target="#memberDescription"><%= info.getMember_id() %></span>
				<span><%= info.getUp_date() %></span>
			</div> <hr/>
			<div class="paragraph_body">
				<p>
					<%= info.getReview() %>
				</p>
			</div>
			<div class="paragraph_comments">
				<div class="comments_header">
					<div>
						<span class="padding_left_10px" data-bs-toggle="modal" data-bs-target="#memberDescription">조회수 : <%=info.getViews()  %></span>
						<span class="padding_left_10px">평점 : <%= info.getStarRanking() %> </span>
						<span class="padding_left_10px">추천 : 0 </span>
						<span class="padding_left_10px">신고 : <%= info.getDecl() %> </span>
					</div>
				</div> 
				<div class="comments_footer"></div>
			</div> <hr />
			<div class="paragraph_footer d-flex justify-content-end">
				<button class="btn"><a href="/project/review?type=1&reviewId=<%= info.getReview_id() %>&contentId=<%=info.getContentId() %>">수정</a></button>
				<button id="reivewDelete" class="btn" onclick="showPopUp('<%= info.getReview_id() %>','<%=info.getContentId() %>')">삭제</button>
				<button class="btn" onclick="listGo('<%= info.getReview_id() %>','<%=info.getContentId() %>')">목록</button>
			</div>
		</div>		
		<!-- /컨텐츠 -->
	</div>
</section>
</div>

<footer>
	<div class="container-fluid">
	  <div class="row row-cols-5 py-5 my-5 border-top">
	    <div class="col">
	      <a href="/" class="d-flex align-items-center mb-3 link-dark text-decoration-none">
	        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
	      </a>
	      <p class="text-muted"> 2021</p>
	    </div>
	
	    <div class="col">
	
	    </div>
	
	    <div class="col">
	      <h5>Section</h5>
	      <ul class="nav flex-column">
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
	      </ul>
	    </div>
	
	    <div class="col">
	      <h5>Section</h5>
	      <ul class="nav flex-column">
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
	      </ul>
	    </div>
	
	    <div class="col">
	      <h5>Section</h5>
	      <ul class="nav flex-column">
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
	        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
	      </ul>
	    </div>
	  </div>
	</div>
</footer>



<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value="/resources/js/jangec.js"/>"></script>
<!-- 다크모드 js-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="<c:url value="/resources/js/darkmode.js"/>"></script>
</body>
</html>
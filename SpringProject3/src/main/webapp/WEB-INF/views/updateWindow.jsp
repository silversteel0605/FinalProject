<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>update</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/jangec.css"/>"/>
</head>
<body>
<section class="ftco-section">
	<div class="container">
	 <div class="tab-pane fade show active" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
      	<form action="" class="row">
      		<input type="text" value=${info.contentId } id="contentId"/>
		    <div class="col-6">
			    <label for="nameOfSite" class="form-label">캠핑장 이름</label>
			    <input type="text" class="form-control" id="nameOfSite" value=${info.facltNm }>
		  	</div>
      		<div class="col-6">
			    <label for="lineIntro" class="form-label">한줄소개</label>
			    <input type="text" class="form-control" id="lineIntro" value=${info.lineIntro }>
		  	</div>
		  	<div class="col-4 mb-3">
				<label for="postNumOfSite" class="form-label">우편번호</label>
		  		<div class="input-group">
				  	<input type="text" class="form-control" id="post" readonly>
				  	<button class="btn btn-outline-secondary" type="button" id="findAdrr" onclick="findAdr()">우편번호찾기</button>
				</div>
		  	</div>
		  	<div class="row mb-3">
			  	<div class="col-md-6">
				    <label for="adrOfSite" class="form-label">캠핑장 주소</label>
				    <input type="text" class="form-control" id="addr1" readonly">
			  	</div>
			  	<div class="col-6">
				    <label for="specificAdrOfSite" class="form-label">&nbsp;</label>
				    <input type="text" class="form-control" id="addr2" placeholder="상세주소">
			  	</div>
		  	</div>
		  	<div class="mb-3">
			  <label for="pictureOfSite" class="form-label">첨부파일</label>
			  <input class="form-control form-control-sm" id="pictureOfSite" type="file" multiple>
			</div>
      	</form>
      	<button type="button" class="btn btn-primary" id="camp_update">수정</button>
	  </div>
  </div>
 </section>
 <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
<script src="<c:url value="/reso s/js/bootstrap.min.js"/>"></script>
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
<script src="<c:url value="/resources/js/contextpath.js?after"/>"></script>
<script src="<c:url value="/resources/js/set.post.js?after"/>"></script>
<script src="<c:url value="/resources/js/manager.set.data.js?after"/>"></script>
<script src="<c:url value="/resources/js/manager.rest.update.js?after"/>"></script>

<!-- 주소검색 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
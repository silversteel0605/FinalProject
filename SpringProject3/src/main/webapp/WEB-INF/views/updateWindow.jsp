<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>update</title>

  <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<section class="wrap">
	<div class="container-lg">
	 <form class="row">		
	<input type="hidden" id="contentId" value="${contentId }"></input>
							    <div class="col-md-6">
								    <label for="nameOfSite" class="form-label">캠핑장 이름</label>
								    <input type="text" class="form-control" id="nameOfSite" value=${info.facltNm }>
							  	</div>
					      		<div class="col-md-6">
								    <label for="lineIntro" class="form-label">한줄소개</label>
								    <input type="text" class="form-control" id="lineIntro" value=${info.lineIntro }>
							  	</div>
							  	<div class="col-md-4 mb-3">
									<label for="postNumOfSite" class="form-label">우편번호</label>
							  		<div class="input-group">
									  	<input type="text" class="form-control" id="post" readonly>
									  	<button class="btn btn-outline-secondary" type="button" id="findAdrr" onclick="findAdr()">우편번호찾기</button>
									</div>
							  	</div>
							  	
							  	<div class="row p-0 mb-3 m-0">
								  	<div class="col-md-6">
									    <label for="adrOfSite" class="form-label">캠핑장 주소</label>
									    <input type="text" class="form-control" id="addr1" readonly">
								  	</div>
								  	<div class="col-md-6">
									    <label for="specificAdrOfSite" class="form-label">&nbsp;</label>
									    <input type="text" class="form-control" id="addr2" placeholder="상세주소">
								  	</div>
							  	</div>
							  	<div class="col-md-6 mb-3">
								  <label for="pictureOfSite" class="form-label">첨부파일</label>
								  <input class="form-control form-control-sm" id="pictureOfSite" type="file" multiple>
								</div>
				      		</form>
				      	<button type="button" class="btn btn-dark" id="camp_update">추가</button>
  </div>
 </section>
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
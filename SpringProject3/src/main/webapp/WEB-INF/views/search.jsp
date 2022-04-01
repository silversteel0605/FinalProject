<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="EUC-KR">
<title>Insert title here</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		.camp_index {	
			height: 100%;
			display: flex;
		}
		.image-box {
			height: 50%;
			overflow: hidden;
			maring: 0 auto;
		}
		.text {
			height: 50%;
		}
		.image-thumbnail {
			width: 100%;
			height: 100%;
			object-fit: cover;
		}
		
		a {
			color: black;
			text-decoration: none;
		}
		li {
			list-style: none;
		}
		
	</style>
</head>
<body>
	<script>
		const sido = '${search.sido}';
		const gugun = '${search.gugun}';
		const them = '${search.locThem}';
	</script>


		<div>
    	<select id="order">
		  <option value="default">기본순으로 보기</option>
		  <option value="views">조회순으로 보기</option>
		</select>
		</div>
<div class="container-lg">
 
    <div class="row">
     <c:forEach var="list" items="${lists }">
		<div class="col-md-6 p-3">
		  <div class="camp_index">
		  	<div class="image-box">
				<img  class="image-thumbnail" src="${list.firstImageUrl }">
			</div> 
		    <div class="text">
		        <h3><a href="./CampInfo?contentId=${list.contentId }">${list.facltNm }</a></h3>
		        <p>${list.lineIntro }</p>
		        <p class="location"><span class="fa fa-map-marker"></span> ${list.addr1 }</p>
		        <ul>
		           <li><span>조회수</span>${list.views }</li>
		           <li><span class="flaticon-king-size"></span>3</li>
		           <li><span class="flaticon-sun-umbrella"></span>Near Beach</li>
		       </ul>
		   	</div>
		  </div>
		</div>
	</c:forEach>  
</div>
</div>
<div class="row">
  <div class="col-12">
      <ul class="pagination"> 	
		<li class="page-item"><a class="page-link" href="./search?nowPage=1&cntPerPage=${paging.cntPerPage}${search.uri}" class="page-link">&lt;&lt;</a></li>
		<c:choose>
		<c:when test="${paging.startPage != 1}">
			<li class="page-item"><a class="page-link" href="./search?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}${search.uri}">&lt;</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item"><a class="page-link" href="./search?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&lt;</a></li>
		</c:otherwise>
		</c:choose>      
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<li class="page-item active"><a class="page-link" href="./search?nowPage=${p }&cntPerPage=${paging.cntPerPage}${search.uri}">${p }</a></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<li class="page-item"><a class="page-link" href="./search?nowPage=${p }&cntPerPage=${paging.cntPerPage}${search.uri}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${paging.endPage != paging.lastPage}">
				<li class="page-item"><a class="page-link" href="./search?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="./search?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;</a></li>
			</c:otherwise>
		</c:choose>
		<li class="page-item"><a class="page-link" href="./search?nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;&gt;</a></li>
      </ul>
	</div>
</div>





<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value="/resources/js/main.js"/>"></script>
<script src="<c:url value="/resources/js/chain.select.js?after"/>"></script>
<script src="<c:url value="/resources/js/search.event.listener.js"/>"></script>
<script>
	function keepCondition() {
		$('input[name=keyword]').val('${search.keyword}');
		$('#locThem').val('${search.locThem}').prop('selected', true);
		const facltDivNm = new Array();
		<c:forEach var="i" items="${search.facltDivNm}">
			$('input[value=${i }]').prop('checked', true);
		</c:forEach>
		<c:forEach var="i" items="${search.themaEnvrnCl}">
			$('input[value=${i }]').prop('checked', true);
		</c:forEach>
		<c:forEach var="i" items="${search.sbrsCl}">
			$('input[value=${i }]').prop('checked', true);
		</c:forEach>
		<c:forEach var="i" items="${search.induty}">
			$('input[value=${i }]').prop('checked', true);
		</c:forEach>
		<c:forEach var="i" items="${search.tagId}">
			$('#${i}').css('background-color', '#343a40');
			$('#${i}').css('color', '#ffffff');
			$('#${i}').addClass('active');
		</c:forEach>
		
	}
	keepCondition();
</script>
</body>
</html>
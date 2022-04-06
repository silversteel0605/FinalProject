<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>FreeBoard</title>
	<!-- header css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/renewal_nav.css"/>"/>
	<!--다크모드 관련 css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
    <!-- 모달 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>"/>
	<!-- 페이지 css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/jangec.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/jangDarkMode.css"/>"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body style="overflow-x: hidden">
<!-- header 호출 -->
<jsp:include page='renewal_nav.jsp'/>
<jsp:include page='header_ani.jsp'/>
<!-- /Header -->
<!-- Contents -->
<section class="section" id ="contants" style="padding-top: 76px">
	<!-- Board Nav -->
	<div class="container-lg">
		<div class="d-flex justify-content-center navTop">
			<div class="mt-5 mb-5 d-flex flex-column">
				<p class="h1 text-center">B&nbsp;O&nbsp;A&nbsp;R&nbsp;D</p>
				<p class="text-center">마음껏&nbsp;즐기다</p>
			</div>
		</div>
		<div class="border-top mb-3 border-dark border-3 seperator"></div>
		<div class="row navMiddle">
			<div class="col-md-5 d-flex align-items-end">
				<form class="d-flex flex-fill" action="./board" method="POST" accept-charset="EUC-KR">
					<div class="input-group input-group-sm mb-3">
						<select id="inputState" class="form-select form-select-sm col-md-3" name="searchByWhat">
							<option selected value="all">전체</option>
							<option value="title">제목</option>
							<option value="contents">내용</option>
						</select>
						<input type="text" class="form-control-sm border-light col-md-7" aria-label="Text input with dropdown button" name="searchKeyword">
						<button class="btn btn-outline-secondary btn-sm col-md-2" type="submit">Search</button>
					</div>
				</form>
			</div>
			<div class="col-md-5 offset-md-2 d-flex align-items-end navCategory mb-2">
				<div class="row flex-fill">
					<div class="col-md">
						<div class="d-flex justify-content-end">
					        <a class="ms-3 align-self-bottom" href="./board?categoryName=boardAll">전체</a>
					        <a class="ms-3" href="./board?categoryName=daily">일상</a>
					        <a class="ms-3" href="./board?categoryName=showoff">자랑</a>
					        <a class="ms-3" href="./board?categoryName=buy">삽니다</a>
					        <a class="ms-3" href="./board?categoryName=sell">팝니다</a>
						</div>
					</div>
				    <c:if test="${not empty member_id }">
					<div class="col-md-3 d-flex justify-content-end">
					 	<a class="" href="./write?board_class=freeBoard">글쓰기</a>
					</div>
				    </c:if>
				</div>
			</div>
		</div>
	<div class="border-top mb-3 border-dark border-1 seperator"></div>
	</div>
	<!-- /Board Nav -->
	<!-- Table -->
	<div class="container-lg">
		<div class="row">
			<c:forEach items="${freeBoardContentsList }" var="boardContents">
			<div class="col-md-6 mb-5">
				<div class="card border-top-0 border-start-0 border-end-0">
					<div class="card-header p-0 bg-transparent border-0 d-flex justify-content-between mb-1">
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
						<small class="text-muted">조회수&nbsp;${boardContents.views }</small>
					</div>
					<div class="card-body mb-3 pointer p-0" onClick="mainContents(${boardContents.post_id})">
						<h5 class="card-title mb-3">${boardContents.title }</h5>
						<p>${boardContents.contents }</p>
					</div>
					<div class="card-footer mb-1 text-end bg-transparent border-0">
						<span id="${boardContents.member_id }" class="userId pointer">${boardContents.member_id }</span><br/>
						<small class="text-muted">${boardContents.reg_date }</small>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- /Table -->
	<!-- Paging -->
	<div class="container-lg">
		<div class="row mt-5">
			<div class="col d-flex justify-content-center">
				<div class="block-27">
					<ul class="pagination">
						<li class="page-item"><a class="page-link text-dark" href="./board?nowPage=1&cntPerPage=${paging.cntPerPage}">&lt;&lt;</a></li>
							<c:choose>
								<c:when test="${paging.startPage != 1}">
									<li class="page-item"><a class="page-link text-dark" href="./board?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link text-dark" href="./board?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
								</c:otherwise>
							</c:choose>      
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<li class="page-item active"><a class="page-link text-dark" href="./board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<li class="page-item"><a class="page-link text-dark" href="./board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${paging.endPage != paging.lastPage}">
									<li class="page-item"><a class="page-link text-dark" href="./board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link text-dark" href="./board?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
								</c:otherwise>
							</c:choose>
						<li class="page-item"><a class="page-link text-dark" href="./board?nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}">&gt;&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- /Paging -->	
</section>
<!-- /Contents -->
<!-- 변수 -->
<input type="hidden" id="board_class" value="${board_class }" />

<!-- Modal & PopUp Menu -->
<div id="popUpMenu" style="display:none;" class="">
	<ul class="list-group list-group-flush">
		<li id="memberPost" class="indiPopUp list-group-item opacity-75" style="cursor:pointer"
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
			<div id="individual" class="modal-body"></div>
			<div class="modal-footer">
				<button id="modalBtn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Footer -->
<!-- /Footer -->
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 다크모드 js-->
<script src="<c:url value="/resources/js/main_ani.js"/>"></script>
<script src="<c:url value="/resources/js/anime.min.js"/>"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="<c:url value="/resources/js/darkmode.js"/>"></script>
<!-- 모달 JS -->
<script src="<c:url value="/resources/js/modal.js"/>"></script>
<!-- 페이지 js -->
<script src="<c:url value="/resources/js/jangec.js"/>"></script>
<script src="<c:url value="/resources/js/jangDarkMode.js"/>"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>
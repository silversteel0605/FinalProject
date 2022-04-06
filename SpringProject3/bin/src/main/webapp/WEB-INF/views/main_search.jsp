<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>"/>
	<!-- header css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/renewal_nav.css"/>"/>
    <!--다크모드 관련 css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
    <!-- 모달 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>"/>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   <style type="text/css">
   		body {
   			overflow-x: hidden;
   		}
   		
   		section {
   			padding-top: 76px;
   		}
   
		.camp_index {	
			width: 100%;
			display: flex;
			position: relative;
		}
		.image-box {
			width: 70%;
			height: 80%;
			overflow: hidden;
			maring: 0 auto;
			position: absolute;
			right: 0;
			bottom: 0;
		}
		.text {
			width: 30%;
			height: 100%;
			padding-right: 30px;
			position: relative;
			
		}
		
		.text > h3 {
			  white-space: nowrap;
		}
		
		.sub-info {
			position: absolute;
			bottom: 0;
		}
		
		
		.image-thumbnail {
			width: 100%;
			height: 100%;
			object-fit: cover;
		}
		
		@media screen and (max-width: 767px){ 
			.camp_index {
				flex-direction: column;
			} 
			.image-box {
				width: 100%;
				overflow: hidden;
				maring: 0 auto;
				position: relative;
			}
			.text {
				width: 100%;
			}
			
			.text > * {
				margin: 0;
			}
			
			.sub-info {
				position: relative;
			}
		}
   </style>

</head>
<body>

	<script>
		const sido = '${search.sido}';
		const gugun = '${search.gugun}';
		const them = '${search.locThem}';
	</script>
	
<header>
	<jsp:include page='renewal_nav.jsp'/>
	<div id="main_ani">
		<h2 id=main_text><span>Let's go</span><br>Camping</h2>
		<img src="resources/images/moon.png" id="moon">
		<img src="resources/images/bird1.png" id="bird1">
		<img src="resources/images/bird2.png" id="bird2">
		<img src="resources/images/forest.png" id="forest">
		<img src="resources/images/rocks.png" id="rocks">
		<img src="resources/images/water.png" id="water">
	</div>
</header>



<section class="wrap">
	<div class="container-lg bb mb-5">
		<div class="sub_title">
			<div class="tit mb-2">FIND YOUR CAMPING</div>
			<div class="txt">머무는 것 자체로 여행이 되는 공간</div>
		</div>
	</div>

	<div class="container-lg bb">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="condition-tab" data-bs-toggle="tab" data-bs-target="#condition" type="button" role="tab" aria-controls="condition" aria-selected="true">조건검색</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="tag-tab" data-bs-toggle="tab" data-bs-target="#tag" type="button" role="tab" aria-controls="tag" aria-selected="false">태그검색</button>
			  </li>
			</ul>
			
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="condition" role="tabpanel" aria-labelledby="condition-tab">
			  <form name="condition" class="camping-form">
			  	<input type="hidden" name="searchTy" value="condition" />
				<div class="row g-2 pt-5">
					<div class="col-md">
				    <div class="form-floating">
				      <select class="form-select" id="floatingSelectGrid" aria-label="Floating label select example" name="sido" >
				      </select>
				      <label for="floatingSelectGrid">시/도를 선택하세요</label>
				    </div>
				  </div>
				  <div class="col-md">
				    <div class="form-floating">
				      <select class="form-select" id="floatingSelectGrid" aria-label="Floating label select example" name="gugun">
				      </select>
				      <label for="floatingSelectGrid">구/군을 선택하세요</label>
				    </div>
				  </div>
				</div>
				<div class="row g-2 pt-3">
			  	  <div class="col-md minus-left">
				    <div class="form-floating">
				      <select class="form-select" id="locThem" aria-label="Floating label select example" name="locThem">
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
				      <label for="floatingSelectGrid">지역테마를 선택하세요</label>
				    </div>
				  </div>				  			
				  <div class="col-md" id="more">
				    <div class="form-floating">
				      <div class="form-select" aria-label="Floating select example" >
				  
						</div>
				      <label for="floatingSelectGrid">상세조건을 선택하세요</label>
				    </div>
				  </div>
				  <div class="col-md">
				    <div class="form-floating">
				      <input type="text" class="form-control" id="floatingInputGrid" placeholder="캠핑장 키워드" name="keyword">
				      <label for="floatingInputGrid">캠핑장 키워드</label>
				    </div>
				  </div>
				</div>
				<div class="row more-row">
					<div class="col-md-4 more-col">
						<div class="moreThem p-3">
							<div class="more-close mb-2">								
								<button type="button" class="btn-close" aria-label="Close" id="m-close"></button>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="지자체" id="flexCheckDefault"  name="facltDivNm">
							  <label class="form-check-label" for="flexCheckDefault">
							    지자체
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="국립공원" id="flexCheckDefault"  name="facltDivNm">
							  <label class="form-check-label" for="flexCheckDefault">
							    국립공원
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="일반야영장" id="flexCheckDefault"  name="induty">
							  <label class="form-check-label" for="flexCheckDefault">
							    일반야영장
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="자동차야영장" id="flexCheckDefault"  name="induty">
							  <label class="form-check-label" for="flexCheckDefault">
							    자동차야영장
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="일몰명소" id="flexCheckDefault"  name="themaEnvrnCl">
							  <label class="form-check-label" for="flexCheckDefault">
							    일몰명소
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="일출명소" id="flexCheckDefault"  name="themaEnvrnCl">
							  <label class="form-check-label" for="flexCheckDefault">
							    일출명소
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="전기" id="flexCheckDefault"  name="sbrsCl">
							  <label class="form-check-label" for="flexCheckDefault">
							    전기
							  </label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="무선인터넷" id="flexCheckDefault"  name="sbrsCl">
							  <label class="form-check-label" for="flexCheckDefault">
							    무선인터넷
							  </label>
							</div>		
							<div class="more-sub mt-4">						
								<button type="button" class="btn btn-dark" id="apply">적용하기</button>	
							</div>
						</div>
					</div>
				</div>
			  </form>
		  </div>
			  
			  <div class="tab-pane fade" id="tag" role="tabpanel" aria-labelledby="tag">
				<form action="">
					<div class="tag_title pt-5">
						<div class="tit">#태그로 검색하기</div>
					</div>
				
					<div id="tags" class="pt-5">
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="1">#애견동반</button>
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="2">#수영장</button>
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="3">#산</button>
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="4">#커플</button>
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="5">#경치가 좋은</button>
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="6">#사이트 간격이 넓은</button>
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="7">#봄</button>
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="8">#바닷가</button>
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="9">#산책길</button>
						<button type="button" class="btn btn-outline-dark mt-3 tag" id="10">#친절한</button>
					</div>
				</form>			  	
			  </div>
			  <div class="submitBtn mb-5">			  
				  <button type="button" class="btn btn-dark mt-5 mb-5" id="submit">검색하기</button>
			  </div>
			</div>
		</div>

	<div class="container-lg lbb">
	    <div class="row">
	     <c:forEach var="list" items="${lists }">
			<div class="camp col-md-6">
			  <div class="camp_index">
			  	
			    <div class="text">
			        <h3><a href="./CampInfo?contentId=${list.contentId }">${list.facltNm }</a></h3>
			        <div class="sub-info">
				        <p class="mb-0">${list.doNm }/${list.sigunguNm }</p>
				        <p class="mb-0 lct">	
					        <c:forTokens var="lct" items="${list.lctCl }" delims="," varStatus="status">
					        	<c:choose>
					        		<c:when test="${status.last }">
					        			${lct } 
					        		</c:when>
					        		<c:otherwise>
					        			${lct } |
					        		</c:otherwise>
					        	</c:choose>
					        </c:forTokens>
					        <c:if test="${empty list.lctCl }">
					        	<br />
					        </c:if>
				        </p>        
			        </div>
			      
			   	</div>
			   	<div class="image-box">
					<img  class="image-thumbnail" src="${list.firstImageUrl }">
				</div> 
			  </div>
			</div>
		  </c:forEach>  
		</div>
	</div>
		

	<div class="container-lg">
		<div class="row">
		  <div class="col-12">
		      <ul class="pagination"> 	
				<li class="page-item"><a class="page-link  arrow" href="./search?nowPage=1&cntPerPage=${paging.cntPerPage}${search.uri}" class="page-link">&lt;&lt;</a></li>
				<c:choose>
				<c:when test="${paging.startPage != 1}">
					<li class="page-item" ><a class="page-link  arrow" href="./search?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}${search.uri}">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link arrow" href="./search?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&lt;</a></li>
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
						<li class="page-item"><a class="page-link  arrow" href="./search?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link arrow" href="./search?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;</a></li>
					</c:otherwise>
				</c:choose>
				<li class="page-item "><a class="page-link arrow" href="./search?nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;&gt;</a></li>
		      </ul>
			</div>
		</div>
	</div>
</section>




<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(function() {
		setHeight();
		setMoreText();
		$(window).resize(function() {
			if($('div.more-col').css('visibility') === 'visible') {				
				showMoreThem();
			}
			setHeight();
		})
		$('#more').click(function() {
			setMoreThem();
		})
		$('#apply').click(function() {
			offMoreThem();
			setMoreText();
		})
		$('#m-close').click(function() {
			resetMoreThem();
			offMoreThem();
		})
	})
	
	function setHeight() {
		const width = $('div.camp_index').width();
		if($(window).width() < 751) {	
			$('div.camp_index').css('height', '');			
			$('div.image-box').css('height', Math.ceil(width * 0.5));	
		
			$('div.camp.col-md-6').removeClass('p-5');
			$('div.camp.col-md-6').addClass('p-3');
			$('#tag').css('height', '');
			$('p.lct').addClass('mb-3');
			console.log($('.minus-left').parent());
			$('.minus-left').parent().removeClass('pt-3');
			$('.minus-left').parent().addClass('mt-0');
		} else {
			$('div.camp_index').css('height', Math.ceil(width * 0.5));			
			$('div.image-box').css('height', '80%');	
			$('div.camp.col-md-6').removeClass('p-3');
			$('div.camp.col-md-6').addClass('p-5');
			$('p.lct').removeClass('mb-3');
			$('#tag').css('height', $('#condition').height())
			$('.minus-left').parent().addClass('pt-3');
			$('.minus-left').parent().removeClass('mt-0');
		}
	}
	
	function setMoreThem() {
		if($('div.more-col').css('visibility') === 'hidden') {
			showMoreThem()
		} else {			
			resetMoreThem();
			offMoreThem();
		}
	}
	
	function showMoreThem() {
		let left = $('#more').offset().left;
		let minusLeft = $('div.minus-left').offset().left;
		$('div.more-col').css('visibility', 'visible');
		$('div.more-col').css('opacity', '1');
		$('div.more-col').css('left', left - minusLeft);
	}
	
	function offMoreThem() {
		$('div.more-col').css('visibility', 'hidden');
		$('div.more-col').css('visibility', '0');
	}
	
	function resetMoreThem() {
		$('div.moreThem').children('div.form-check').children().prop('checked', false);
	}
	
	function setMoreText() {
		const checked = $('div.moreThem').children('div.form-check').children('input:checked');
		var text = '';
		checked.each(function (i,chk) {
			text += $(chk).val();
			if(i < checked.length - 1) {
				text += ',';
			}
		}) 
		$('#more').children().children('div.form-select').text(text);
	}
	
</script>
<script src="<c:url value="/resources/js/chain.select.js?after"/>"></script>
<script src="<c:url value="/resources/js/search.event.listener.js"/>"></script>
<script>
	function keepCondition() {
		$('input[name=keyword]').val('${search.keyword}');
		$('#locThem').val('${search.locThem}').prop('selected', true);
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
			$('#${i}').css('color', '#212529');
			$('#${i}').addClass('active');
		</c:forEach>
		
	}
	keepCondition();
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 다크모드 js-->
<script src="<c:url value="/resources/js/main_ani.js"/>"></script>
<script src="<c:url value="/resources/js/anime.min.js"/>"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="<c:url value="/resources/js/darkmode.js"/>"></script>
<!-- 모달 JS -->
<script src="<c:url value="/resources/js/modal.js"/>"></script>
</body>
</html>
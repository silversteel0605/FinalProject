<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="<c:url value="/resources/css/template.css?after"/>" rel="stylesheet"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=77mbzylhqr"></script>
	<style>
		.map-list {
			display: flex;
		}
		
		#map {
			height: 100%;
			width: 70%;
		}		
		.camp-list {
			width: 30%;
		}
		
		.camp-list {
			height: 100%;
			overflow: scroll;
			overflow-x: hidden;
			border: 1px solid #dee2e6;
		}

		@media screen and (max-width: 767px){ 		
			.map-list {
				flex-direction:column;
			}
			
			#map, .camp-list {
				width: 100%;
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>	
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
			
  			<div class="map-list pt-5 pb-5">
			  	 <div id="map">
				  	 	<script>
				  	 		var mapDiv = document.getElementById('map');
				  	 		var map = new naver.maps.Map(mapDiv, {
				  	 		    zoom: 5
				  	 		});
				  	 		
				  	 		let markers = new Array();
				  	 		let infos = new Array()
				  	 		
				  	 		<c:forEach var="list" items="${lists }">
			  	 				var marker = new naver.maps.Marker({
			  		  	 		    position: new naver.maps.LatLng(${list.mapY }, ${list.mapX }),
			  		  	 		    map: map
			  		  	 		});
			  	 				
							 	var info = new naver.maps.InfoWindow({
				  	 		        content: 
				  	 		          '<div style="width:200px;text-align:center;padding:10px;">'
				  	 		        + '<a href="./TempCampInfo?contentId=${list.contentId }"><b>${list.facltNm }</b></a>' 
				  	 		        + '<br>${list.addr1 }</div>'
					 			});
							 	
			  	 				markers.push(marker);
			  	 				infos.push(info);
			  	 			</c:forEach>
				  	 		
			  	 			
			  	 		    function getClickHandler(seq) {
			  	 				
			  	 	            return function(e) {  // 마커를 클릭하는 부분
			  	 	                var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
			  	 	                    info = infos[seq]; // 클릭한 마커의 시퀀스로 찾는다
			
			  	 	                if (info.getMap()) {
			  	 	                    info.close();
			  	 	                } else {
			  	 	                    info.open(map, marker); // 표출
			  	 	                }
			  	 	    		}
			  	 	    	}
			  	 	    
			  	 	    for (var i=0, ii=markers.length; i<ii; i++) {
			  	 	        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러  	
			  	 	    }
				  	 	</script>
			  	 </div>
			  	 <div class="camp-list">
				      <ul class="p-0 m-0">
				      	<c:forEach var="list" items="${lists }" varStatus="status">
					        <c:if test="${!status.last}">					        	
					      		<li class="p-3 lbb">
					        </c:if>
					        <c:if test="${status.last}">
				        		<li class="p-3">
					        </c:if>
							          <h5><a href="./CampInfo?contentId=${list.contentId }">${list.facltNm }</a></h3>
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
					        	</li>
				      	</c:forEach>
			
				      </ul>
		    	</div>
  	  		</div>
  		</div>	


<div class="container-lg">
	<div class="row">
  <div class="col-12">
      <ul class="pagination"> 	
		<li class="page-item "><a class="page-link arrow" href="./map?nowPage=1&cntPerPage=${paging.cntPerPage}${search.uri}" class="page-link">&lt;&lt;</a></li>
		<c:choose>
		<c:when test="${paging.startPage != 1}">
			<li class="page-item" ><a class="page-link arrow" href="./map?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}${search.uri}">&lt;</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item"><a class="page-link arrow" href="./map?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&lt;</a></li>
		</c:otherwise>
		</c:choose>      
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<li class="page-item active"><a class="page-link" href="./map?nowPage=${p }&cntPerPage=${paging.cntPerPage}${search.uri}">${p }</a></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<li class="page-item"><a class="page-link" href="./map?nowPage=${p }&cntPerPage=${paging.cntPerPage}${search.uri}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${paging.endPage != paging.lastPage}">
				<li class="page-item"><a class="page-link arrow" href="./map?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link arrow" href="./map?nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;</a></li>
			</c:otherwise>
		</c:choose>
		<li class="page-item"><a class="page-link arrow" href="./map?nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}${search.uri}">&gt;&gt;</a></li>
      </ul>
	</div>
</div>
</div>
	
</section>


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

<script>
	$(document).ready(function() {
		setHeight();
		setMoreText();
		window.dispatchEvent(new Event('resize'));
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
		if($(window).width() < 751) {						
			$('div.col-md-6').removeClass('p-5');
			$('div.col-md-6').addClass('p-3');
			$('#tag').css('height', '');
			$('.minus-left').parent().removeClass('pt-3');
			$('.minus-left').parent().addClass('mt-0');
			
			$('div.map-list').css('height', '');
			$('#map').css('height', $('div.map-list').parent().width());
			$('div.camp-list').css('height', Math.ceil($('div.map-list').parent().width() / 2));
		} else {			
			$('div.col-md-6').removeClass('p-3');
			$('div.col-md-6').addClass('p-5');
			$('#tag').css('height', $('#condition').height())
			$('.minus-left').parent().removeClass('mt-0');
			$('.minus-left').parent().addClass('pt-3');
			
			
			$('div.map-list').css('height', Math.ceil($('div.map-list').parent().width() * 0.7));
			$('#map').css('height', '100%');
			$('div.camp-list').css('height', '100%');
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
			$('#${i}').css('color', '#ffffff');
			$('#${i}').addClass('active');
		</c:forEach>
		
	}
	keepCondition();
</script>
</body>
</html>
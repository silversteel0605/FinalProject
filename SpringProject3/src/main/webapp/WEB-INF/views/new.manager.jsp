<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="<c:url value="/resources/css/template.css?after"/>" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		.tab-content {
			
		}
		#camp_search_field {
			display: flex;
		}
		
		.decl_selc {
			width: auto;
		}
		
		.btn-link, .btn-link:hover {
			text-decoration: none;
			color: #212529;
		}
		
		.table-scroll{
			overflow-x: auto; 
			white-space:nowrap;
		}
	</style>
</head>
<body>
	
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
		<div class="tit mb-2">MANAGEMENT</div>
		<div class="txt">머무는 것 자체로 여행이 되는 공간</div>
	</div>
</div>


<div class="container-lg lbb">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	  <li class="nav-item" role="presentation">
	    <button class="nav-link active" id="member" data-bs-toggle="tab" data-bs-target="#memberManagement" type="button" role="tab" aria-controls="member" aria-selected="true">회원관리</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="Bmember" data-bs-toggle="tab" data-bs-target="#BmemberManagement" type="button" role="tab" aria-controls="Bmember" aria-selected="false">사업자관리</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="camp" data-bs-toggle="tab" data-bs-target="#siteManagement" type="button" role="tab" aria-controls="camp" aria-selected="false">캠핑장관리</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="sup" data-bs-toggle="tab" data-bs-target="#supportManagement" type="button" role="tab" aria-controls="sup" aria-selected="false">고객센터</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="board" data-bs-toggle="tab" data-bs-target="#board-tab" type="button" role="tab" aria-controls="board" aria-selected="false">자유게시판</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="review" data-bs-toggle="tab" data-bs-target="#review-tab" type="button" role="tab" aria-controls="review" aria-selected="false">리뷰</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="comment" data-bs-toggle="tab" data-bs-target="#comment-tab" type="button" role="tab" aria-controls="comment" aria-selected="false">댓글</button>
	  </li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="table-responsive">
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="memberManagement">
					<div class="d-flex justify-content-end mt-3">
						<div class="d-flex ">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="member_search">
							<button class="btn btn-outline-success" id="member_sub">Search</button>
						</div>
					</div>
					<div class="table-scroll">
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th class="col-md-1" scope="col">#</th>
						      <th class="col-md-1" scope="col">ID</th>
						      <th class="col-md-1" scope="col">이름</th>
						      <th class="col-md-2" scope="col">이메일</th>
						      <th class="col-md-6 text-start" scope="col">주소</th>
						    </tr>
						  </thead>
						  <tbody id="member_body" type="0">
		
						  </tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade show" id="BmemberManagement">
					<div class="d-flex justify-content-between mt-3">
						<select id="Bm_selc">
							<option value="">모든 회원보기</option>
							<option value="&permit=0">가입허용 안된 회원만 보기</option>
						</select>
						<div class="d-flex flex-row">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="Bmember_search">
							<button class="btn btn-outline-success" id="Bmember_sub" >Search</button>
						</div>
					</div>
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th class="col-md-1" scope="col">#</th>
					      <th class="col-md-1" scope="col">ID</th>
					      <th class="col-md-1 text-start" scope="col">이름</th>
					      <th class="col-md-1" scope="col">캠핑장</th>
					      <th class="col-md-1" scope="col">가입상태</th>
					      <th class="col-md-1" scope="col"></th>
					    </tr>
					  </thead>
					  <tbody id="Bmember_body" type="1">
					    
					  </tbody>
					</table>
				</div>
				<div class="tab-pane fade show" id="siteManagement">
					<div class="camp-tab mt-3">
						<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						  <li class="nav-item" role="presentation">
						    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true" area="camp">캠핑장검색</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false" area="camp">캠핑장 추가</button>
						  </li>
						</ul>
					</div>
					<div class="d-flex justify-content-between mb-3">
						<select id="camp_selc">
							<option value="keyword">캠핑장 이름으로 검색</option>
							<option value="contentId">캠핑장 ID로 검색</option>
						</select>
						<div id="camp_search_field">
							<input class="form-control me-2" id="camp_search" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" id="camp_submit">Search</button>
						</div>
					</div>
					<div class="tab-content" id="pills-tabContent">
						 <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
						 	<div class="table-scroll">
							 	<table class="table table-hover">
								  <thead>
								    <tr>
								      <th class="col-md-1" scope="col">#</th>
								      <th class="col-md-1" scope="col">캠핑장ID</th>
								      <th class="col-md-6 text-start" scope="col">이름</th>
								      <th class="col-md-1" scope="col">전화번호</th>
								      <th class="col-md-1" scope="col">지역</th>
								      <th class="col-md-2" scope="col"></th>
								    </tr>
								  </thead>
								  <tbody id="camp_body">
								    
								  </tbody>
								</table>
							</div>
				 		</div>
					   <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
					   		<form class="row">
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
				      	<button type="button" class="btn btn-dark" id="camp_add">추가</button>
					   </div>
					</div>
					
				</div>
				<div class="tab-pane fade" id="supportManagement">
					<div class="d-flex justify-content-end mt-3">
						<select class="form-select decl_selc" name="sup" aria-label="Default select example">
						  	<option value="">기본순으로 보기</option>
							<option value="&order=decl">신고순으로 보기</option>
						</select>
					</div>
					<div class="table-scroll">
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th class="col-md-1" scope="col">#</th>
						      <th class="col-md-1" scope="col">게시글ID</th>
						      <th class="col-md-1" scope="col">작성자ID</th>
						      <th class="col-md-6 text-start" scope="col">제목</th>
						      <th class="col-md-1" scope="col">등록일</th>
						      <th class="col-md-1" scope="col"></th>
						    </tr>
						  </thead>
						  <tbody id="sup_body">
						    
						  </tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade show" id="board-tab">
					<div class="d-flex justify-content-end mt-3">
						<select class="form-select decl_selc" name="sup" aria-label="Default select example">
						  	<option value="">기본순으로 보기</option>
							<option value="&order=decl">신고순으로 보기</option>
						</select>
					</div>
					<div class="table-scroll">
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th class="col-md-1" scope="col">#</th>
						      <th class="col-md-1" scope="col">게시글ID</th>
						      <th class="col-md-1" scope="col">작성자ID</th>
						      <th class="col-md-6 text-start" scope="col">제목</th>
						      <th class="col-md-1" scope="col">등록일</th>
						      <th class="col-md-1" scope="col"></th>
						    </tr>
						  </thead>
						  <tbody id="board_body">
						    
						  </tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade show" id="review-tab">
					<div class="d-flex justify-content-end mt-3">
						<select class="form-select decl_selc" name="sup" aria-label="Default select example">
						  	<option value="">기본순으로 보기</option>
							<option value="&order=decl">신고순으로 보기</option>
						</select>
					</div>
					<div class="table-scroll">
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th class="col-md-1" scope="col">#</th>
						      <th class="col-md-1" scope="col">분류</th>
						      <th class="col-md-1" scope="col">작성자</th>
						      <th class="col-md-6 text-start" scope="col">제목</th>
						      <th class="col-md-1" scope="col">등록일</th>
						      <th class="col-md-1" scope="col"></th>
						    </tr>
						  </thead>
						  <tbody id="review_body">
						    
						  </tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade show" id="comment-tab">
					<div class="d-flex justify-content-end mt-3">
						<select class="form-select decl_selc" name="sup" aria-label="Default select example">
						  	<option value="">기본순으로 보기</option>
							<option value="&order=decl">신고순으로 보기</option>
						</select>
					</div>
					<div class="table-scroll">
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th class="col-md-1" scope="col">#</th>
						      <th class="col-md-1" scope="col">게시글ID</th>
						      <th class="col-md-1" scope="col">작성자ID</th>
						      <th class="col-md-6 text-start" scope="col">댓글</th>
						      <th class="col-md-1" scope="col">신고수</th>
						      <th class="col-md-1" scope="col"></th>
						    </tr>
						  </thead>
						  <tbody id="comment_body">
						    
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container-lg">
	<div class="row">
  <div class="col-12">
      <ul class="pagination" id="paging"> 	
		
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
<script src="<c:url value="/resources/js/manager.set.data.js?after"/>"></script>
<script src="<c:url value="/resources/js/pagination.js?after"/>"></script>
<script src="<c:url value="/resources/js/set.post.js?after"/>"></script>
<script src="<c:url value="/resources/js/contextpath.js?after"/>"></script>
<script src="<c:url value="/resources/js/manager.rest.js?after"/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
</body>
</html>
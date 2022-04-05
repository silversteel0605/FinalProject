<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>My Page</title>
<!-- <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/jquery.timepicker.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>" />
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/width.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/john.css"/>"/>
  -->
  <link href="<c:url value="/resources/css/profile.css?after"/>" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=77mbzylhqr"></link>
</head>
<body>
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
 <!-- END nav -->
 
<section class="wrap">
	<div class="container-lg bb mb-5">
	<div class="sub_title">
		<div class="tit mb-2">프로필 페이지</div>
		<div class="txt">개인 프로필</div>
	</div>
</div>
</section>

	
<div class="container-lg lbb">
    <ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" data-toggle="tab" href="#info">내 정보</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#reservation">내 예약정보</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#writing">내 글 목록</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#update">내 정보수정</a>
	  </li>
	</ul>
	<div class="tab-content">
	  <div class="tab-pane fade show active" id="info">
	    <div class="main">
	    	<div class="member">
	    		<div class="name">
	    			<img class="name-img" src="//yaimg.yanolja.com/joy/sunny/static/images/icon_profile_default_02.png" alt="프로필 이미지">
	    			<a class="atag">
	    				<div class="nick-name">
	    				<span>osh123</span>
	    				</div>
	    				<div class="e-mail">osh123@gmail.com</div>
	    			</a>
	    		</div>
	    		<div class="info">
	    			<h2 class="info-h2">개인정보</h2>
	    			<div class="id-box">
	    				<div class="id">아이디</div>
	    				<div class="r-id">osh123</div>
	    			</div>
	    			<div class="id-box">
	    				<div class="id">이메일</div>
	    				<div class="r-id">osh123@gmail.com</div>
	    			</div>
	    			<div class="id-box">
	    				<div class="id">휴대폰번호</div>
	    				<div class="r-id">010-xxxx-xxxx
	    				<button class="modify">수정하기</button>
	    				</div>
	    			</div>
	    		</div>
	    		<div class="name">
	    			<a class="withdraw" href="">
	    			<span>회원탈퇴</span>
	    			</a>
	    		</div>
	    	</div>
	    </div>
	  </div>
	  <div class="tab-pane fade" id="reservation">
	    예약목록
	  </div>
	  <div class="tab-pane fade" id="writing">
	    <div class="item-container">
	    	<div class="item-wrap">
	    		<div class="item">
	    			<div class="header">
	    				<div class="avatar">
	    					<svg data-v-a09cfc0c="" xmlns="http://www.w3.org/2000/svg" width="38" height="38" viewBox="0 0 38 38" class=""><g data-v-a09cfc0c="" fill="none" fill-rule="evenodd"><g data-v-a09cfc0c="" fill="#FA0"><g data-v-a09cfc0c=""><g data-v-a09cfc0c=""><g data-v-a09cfc0c=""><g data-v-a09cfc0c=""><g data-v-a09cfc0c=""><g data-v-a09cfc0c=""><path data-v-a09cfc0c="" d="M19.01 0C29.488.005 38.005 8.532 38 19.01 37.995 29.488 29.468 38.005 18.99 38 8.512 37.995-.005 29.468 0 18.99.005 8.515 8.532-.005 19.01 0zm-.002 3.94c-8.305-.003-15.064 6.748-15.069 15.052-.002 8.307 6.75 15.066 15.053 15.069 8.305.005 15.064-6.747 15.069-15.053.002-8.305-6.75-15.064-15.053-15.069zM14.29 22.515c.962 1.712 2.771 2.771 4.722 2.774 1.928 0 3.731-1.041 4.704-2.721.294-.504.94-.676 1.434-.383.504.292.674.933.382 1.434-1.347 2.328-3.848 3.772-6.52 3.772-2.706-.002-5.219-1.474-6.557-3.84-.28-.507-.103-1.148.398-1.434.51-.284 1.145-.106 1.437.398zm11.214-10.623c1.565.003 2.832 1.27 2.83 2.833 0 1.565-1.27 2.832-2.833 2.83-1.563 0-2.83-1.27-2.83-2.833.003-1.563 1.27-2.83 2.833-2.83zm-13.001-.005c1.563 0 2.83 1.27 2.83 2.833 0 1.563-1.27 2.83-2.833 2.83-1.563 0-2.83-1.27-2.83-2.833 0-1.563 1.27-2.83 2.833-2.83z" transform="translate(-1559 -1337) translate(55 1112) translate(1484 44) translate(20 175) translate(0 6)"></path></g></g></g></g></g></g></g></g></svg>
	    				</div>
	    				<div class="extra">
	    					<div class="badge">
	    						<svg data-v-a09cfc0c="" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="14" viewBox="0 0 32 14" class=""><defs data-v-a09cfc0c=""><path data-v-a09cfc0c="" id="8h91d1poia" d="M0 0H375V1274H0z"></path></defs><g data-v-a09cfc0c="" fill="none" fill-rule="evenodd"><g data-v-a09cfc0c=""><path data-v-a09cfc0c="" fill="#F8F8F8" d="M0 0H2800V2600H0z" transform="translate(-1611 -1331)"></path><g data-v-a09cfc0c=""><g data-v-a09cfc0c="" transform="translate(-1611 -1331) translate(55 1112) translate(1484 44)"><mask data-v-a09cfc0c="" id="7mshgnf9tb" fill="#fff"><use data-v-a09cfc0c="" xlink:href="#8h91d1poia"></use></mask><use data-v-a09cfc0c="" fill="#FFF" xlink:href="#8h91d1poia"></use><g data-v-a09cfc0c="" mask="url(#7mshgnf9tb)"><g data-v-a09cfc0c=""><g data-v-a09cfc0c=""><g data-v-a09cfc0c=""><path data-v-a09cfc0c="" fill="#DE2E5F" d="M4 0h24c2.21 0 4 1.79 4 4v6c0 2.21-1.79 4-4 4H4c-2.21 0-4-1.79-4-4V4c0-2.21 1.79-4 4-4z" transform="translate(20 175) translate(52)"></path><text data-v-a09cfc0c="" fill="#FFF" font-family="AvenirNext-DemiBold, Avenir Next" font-size="9" font-weight="500" transform="translate(20 175) translate(52)"><tspan data-v-a09cfc0c="" x="5" y="10">BEST</tspan></text></g></g></g></g></g></g></g></g></svg>
	    					</div>
	    					<div class="meta">
	    						<div data-v-7fc9dc32="" data-v-a09cfc0c="" class="container1 score"><i data-v-7fc9dc32="" class="ico" style="width: 11px; height: 11px;"></i><i data-v-7fc9dc32="" class="ico" style="width: 11px; height: 11px;"></i><i data-v-7fc9dc32="" class="ico" style="width: 11px; height: 11px;"></i><i data-v-7fc9dc32="" class="ico" style="width: 11px; height: 11px;"></i><i data-v-7fc9dc32="" class="ico" style="width: 11px; height: 11px;"></i></div>
	    						<div data-v-a09cfc0c="" class="badge">바른후기</div>
	    						<time data-v-a09cfc0c="">2021. 06. 01</time>
	    					</div>
	    					<div data-v-a09cfc0c class="profile">고슴도치주인 | B1 - 숙박</div>
	    				</div>
	    			</div>
	    			<div class="body">
	    				<div class="content-wrap">
	    					<p data-v-a09cfc0c="" class="content">원래 글램핑은 개별화장실 있어도 엄청 좁고 침구같은 것도 비위생적으로 보여서 안좋아하는데 여기는 너무 좋았어요!! 침구도 믿음직스럽고 화장실도 일반 화장실같아서 그냥 신축펜션 시설로 캠핑 분위기 낼수있어요 특히 일회용 수세미 있는게 완벽해요ㅜㅜ 앞으로도 관리 잘해주셔서 글램핑은 매번 이곳으로 오고싶어요!!<!----></p>
	    				</div>
	    				<div class="image-container">
	    					<ul>
	    						<li>
	    							<img class="image" src="https://via.placeholder.com/200x120" alt="샘플이미지">
	    						</li>
	    						<li>
	    							<img class="image" src="https://via.placeholder.com/200x120" alt="샘플이미지">
	    						</li>
	    						<li data-v-a09cfc0c="" style="flex: 0 0 10px; height: 100%;"></li>
	    					</ul>
	    				</div>
	    				<div class="comment-wrap">
	    					<div data-v-70e1a9ba class="box">
	    						<div data-v-70e1a9ba="" class="header">
	    							<h4 data-v-70e1a9ba="">숙소 답변</h4>
	    						 	<time data-v-70e1a9ba="">2021. 06. 04</time>
	    						</div>
	    						<div data-v-70e1a9ba class="content-wrap">
	    							<p data-v-70e1a9ba class="content clamp">안녕하세요 달빛정원 글램핑입니다~ 저희는 청결을 기본원칙으로 하고 있어요. 특히 침구류는 매일 고온세탁하여 교체하고 있습니다.글램핑 화장실은 좁다는 편견을 깨고 싶어서 여유있게 설계했는데 이렇게 맘에 들어하시니 뿌듯합니다^^ 쓸고 닦고 열심히해서 항상 깨끗한 모습으로 고객분들을 맞이하도록 노력하겠습니다~
	    							
									<a data-v-70e1a9ba="" href="#" class="more-btn">더보기</a>
	    							</p>		
	    						</div>
	    					</div>			
	    				</div>
	    			</div>
	    		</div>
	    		<div data-v-2efac8a3="" class="divider"></div>
	    	</div>
	    	
	    </div>
	  </div>
	</div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
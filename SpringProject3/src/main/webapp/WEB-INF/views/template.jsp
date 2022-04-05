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
	<link src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=77mbzylhqr"></link>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/reset.css"/>"/>
	<!-- header css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/renewal_nav.css"/>"/>
    <!--다크모드 관련 css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
    <!-- 모달 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>"/>
    
    <!-- 현제 페이지용 css -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>"/>
	<style>
		/*
			각 페이지 css
		*/
	</style>
</head>
<body style="overflow-x: hidden">
	
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

<section id = "main_contents" class="wrap">
	
	<div class="recommended">
            <div class="row justify-content-center pb-4">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading eng_name">Recommended Camping Spots</span>
                    <h2 class="mb-4 kr_name" id="name2">추천 지역</h2>
                </div>
            </div>
            <div class="swiper fmySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#">
                        <div class="card ">
                            <div class="card-image" id="recommended_img1"></div>
                            <div class="card-text">
                                <h2>경상 북도</h2>
                                <p>지역 소개</p>
                            </div>
                            <div class="card-stats">
                                <div class="stat">
                                    <div class="value">0</div>
                                    <div class="type">read</div>
                                </div>
                                <div class="stat border">
                                    <div class="value">0</div>
                                    <div class="type">후기</div>
                                </div>
                                <div class="stat">
                                    <div class="value">363</div>
                                    <div class="type">캠핑장</div>
                                </div>
                            </div>
                        </div>            
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="card ">
                                <div class="card-image" id="recommended_img2"></div>
                                <div class="card-text">
                                    <h2>경기도</h2>
                                    <p>지역 소개</p>
                                </div>
                                <div class="card-stats">
                                    <div class="stat">
                                        <div class="value">0</div>
                                        <div class="type">read</div>
                                    </div>
                                    <div class="stat border">
                                        <div class="value">0</div>
                                        <div class="type">후기</div>
                                    </div>
                                    <div class="stat">
                                        <div class="value">712</div>
                                        <div class="type">캠핑장</div>
                                    </div>
                                </div>
                            </div>            
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="card ">
                                <div class="card-image" id="recommended_img3"></div>
                                <div class="card-text">
                                    <h2>충청 북도</h2>
                                    <p>지역 소개</p>
                                </div>
                                <div class="card-stats">
                                    <div class="stat">
                                        <div class="value">0</div>
                                        <div class="type">read</div>
                                    </div>
                                    <div class="stat border">
                                        <div class="value">0</div>
                                        <div class="type">후기</div>
                                    </div>
                                    <div class="stat">
                                        <div class="value">213</div>
                                        <div class="type">캠핑장</div>
                                    </div>
                                </div>
                            </div>            
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="card ">
                                <div class="card-image" id="recommended_img4"></div>
                                <div class="card-text">
                                    <h2>전라 남도</h2>
                                    <p>지역 소개</p>
                                </div>
                                <div class="card-stats">
                                    <div class="stat">
                                        <div class="value">0</div>
                                        <div class="type">read</div>
                                    </div>
                                    <div class="stat border">
                                        <div class="value">0</div>
                                        <div class="type">후기</div>
                                    </div>
                                    <div class="stat">
                                        <div class="value">164</div>
                                        <div class="type">캠핑장</div>
                                    </div>
                                </div>
                            </div>            
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="card ">
                                <div class="card-image" id="recommended_img5"></div>
                                <div class="card-text">
                                    <h2>제주도</h2>
                                    <p>지역 소개</p>
                                </div>
                                <div class="card-stats">
                                    <div class="stat">
                                        <div class="value">0</div>
                                        <div class="type">read</div>
                                    </div>
                                    <div class="stat border">
                                        <div class="value">0</div>
                                        <div class="type">후기</div>
                                    </div>
                                    <div class="stat">
                                        <div class="value">49</div>
                                        <div class="type">캠핑장</div>
                                    </div>
                                </div>
                            </div>            
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="card ">
                                <div class="card-image" id="recommended_img6"></div>
                                <div class="card-text">
                                    <h2>강원도</h2>
                                    <p>지역 소개</p>
                                </div>
                                <div class="card-stats">
                                    <div class="stat">
                                        <div class="value">0</div>
                                        <div class="type">read</div>
                                    </div>
                                    <div class="stat border">
                                        <div class="value">0</div>
                                        <div class="type">후기</div>
                                    </div>
                                    <div class="stat">
                                        <div class="value">604</div>
                                        <div class="type">캠핑장</div>
                                    </div>
                                </div>
                            </div>            
                        </a>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="fswiper-pagination"></div>
            </div>
       </div>
       
       <div id="type">
       		<div class="eng_name">type of camping</div>
       		<div class="kr_name">캠핑의 종류</div>
       		<div class="swiper mySwiper">
		      <div  class="swiper-wrapper">
		        <div class="swiper-slide type_img">
		          	<img src="https://mblogthumb-phinf.pstatic.net/MjAxNzExMjJfMTA5/MDAxNTExMzUyNzI1ODY2.rXjz83cwUKo3Y0C0ezFdHQoP-RcPODSwBNYBHWgxmpkg.St96dtM8FDWjNmX40EJgStVGd0goYg68_sHJBWBUNz0g.JPEG.loveinchae/01_%EB%B0%B0%EB%82%AD%EA%B3%A0%EB%A5%B4%EB%8A%94%EB%B2%95_01.jpg?type=w800" />
		        	<div class="champ_info">
			        	<div class="champ_info_name">백패킹</div>
			        	<div class="champ_info_contents">1박 이상의 야영생활에 필요한 장비를 갖추고 정해진 구간을 여행하는 것입니다. 말그대로 가방에 많은 캠핑용품들을 챙겨서 떠나기 때문에 불편하고 힘이 들수도 있지만 자연을 더 가까이에서 즐기고 느낄 수 있는 게 가장 큰 매력이있다. </div>	
		        	</div>
		        </div>
		        <div class="swiper-slide type_img">
					<div class="champ_info">
						<div class="champ_info_name">오토캠핑</div>
						<div class="champ_info_contents">오토캠핑은 자동차를 뜻하는 오토(auto)와 야영을 뜻하는 캠핑(camping)이 더해진 합성어로, 자동차에 캠핑 장비를 가득 싣고 차량과 함께 떠나는 캠핑을 오토캠핑이라고 합니다.</div>
					</div>
					<img src="https://cdn.imweb.me/upload/S2021010713029767f8f7b/5538848a678e1.jpg" />
		        </div>
		        <div class="swiper-slide type_img">
		          	<img src="https://kr.blog.kkday.com/wp-content/uploads/korea_camping_spot_5.jpg" />
		          	<div class="champ_info">
		          		<div class="champ_info_name">글램핑</div>
			        	<div class="champ_info_contents">고가의 가구, 전기 따위의 시설을 갖춘 텐트를 경관이 뛰어난 강변이나 바닷가, 숲에 설치하고 야영객들에게 대여하여 즐길 수 있게 만들어진 캠핑을 글램핑이라고 합니다. 글램핑은 텐트 내부에 모든 장비가 갖추어져 있기 때문에 간편하게 몸만 가서 즐기면 됩니다. </div>
			        </div>
		        </div>
		        <div class="swiper-slide type_img">
		        	<div class="champ_info">
		        		<div class="champ_info_name">자전거 캠핑</div>
			        	<div class="champ_info_contents">본인이 직접 배낭을 매고 걸어다니는 백패킹보다는 힘이 덜 들고 자전거를 타고 이동하기 때문에 활동 범위가 넓은 장점이 있습니다. </div>
			        </div>
		          	<img src="http://www.msrgear.co.kr/wp-content/uploads/2018/07/Swift_Packing-05.jpg" />
		        </div>
		        <div class="swiper-slide type_img">
		          	<img src="https://mblogthumb-phinf.pstatic.net/MjAxODAxMDFfMTMz/MDAxNTE0Nzg3MDA3MjY3.YNXuj-A6Hl5AmDxJPcBmg2SB1yk36lLRMsDdWyOgqHwg.QANWRBYbxyFnPLb4PMkEex7Ee-N6xX7h9ywDBkduvCkg.JPEG.cpa54/%EB%B9%84%EB%B9%84.jpg?type=w800" />
		          	<div class="champ_info">
		          		<div class="champ_info_name">비박과 부쉬크래프트</div>
			        	<div class="champ_info_contents">비박(bivouac)이란 텐트를 사용하지 않고 침낭하나만 가지고 계절에 상관없이 이곳 저곳을 돌아다니며 침낭을 이불삼아 침낭속에서 밤을 보내는 캠핑을 뜻합니다. 또 부쉬크래프트는 백패킹과 비박 보다도 더 힘든 캠핑으로 텐트와 침낭도 없이 야생 그대로를 즐기는 캠핑을 말합니다. </div>
		          	</div>
		        </div>
		      </div>
		      <div class="swiper-pagination"></div>
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


<script src="<c:url value="/resources/js/main_ani.js"/>"></script>
<script src="<c:url value="/resources/js/anime.min.js"/>"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 다크모드 js-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="<c:url value="/resources/js/darkmode.js"/>"></script>
<!-- 모달 JS -->
<script src="<c:url value="/resources/js/modal.js"/>"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="<c:url value="/resources/js/home.js"/>"></script>

</body>
</html>
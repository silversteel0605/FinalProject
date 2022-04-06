<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %>
<% response.setStatus(500); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datepicker.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery.timepicker.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/home.css"/>"/>
	<!-- dropdown -->
	<link rel="stylesheet" href="<c:url value="/resources/css/dropdown.css"/>"/>
    <!--캐러셀-->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <!--다크모드 관련 css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/nav.css"/>"/>
</head>
<body style="overflow-x: hidden">

	<jsp:include page='renewal_nav.jsp'/>
	
	<div id="mainimg" class="hero-wrap js-fullheight" style="background-image: url('resources/images/bg_5.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center" data-scrollax-parent="true">
				<div class="col-md-7 ftco-animate">
					<span class="subheading">Welcome to Pacific</span>
					<h1 class="mb-4">Discover Your Favorite Place with Us</h1>
					<p class="caps">Travel to the any corner of the world, without going around in circles</p>
				</div>
				<a href="https://vimeo.com/45830194" class="icon-video popup-vimeo d-flex align-items-center justify-content-center mb-4">
					<span class="fa fa-play"></span>
				</a>
			</div>
		</div>
	</div>
	
	<div id="body">
    <section>	
    	<form action="test" method="get">
	        <section class="ftco-section ftco-no-pb ftco-no-pt">
	            <div class="container">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="ftco-search d-flex justify-content-center">
	                            <div class="row">
	                                <div class="col-md-12 nav-link-wrap">
	                                    <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	                                        <a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">캠핑장 검색</a>    
	                                    </div>
	                                </div>
	                                <div class="col-md-12 tab-wrap">
	                                    
	                                    <div class="tab-content" id="v-pills-tabContent">
	    
	                                        <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
	                                            <form action="#" class="search-property-1">
	                                                <div class="row no-gutters">
	                                                    <div class="col-md d-flex">
	                                                        <div class="form-group p-4 border-0">
	                                                            <label for="#">장소</label>
	                                                            <div class="form-field">
	                                                                <div class="icon"><span class="fa fa-search"></span></div>
	                                                                <input autocomplete="off" name="place" type="text" class="form-control" placeholder="Search place">
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-md d-flex">
	                                                        <div class="form-group p-4">
	                                                            <label for="#">체크인 가능 시간</label>
	                                                            <div class="form-field">
	                                                                <div class="icon"><span class="fa fa-calendar"></span></div>
	                                                                <input autocomplete="off" name ="check_in_time" type="text" class="form-control checkin_date" placeholder="Check In Date">
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-md d-flex">
	                                                        <div class="form-group p-4">
	                                                            <label for="#">체크아웃 가능 시간</label>
	                                                            <div class="form-field">
	                                                                <div class="icon"><span class="fa fa-calendar"></span></div>
	                                                                <input autocomplete="off" name ="check_out_time" type="text" class="form-control checkout_date" placeholder="Check Out Date">
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-md d-flex">
	                                                        <div class="form-group p-4">
	                                                            <label for="#">원하는 가격대</label>
	                                                            <div class="form-field">
	                                                                <div class="select-wrap">
	                                                                    <div class="icon"><span class="fa fa-chevron-down"></span></div>
	                                                                    <select name="price" id="" class="form-control">
	                                                                        <option value="10,000원 이하">10,000원 이하</option>
	                                                                        <option value="10,000원 ~ 50,000원">10,000원 ~ 50,000원 </option>
	                                                                        <option value="50,000원 ~ 100,000원">50,000원 ~ 100,000원</option>
	                                                                        <option value="100,000원 ~ 150,000원">100,000원 ~ 150,000원</option>
	                                                                        <option value="150,000원 ~ 200,000원">150,000원 ~ 200,000원</option>
	                                                                        <option value="200,000원 ~ 300,000원">200,000원 ~ 300,000원</option>
	                                                                        <option value="300,000원 이상">300,000원 이상</option>
	                                                                    </select>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    <div class="col-md d-flex">
	                                                        <div class="form-group d-flex w-100 border-0">
	                                                            <div class="form-field w-100 align-items-center d-flex">
	                                                                <input type="submit" value="Search" class="align-self-stretch form-control btn btn-primary">
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </form>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </section>
			</form>
        <div class="recommended">
            <div class="row justify-content-center pb-4">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading">Recommended Camping Spots</span>
                    <h2 class="mb-4">추천 지역</h2>
                </div>
            </div>
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#">
                        <div class="card ">
                            <div class="card-image"></div>
                            <div class="card-text">
                                <h2>지역 이름</h2>
                                <p>지역 소개</p>
                            </div>
                            <div class="card-stats">
                                <div class="stat">
                                    <div class="value">4m</div>
                                    <div class="type">read</div>
                                </div>
                                <div class="stat border">
                                    <div class="value">5123</div>
                                    <div class="type">후기</div>
                                </div>
                                <div class="stat">
                                    <div class="value">32</div>
                                    <div class="type">캠핑장</div>
                                </div>
                            </div>
                        </div>            
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="card ">
                                <div class="card-image"></div>
                                <div class="card-text">
                                    <h2>지역 이름</h2>
                                    <p>지역 소개</p>
                                </div>
                                <div class="card-stats">
                                    <div class="stat">
                                        <div class="value">4m</div>
                                        <div class="type">read</div>
                                    </div>
                                    <div class="stat border">
                                        <div class="value">5123</div>
                                        <div class="type">후기</div>
                                    </div>
                                    <div class="stat">
                                        <div class="value">32</div>
                                        <div class="type">캠핑장</div>
                                    </div>
                                </div>
                            </div>            
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="card ">
                                <div class="card-image"></div>
                                <div class="card-text">
                                    <h2>지역 이름</h2>
                                    <p>지역 소개</p>
                                </div>
                                <div class="card-stats">
                                    <div class="stat">
                                        <div class="value">4m</div>
                                        <div class="type">read</div>
                                    </div>
                                    <div class="stat border">
                                        <div class="value">5123</div>
                                        <div class="type">후기</div>
                                    </div>
                                    <div class="stat">
                                        <div class="value">32</div>
                                        <div class="type">캠핑장</div>
                                    </div>
                                </div>
                            </div>            
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <div class="card ">
                                <div class="card-image"></div>
                                <div class="card-text">
                                    <h2>지역 이름</h2>
                                    <p>지역 소개</p>
                                </div>
                                <div class="card-stats">
                                    <div class="stat">
                                        <div class="value">4m</div>
                                        <div class="type">read</div>
                                    </div>
                                    <div class="stat border">
                                        <div class="value">5123</div>
                                        <div class="type">후기</div>
                                    </div>
                                    <div class="stat">
                                        <div class="value">32</div>
                                        <div class="type">캠핑장</div>
                                    </div>
                                </div>
                            </div>            
                        </a>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
       </div>

        
    </section>
    <section class="ftco-section">
	</div>
        <div class="container">
            <div class="row justify-content-center pb-4">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading">Destination</span>
                    <h2 class="mb-4">추천 캠핑장</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 ftco-animate">
                    <div class="project-wrap">
                        <a href="#" class="img" style="background-image: url(resources/images/destination-1.jpg);">
                            <span class="price">$550/person</span>
                        </a>
                        <div class="text p-4">
                            <span class="days">8 Days Tour</span>
                            <h3><a href="#">Banaue Rice Terraces</a></h3>
                            <p class="location"><span class="fa fa-map-marker"></span> Banaue, Ifugao, Philippines</p>
                            <ul>
                                <li><span class="flaticon-shower"></span>2</li>
                                <li><span class="flaticon-king-size"></span>3</li>
                                <li><span class="flaticon-mountains"></span>Near Mountain</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 ftco-animate">
                    <div class="project-wrap">
                        <a href="#" class="img" style="background-image: url(resources/images/destination-2.jpg);">
                            <span class="price">$550/person</span>
                        </a>
                        <div class="text p-4">
                            <span class="days">10 Days Tour</span>
                            <h3><a href="#">Banaue Rice Terraces</a></h3>
                            <p class="location"><span class="fa fa-map-marker"></span> Banaue, Ifugao, Philippines</p>
                            <ul>
                                <li><span class="flaticon-shower"></span>2</li>
                                <li><span class="flaticon-king-size"></span>3</li>
                                <li><span class="flaticon-sun-umbrella"></span>Near Beach</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 ftco-animate">
                    <div class="project-wrap">
                        <a href="#" class="img" style="background-image: url(resources/images/destination-3.jpg);">
                            <span class="price">$550/person</span>
                        </a>
                        <div class="text p-4">
                            <span class="days">7 Days Tour</span>
                            <h3><a href="#">Banaue Rice Terraces</a></h3>
                            <p class="location"><span class="fa fa-map-marker"></span> Banaue, Ifugao, Philippines</p>
                            <ul>
                                <li><span class="flaticon-shower"></span>2</li>
                                <li><span class="flaticon-king-size"></span>3</li>
                                <li><span class="flaticon-sun-umbrella"></span>Near Beach</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 ftco-animate">
                    <div class="project-wrap">
                        <a href="#" class="img" style="background-image: url(resources/images/destination-4.jpg);">
                            <span class="price">$550/person</span>
                        </a>
                        <div class="text p-4">
                            <span class="days">8 Days Tour</span>
                            <h3><a href="#">Banaue Rice Terraces</a></h3>
                            <p class="location"><span class="fa fa-map-marker"></span> Banaue, Ifugao, Philippines</p>
                            <ul>
                                <li><span class="flaticon-shower"></span>2</li>
                                <li><span class="flaticon-king-size"></span>3</li>
                                <li><span class="flaticon-sun-umbrella"></span>Near Beach</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 ftco-animate">
                    <div class="project-wrap">
                        <a href="#" class="img" style="background-image: url(resources/images/destination-5.jpg);">
                            <span class="price">$550/person</span>
                        </a>
                        <div class="text p-4">
                            <span class="days">10 Days Tour</span>
                            <h3><a href="#">Banaue Rice Terraces</a></h3>
                            <p class="location"><span class="fa fa-map-marker"></span> Banaue, Ifugao, Philippines</p>
                            <ul>
                                <li><span class="flaticon-shower"></span>2</li>
                                <li><span class="flaticon-king-size"></span>3</li>
                                <li><span class="flaticon-sun-umbrella"></span>Near Beach</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 ftco-animate">
                    <div class="project-wrap">
                        <a href="#" class="img" style="background-image: url(resources/images/destination-6.jpg);">
                            <span class="price">$550/person</span>
                        </a>
                        <div class="text p-4">
                            <span class="days">7 Days Tour</span>
                            <h3><a href="#">Banaue Rice Terraces</a></h3>
                            <p class="location"><span class="fa fa-map-marker"></span> Banaue, Ifugao, Philippines</p>
                            <ul>
                                <li><span class="flaticon-shower"></span>2</li>
                                <li><span class="flaticon-king-size"></span>3</li>
                                <li><span class="flaticon-sun-umbrella"></span>Near Beach</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    

    <jsp:include page='footer.jsp'/>



    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                stroke="#F96D00" />
        </svg></div>


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
    
    <!-- home 스크립트-->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="<c:url value="/resources/js/home.js"/>"></script>
    <!-- 다크모드 js-->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="<c:url value="/resources/js/darkmode.js"/>"></script>
</body>

</html>
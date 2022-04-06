<%@page import="com.spring.project.review.DTO.CampingReviewDTO"%>
<%@page import="com.spring.project.camping.DTO.CampingVO"%>
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
	
	<!-- header css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/renewal_nav.css"/>"/>
    <!--다크모드 관련 css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
    
	<!-- new carousel -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
	
	<!-- naver map -->
  	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=rlwhiqh9cv"></script>
  	<link rel="stylesheet" href="./resources/css/map.css">
  	
  	<!-- bootstrap cdn -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  	
  	<!-- camping_index css -->
	<link rel="stylesheet" href="./resources/css/camping_index_style.css">
	
	<!-- camping_font -->
	<link rel="stylesheet" href="./resources/fonts/review&campingInfo/campingInfo.css">
	
	<!-- google icon -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	
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
<!-- 
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

 -->

<% CampingVO info = (CampingVO)request.getAttribute("info"); %>

<section class="wrap">
	<div id="title_wrap" class="container-lg bb mb-5">
		<div class="sub_title">
			<div class="tit mb-2"><p id="top_title">CAMPGROUND DETAILS</p></div>
			<div class="txt"><%= info.getFacltNm() %></div>
		</div>
	</div>

<section id="content01" class = "content01_wrap bgc_color_box obj_row_center">
			
			<!-- Swiper -->
			<div #swiperRef="" class="swiper mySwiper img_boxs container flex_1">
				<div id="camping_title" class = "obj_row_center container bgc_box">
					<div class="ftco-section align-items-center bgc_box_size">
						<div class="title_txt">
							<h2 class="h2_size ibm-bold-font"><%= info.getFacltNm() %></h2>
							<hr style="width: 80%">
							<div class="">
								<c:if test="${info.homepage != null }">
							        <div><a href="<%=info.getHomepage() %>">사이트 상세정보</a></div>
							    </c:if>
								<div style="text-align: end;"><a href="">예약하기</a></div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-wrapper">
					<c:forEach var="item" items="${img_vo}">
				      	<div class="swiper-slide">
				          <img class="carousel_img" src="${ item.imgURL }" />
				        </div>
					</c:forEach>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				
		    </div>
	    
	</section>


<div class="container-lg lbb">	
	
	
	<section id="content02" class=" wrap ftco-section services-section text-center">
	
		
		<div class="container">
		
			<ul class="nav nav-tabs tab_margin" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">상세정보</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">위치정보</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">리뷰</button>
			  </li>
			</ul>
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			  	<div>
					<div class = "camping_text">
						<div class = "inner_content">
							<c:if test="${info.lineIntro != null }">
								<div class="header-style">
					        		<h3> <%=info.getLineIntro() %></h3>
					        	</div>
						    </c:if>
						    
						    <span><%= info.getFacltNm() %></span>
						    
							<c:if test="${info.intro != null }">
								<p><%=info.getIntro() %></p>
							</c:if>
						</div>
						
						<hr />
						
						<div class = "sbrsTable inner_content">
							<c:if test="${info.sbrsCl != null }">
								
								<div class = "sbrsText header-style">
									<h4>시설정보</h4>
								</div>
								<div class = "flex-center">
									<table>
										<c:forEach var="item" items="${sbrsCls }">
											<td class="table_td">
												 <c:choose>
											        <c:when test="${item eq '전기'}">
											    		<i class="material-icons">power</i>        
											        </c:when>
											        <c:when test="${item eq '무선인터넷'}">
											    		<i class="material-icons">wifi</i>        
											        </c:when>
											        <c:when test="${item eq '장작판매'}">
											    		<i class="material-icons">local_fire_department</i>        
											        </c:when>
											        <c:when test="${item eq '온수'}">
											    		<i class="material-icons">invert_colors</i>        
											        </c:when>
											        <c:when test="${item eq '수영장'}">
											    		<i class="material-icons">pool</i>        
											        </c:when>
											        <c:when test="${item eq '운동시설'}">
											    		<i class="material-icons">fitness_center</i>        
											        </c:when>
											        <c:when test="${item eq '산책로'}">
											    		<i class="material-icons">map</i>        
											        </c:when>
											        <c:otherwise>
											           <i class="material-icons">info</i>
											         </c:otherwise>
											    </c:choose>
												
												<p>${item }</p>
											</td>
										</c:forEach>
									</table>
								</div>
								
							</c:if>
							
							    
							<c:if test="${info.sbrsEtc != null }">
								<tr>
									<td></td>
									<td><%=info.getSbrsEtc() %></td>
								</tr>
							</c:if>
						</div>
						
						<hr />
						
						<div class = "inner_content">
							
							<div class = "header-style">
								<h4>기타정보</h4>
							</div>
							<table>
								
							    <c:if test="${info.siteBottomCl1 != null }">
							        <p>잔디 : <%=info.getSiteBottomCl1() %></p>
							        <hr />
							    </c:if>
							    
							    <c:if test="${info.siteBottomCl2 != null }">
							        <p>파쇄석 : <%=info.getSiteBottomCl2() %></p>
							        <hr />
							    </c:if>
							    
							    <c:if test="${info.siteBottomCl3 != null }">
							        <p>테크 : <%=info.getSiteBottomCl3() %></p>
							        <hr />
							    </c:if>
							    
							    <c:if test="${info.siteBottomCl4 != null }">
							        <p>자갈 : <%=info.getSiteBottomCl4() %></p>
							        <hr />
							    </c:if>
							    
							    <c:if test="${info.siteBottomCl5 != null }">
							        <p>맨흙 : <%=info.getSiteBottomCl5() %></p>
							        <hr />
							    </c:if>
							    
							    <div>
							    <c:if test="${info.gnrlSiteCo != 0 && info.gnrlSiteCo != null}">
							        <p>일반야영장 : <%=info.getGnrlSiteCo() %></p>
							    </c:if>
							    <c:if test="${info.autoSiteCo != 0 && info.autoSiteCo != null}">
							        <p>자동차야영장 : <%=info.getAutoSiteCo() %></p>
							    </c:if>
							    <c:if test="${info.glampSiteCo != 0 && info.glampSiteCo != null }">
							        <p>글램핑 : <%=info.getGlampSiteCo() %></p>
							    </c:if>
							    <c:if test="${info.caravSiteCo != 0 && info.caravSiteCo != null}">
							        <p>카라반 : <%=info.getCaravSiteCo() %></p>
							    </c:if>
							    </div>
							    
							    <c:if test="${info.sitedStnc != 0 && info.sitedStnc != null }">
							        <p>사이트간의 거리 : <%=info.getSitedStnc() %></p>
							    </c:if>
							    
							    <c:if test="${info.posblFcltyCl != null }">
							        <p>주변이용가능시설 : <%=info.getPosblFcltyCl() %></p>
							    </c:if>
							    
							    <c:if test="${info.posblFcltyEtc != null }">
							        <p>주변이용가능시설 기타 : <%=info.getPosblFcltyEtc() %></p>
							    </c:if>
							    
							    <c:if test="${info.eqpmnLendCl != null }">
							        <p>캠핑장장비대여 : <%=info.getEqpmnLendCl() %></p>
							    </c:if>
							    
							    <c:if test="${info.animalCmgCl != null }">
							        <p>애완동물 유무 : <%=info.getAnimalCmgCl() %></p>
							    </c:if>
							    
							    <c:if test="${info.operDeCl != null }">
							        <p>운영일 : <%=info.getOperDeCl() %></p>
							    </c:if>
							    
							    <c:if test="${info.tel != null }">
							        <p>문의 : <%=info.getTel() %></p>
							    </c:if>
							    <c:if test="${info.homepage != null }">
							    	<p>홈페이지 : <%=info.getHomepage() %></p>
							    </c:if>
							    
							</table>
						</div>
						    
					</div>
				</div>
			  </div>
			  
			  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
			  	<div class = "map_warp">
						<div class="map_text inner_content">
							<p>주소지 :
								<c:if test="${info.addr1 != null }">
									<%= info.getAddr1() %>
								</c:if>
								<c:if test="${info.addr2 != null }">
									<%= info.getAddr2() %>
								</c:if>
								</p>
						</div>
						
						<div id = "map">
							<script type="text/javascript" src="./resources/js/naver_map.js"></script>
							<script> createMap(<%=info.getMapY()%>, <%=info.getMapX()%>) </script>
						</div>
					
					</div>
			  </div>
			  
			  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
			  	<section id="reivew" class="ftco-section">
						<div class="container">
							<!-- 최신순 / 추천순 / 평점순  -->
							<div id="top_box" class="flex_1">
								<div class="left-sort">
									<select name="review_search_select_box" onchange="select_click_event(this.options[this.selectedIndex].value,<%=info.getContentId() %>)">
										<option value="reviewId">최신순</option>
										<option value="starRanking">평점순</option>
									</select>
								</div>
								
								<div id="write_btn_box" class="right-sort">
									<button id="write_btn" class="write_button">
										<a href="/project/review?type=0&contentId=<%=info.getContentId() %>">글쓰기</a>
									</button>
								</div>
							</div>
							<div class="review_viewer">
								<c:forEach var="review" items="${lists}">
									<div class="viewer">
			      						<div class="review_img_box">
			      							<div id="reg_date" class="day">
												<span class="date_text">${review.up_date}</span>
		        							</div>
			      							<img class="null_img img" src="https://placeimg.com/300/250" alt="" />
			      						</div>
			      						<div class="review_text_box">
				      						<h3 class="heading"><a id="review_txt" href="/project/reviewViewer?reviewId=${review.review_id}">${review.title}</a></h3>
				      						<p>${review.review}</p>					      						
			      						</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="row mt-5">
							<div class="col text-center">
								    <div class="block-27">
								      <ul class = "page_number">	
										<li>
											<a data-toggle="tab" href="./CampInfo?contentId=<%= info.getContentId() %>&nowPage=1&cntPerPage=${paging.cntPerPage}${search.uri}&type=3#tab03">&lt;&lt;</a>
										</li>
										
										<c:choose>
											<c:when test="${paging.startPage != 1}">
												<li class="page_btn"><a href="./CampInfo?contentId=<%= info.getContentId() %>&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}${search.uri}&type=3#tab03">&lt;</a></li>
											</c:when>
											<c:otherwise>
												<li class="page_btn"><a href="./CampInfo?contentId=<%= info.getContentId() %>&nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}${search.uri}&type=3#tab03">&lt;</a></li>
											</c:otherwise>
										</c:choose>
										      
										<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<li class="page_numbering active"><a href="./CampInfo?contentId=<%= info.getContentId() %>&nowPage=${p }&cntPerPage=${paging.cntPerPage}${search.uri}&type=3#tab03">${p }</a></li>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<li class= "page_numbering"><a href="./CampInfo?contentId=<%= info.getContentId() %>&nowPage=${p }&cntPerPage=${paging.cntPerPage}${search.uri}&type=3#tab03">${p }</a></li>
												</c:when>
											</c:choose>
										</c:forEach>
										
										<c:choose>
											<c:when test="${paging.endPage != paging.lastPage}">
												<li class="page_btn"><a href="./CampInfo?contentId=<%= info.getContentId() %>&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}${search.uri}&type=3#tab03">&gt;</a></li>
											</c:when>
											<c:otherwise>
												<li class="page_btn"><a href="./CampInfo?contentId=<%= info.getContentId() %>&nowPage=${paging.endPage }&cntPerPage=${paging.cntPerPage}${search.uri}&type=3#tab03">&gt;</a></li>
											</c:otherwise>
										</c:choose>
										<li><a href="./CampInfo?contentId=<%= info.getContentId() %>&nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}${search.uri}&type=3#tab03">&gt;&gt;</a></li>
								      </ul>
								</div>
							</div>
						</div>
					</section>	
		
					
			  </div>
			</div>
		</div>
	</section>
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

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script src="./resources/js/jquery.min.js"></script>


<!-- review -->
<script type="text/javascript" src="./resources/js/page_tab.js"></script>
<c:if test="${type == 3}">
	<script>
		review();
	</script>
</c:if> 

<!-- 다크모드 js-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="<c:url value="/resources/js/darkmode.js"/>"></script>

<script src="./resources/js/camping_index.js"></script>
</body>
</html>

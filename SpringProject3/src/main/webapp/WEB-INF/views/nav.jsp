<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Pacific<span>Travel Agency</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item"><a href="destination.html" class="nav-link">Destination</a></li>
					<li class="nav-item"><a href="hotel.html" class="nav-link">Hotel</a></li>
					<!-- 추가 및 변경 시작 부분-->
					<li class="nav-item dropdown show"><a href="free_board.html" class="nav-link">Community</a>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						  <a class="dropdown-item" href="free_board.html">자유 게시판</a>
						  <a class="dropdown-item" href="review.html">후기</a>
						  <a class="dropdown-item" href="#">blog#3</a>
						</div>
					  </li>        
					 <!-- 추가 및 변경 끝 부분-->
					<li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
				</ul>
				<label id="darkmodecheck" class="cbbgc">
					<input type="checkbox" id="checkBoxId" checked>
					<span id="moonsun">
						<ion-icon name='sunny-outline'></ion-icon>
					</span>
				</label>
			</div>
		</div>
	</nav>
 <!-- END nav -->
 <!-- 다크모드 애니 -->
	<section class="skybird" id="sky">
	    <span></span>
	    <span></span>
	    <span></span>
	    <span></span>
	    <span></span>
	    <span></span>
	    <span></span>
	    <span></span>
	    <span></span>
	    <span></span>
	    <div class="bird-container bird-container-one">
	      <div class="bird bird-one"></div>
	    </div>
	    <div class="bird-container bird-container-two">
	        <div class="bird bird-two"></div>
	    </div>
	    <div class="bird-container bird-container-three">
	        <div class="bird bird-three"></div>
	    </div>
	    <div class="bird-container bird-container-four">
	        <div class="bird bird-four"></div>
	    </div>
	</section>
	
</body>

</html>
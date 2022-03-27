<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 
<link rel="stylesheet" href="<c:url value="resources/css/style2.css"/>"/>

</head>
<body>

	
<body>
	<div class="main">
		<div class="logo">
			로고 사진
		</div>
	</div>
	<div class="div1">
		<span></span>
		<p>캠핑장</p>
		<p>구역A</p>
		<p>2022.03.04~2022.03.05(토)|1박</p>
		<p>체크인 10:00 | 체크아웃 13:00</p><br><br><br>
		<p class="right">80,000원</p>
		
	</div>
	<div class="div2">
		<div class="div2-1">
			<div class="div2-2">
				<p>예약자 정보</p>
			</div>
		</div>
		<div class="div2-3">
			<div class="div2-4">
				<label required class="div2-4-la">
					성명
				</label>
				<div class="div2-5">
					<div style="width:100%">
						<div class="div2-6">
							<input type="text" placeholder="성명을 입력해주세요." name="authInfo.name_" value="" autocorrect="off" autocapitalize="none" class="div2-6-in">
						</div>
					</div>
				</div>
			</div>
			<div class="div2-7">
				<label required class="div2-7-la">
					휴대폰 번호
				</label>
				<div class="div2-8">
					<button type="button" height="32" class="div2-8-btn" style="margin-top:0.7rem" data-testid="button">인증하기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="div3">
		<div class="div2-1">
			<div class="div2-2">
				<p>금액 및 할인 정보</p>
			</div>
		</div>
		<div class="div3-1">
			<div class="div3-2">
				기본금액
			</div>
			<div class="div3-3">
				80,000원
			</div>
		</div>	
		<div class="div3-1">
			<div class="div3-2">
				할인 금액
			</div>
			<div class="div3-3">
				20,000원
			</div>
		</div>	
		<div class="div3-1">
			<div class="div3-2">
				총 예약 금액
			</div>
			<div class="div3-3">
				60,000원
			</div>
		</div>
	</div>
	<div class="div4">
		<div class="div2-1">
			<div class="div2-2">
				<p>결제 수단 선택</p>
			</div>
		</div>
		<div class="div4-1">
			<ul>
				<li>
					<label><input type="radio" id="radio"/>카카오 페이</label>
					<label><input type="radio" id="radio"/>신용 카드</label>
					<label><input type="radio" id="radio"/>계좌 이체</label>
				</li>
			</ul>
			<ul>
				<li>
					<label><input type="radio" id="radio"/>네이버 페이</label>
					<label><input type="radio" id="radio"/>페이코</label>
					<label><input type="radio" id="radio"/>휴대폰</label>
				</li>
			</ul>
		</div>
	</div>
 	<button id="btn">결제하기</button>
 
 	
		
		





<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.waypoints.min.js"></script>
<script src="resources/js/jquery.stellar.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/jquery.animateNumber.min.js"></script>
<script src="resources/js/bootstrap-datepicker.js"></script>
<script src="resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="resources/js/google-map.js"></script>
<script src="resources/js/main.js"></script>

</body>
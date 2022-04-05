<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form name="idfindscreen">
		<div class = "search-title">
			<h3>휴대폰 본인확인</h3>
		</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="name" class = "btn-name" placeholder = "등록한 이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호</label>
				<input type="number"  name="phone" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력">
			</div>
				<br>
		</section>
		<div class ="btnSearch">
			<input type="button" name="enter" value="찾기"  onClick="id_search()">
			<input type="button" name="cancle" value="취소" onClick="history.back()">
	 	</div>
	 </form>
	 
<script src="<c:url value="/resources/js/findid.js?after"/>"></script>
</body>
</html>
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
      <c:choose>
      	<c:when test="${!empty id }">
      		<div class = "container">
      			<div class = "found-success">
	      			<h4>  회원님의 아이디는 </h4>  
	      			<div class ="found-id">${id }</div>
	      			<h4>  입니다 </h4>
	   		   </div>
	     		<div class = "found-login">
 		    		<a href="./login">로그인</a>
       			</div>
       		</div>	
      	</c:when>
      	<c:when test="${empty id }">
      		 <div class = "container">
		      	<div class = "found-fail">
			      <h4>  등록된 정보가 없습니다 </h4>  
			     </div>
			     <div class = "found-login">
		 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
		 		    <a href="./signin"></a>
		       	</div>
		       </div>  
      	</c:when>
      </c:choose>
</body>
</html>
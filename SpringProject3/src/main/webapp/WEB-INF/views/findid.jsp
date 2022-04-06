<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="<c:url value="/resources/css/findid.css?after"/>" rel="stylesheet" />
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
</head>
<body style="overflow-x: hidden">
	<jsp:include page='renewal_nav.jsp'/>


<section class="wrap">
	<div class="container-lg bb mb-5">
	<div class="sub_title">
		<div class="tit mb-2">본인 확인</div>
		<div class="txt">휴대폰 인증</div>
	</div>
</div>
</section>

<div id ="contants" style="padding-top: 76px" class="container-lg lbb">
	<div class="row row1">
    <form name="idfindscreen">
    <table class="table">
     <tr>
       <th class="text-right danger" width="15%">이름</th>
       <td width=85%>
         <input type="text" name="name" class="input-sm" placeholder = "등록한 이름">
       </td>
     </tr>
     <tr>
       <th class="text-right danger" width="15%">번호</th>
       <td width=85%>
         <input type="number" name="phone" class="input-sm"  id="pwd" placeholder = "휴대폰번호를 '-'없이 입력">
       </td>
     </tr>
     <td colspan="2" class="text-center">
         <input type=button name="enter" value="찾기" class="btn btn-sm btn-danger" onClick="id_search()">
         <input type=button name="cancle" value="취소" class="btn btn-sm btn-warning" onClick="history.back()"
           onclick="javascript:history.back()"
         >
       </td>
    </table>
    </form>
  </div>
</div>
    


<!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- 다크모드 js-->
	<script src="<c:url value="/resources/js/main_ani.js"/>"></script>
	<script src="<c:url value="/resources/js/anime.min.js"/>"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="<c:url value="/resources/js/darkmode.js"/>"></script>
    <!-- 모달 JS -->
    <script src="<c:url value="/resources/js/modal.js"/>"></script>



<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>	 
<script src="<c:url value="/resources/js/findid.js?after"/>"></script>
</body>
</html>
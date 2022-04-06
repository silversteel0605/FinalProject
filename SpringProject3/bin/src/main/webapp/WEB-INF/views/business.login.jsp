<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- header css -->
<link rel="stylesheet" href="<c:url value="/resources/css/renewal_nav.css"/>"/>
<!--다크모드 관련 css-->
<link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
<!-- 모달 css -->
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>"/>
<!-- 페이지 css -->
<link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/jangDarkMode.css"/>"/>
<style>
.login {
  width: 410px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}
.login h2 {
  padding: 0 0 20px;
  border-bottom: 2px solid #111;
  text-align: center;
  line-height: 1;
  font-size: 32px;
  color: #111;
}
.login > ul {
  padding: 40px 0 33px;
}
.login > ul li {
  padding: 0 0 12px;
  text-align: left;
}
.login > ul li input {
  width: 100%;
  height: 46px;
  box-sizing: border-box;
  text-indent: 16px;
}
.login > ul li input::-webkit-input-placeholder {
  font-size: 16px;
  color: #9fa19f;
}
.login > ul li input[type="checkbox"] {
  position: absolute;
  left: -3000%;
}
.login > ul li input[type="checkbox"] + label {
  height: 36px;
  line-height: 36px;
}
.login > ul li input[type="checkbox"] + label:before {
  content: "";
  display: inline-block;
  margin: 0 10px 0 0;
  width: 18px;
  height: 18px;
  border: 1px solid #666;
  background: #fff;
  vertical-align: -5px;
}
.login > ul li input[type="checkbox"]:checked + label:before {
  background: url("") no-repeat center #333;
  border-color: #333;
}

.login div {
  padding: 0 0 45px;
}
.login div ul {
  display: flex;
  justify-content: center;
}
.login div ul li {
  position: relative;
  padding: 0 18px;
}
.login div ul li ~ li:after {
  content: "";
  position: absolute;
  left: 0;
  top: 4px;
  height: 14px;
  width: 1px;
  background: #111;
  transform: rotate(25deg);
}
.login div ul li a {
  font-size: 14px;
  color: #111;
}
.login > a {
  font-size: 14px;
  color: #666;
  border-bottom: 1px solid #666;
}
ul {
  list-style: none;
  padding-left: 0px;
}
</style>
</head>
<body style="overflow-x: hidden">
<!-- header 호출 -->
<jsp:include page='renewal_nav.jsp'/>
<!-- /header 호출 -->
  <section class="login section" id ="contants" style="padding-top: 76px">
      <h2>캠핑장 운영자 로그인</h2>
      <ul>
        <form id="login">
          <li>
            <input
              required
              id="userid"
              type="text"
              placeholder="아이디"
              name="userid"
            />
          </li>
          <li>
            <input
              required
              id="userpw"
              type="password"
              placeholder="비밀번호"
              minlength="10"
              name="userpw"
            />
          </li>
          <li>
            <input type="checkbox" id="chk_id" name="chk_id" /><label
              for="chk_id"
              >아이디저장</label
            >
          </li>
          <li><input type="submit" value="로그인" id="join"/></li>
          <input type="hidden" value="1" id="member_type"/>
        </form>
      </ul>
      <div>
        <ul>
          <li><a href="./signin?member_type=1">회원가입</a></li>
          <li><a href="./findid">아이디 찾기</a></li>
          <li><a href="./findpw">비밀번호 찾기</a></li>
        </ul>
      </div>
    </section>
<!-- Footer -->
<!-- /Footer -->
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
<!-- 페이지 js -->
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/login.js"/>"></script>
<script src="<c:url value="/resources/js/jangDarkMode.js"/>"></script>
</body>
</html>
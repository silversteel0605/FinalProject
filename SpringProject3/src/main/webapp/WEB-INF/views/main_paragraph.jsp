<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Camping</title>
	<!-- header css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/renewal_nav.css"/>"/>
	<!--다크모드 관련 css-->
    <link rel="stylesheet" href="<c:url value="/resources/css/darkmode.css"/>"/>
    <!-- 모달 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>"/>
	<!-- 페이지 CSS-->
	<link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value="/resources/css/jangec.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/jang_main_paragraph.css"/>"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel="stylesheet" href="<c:url value="/resources/css/jangDarkMode.css"/>"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body style="overflow-x: hidden">
	
<!-- header 호출 -->
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
<!-- /Header -->
<section class="section" id ="contants" style="padding-top: 76px">
	<div class="container-lg">
		<div class="d-flex justify-content-center">
			<c:choose>
			<c:when test="${contents.board_class eq 0 }">
			<div class="mt-5 mb-5 d-flex flex-column">
				<p class="h1 text-center">B&nbsp;O&nbsp;A&nbsp;R&nbsp;D</p>
				<p class="text-center">마음껏&nbsp;즐기다</p>
			</div>
			</c:when>
			<c:otherwise>
			<div class="mt-5 mb-5 d-flex flex-column">
				<p class="h1 text-center">C&nbsp;O&nbsp;N&nbsp;T&nbsp;A&nbsp;C&nbsp;T</p>
				<p class="text-center">고객의&nbsp;소리에&nbsp;귀&nbsp;기울입니다</p>
			</div>
			</c:otherwise>
			</c:choose>
		</div>
		<div class="border-top mb-3 border-dark border-3"></div>
	</div>
	<div class="container-lg">
		<p class="fs-3">${contents.title }</p>
		<div class="paragraph_header d-flex justify-content-between">
			<span id="${contents.member_id }" class="userId pointer">${contents.member_id }</span>
			<div>
				<span id="report"></span>
				<span>${contents.reg_date }|</span>
				<span>조회수&nbsp;${contents.views }</span>
			</div>
		</div>
		<div class="border-top mb-3 border-dark border-1 seperator"></div>
		<div class="paragraph_body">
			<p>${contents.contents }</p>
		</div>
	</div>
	 <div class="container-lg">
		<div class="paragraph_comments">
			<div class="comments_header">
				<p>COMMENTS</p>
			</div>
			<div class="border-top mb-3 border-dark border-1 seperator"></div>
			<div class="comments_body mb-5" id="comments_body">
				<c:if test="${not empty commentsList }">
					<c:forEach items="${commentsList }" var="comment">
						<c:if test="${comment.classnum eq 0 }">
						<div id="${comment.comment_id }" class="mb-3 border-bottom">
							<span class="userId">${comment.member_id}</span><br/>
							<div class="d-flex justify-content-start">
								<p class="pe-3">${comment.comments}</p>
								<c:if test="${editAuth eq true }">
								<i id="comment_deleteBtn_${comment.comment_id}" class="bi bi-x-circle comment_icon"></i>
								<%-- <i id="comment_editBtn_${comment.comment_id }" class="bi bi-pen comment_icon"></i> --%>
								</c:if>
								<i id="co_comment_newBtn_${comment.comment_id}" class="bi bi-chat-dots comment_icon co_comment_newBtn"></i>
								<i id="co_commnet_reportBtn_${comment.comment_id }" class="bi bi-flag pointer"></i>
								<input id="comment_commentId_${comment.comment_id }" type="hidden" value="${comment.comment_id }" />
								<input id="comment_postId" type="hidden" value="${comment.post_id }" />
								<input id="comment_ordernum" type="hidden" value="${comment.ordernum }" />
								<input id="comment_categoryId" type="hidden" value="${comment.category_id }" />
							</div>
						</div>
						</c:if>
						<c:if test="${comment.classnum eq 1 }">
						<div id="${comment.comment_id }" class="mb-3 border-bottom offset-1">
							<span class="userId">${comment.member_id}</span><br/>
							<div class="d-flex justify-content-start">
								<p class="pe-3">${comment.comments}</p>
								<c:if test="${editAuth eq true }">
								<i id="comment_deleteBtn_${comment.comment_id}" class="bi bi-x-circle comment_icon"></i>
								<%-- <i id="comment_editBtn_${comment.comment_id }" class="bi bi-pen comment_icon"></i> --%>
								</c:if>
								<i id="co_comment_newBtn_${comment.comment_id}" class="bi bi-chat-dots comment_icon co_comment_newBtn"></i>
								<i id="co_comment_reportBtn_${comment.comment_id }" class="bi bi-flag pointer"></i>
								<input id="comment_commentId_${comment.comment_id }" type="hidden" value="${comment.comment_id }" />
								<input id="comment_postId" type="hidden" value="${comment.post_id }" />
								<input id="comment_ordernum" type="hidden" value="${comment.ordernum }" />
								<input id="comment_categoryId" type="hidden" value="${comment.category_id }" />
							</div>
						</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
			<!-- comments 입력 -->
			<div id="comment">
				<div class="form-floating">
				  <input type="hidden" class="commentForm" name="commentPostId" value="${contents.post_id }"/>
				  <input type="hidden" class="commentForm" name="commentBoardClass" value="${contents.board_class }"/>
				  <textarea class="form-control commentForm" placeholder="Leave a comment here" name="commentComments" id="commentTextarea"></textarea>
				  <label for="commentTextarea">Comments</label>
				</div>
				<div class="d-flex justify-content-end">
					<button id="comment_saveBtn" class="btn btn-outline-dark" type="button">저장</button>
				</div>
			</div>
			<!-- /comments 입력 -->
		</div>
		<div class="border-top mb-3 border-dark border-1 seperator"></div>
		<div class="paragraph_footer d-flex justify-content-between mb-5">
			<div>
				<button id="reportBtn" class="btn">신고</button>
			</div>
			<div>
				<c:if test="${editAuth eq true }">
					<button id="contentsEdit" class="btn">수정</button>
					<button id="contentsDelete" class="btn">삭제</button>
				</c:if>
				<input id="editAuth" type="hidden" value="${editAuth }" />
				<button id="goBoard" class="btn" onClick="goBoard(${contents.board_class })">목록</button>
			</div>
		</div>
	 </div>
		<!-- /컨텐츠 -->
</section>
<!-- 변수 -->
<input type="hidden" id="board_class" value="${contents.board_class }" />
<input type="hidden" id="post_id" value="${contents.post_id }" />
<input type="hidden" id="commentsEA" value="${commentsEA }" />
<input type="hidden" id="reportNum" value="${reportNum }"/>

<!-- Modal -->
<div id="popUpMenu" style="display:none;">
	<ul class="list-group list-group-flush">
		<li id="memberPost" class="indiPopUp list-group-item list-group-item-primary opacity-75" style="cursor:pointer"
		role="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">작성글 보기</li>
	</ul>
</div>

<div class="modal fade" id="staticBackdrop" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div id="individual" class="modal-body">
      </div>
      <div class="modal-footer">
        <button id="modalBtn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- /Modal -->
	
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
<!-- 개인 JS -->
<script src="<c:url value="/resources/js/jang_main_paragraph.js"/>"></script>
<script src="<c:url value="/resources/js/jangec.js"/>"></script>
<script src="<c:url value="/resources/js/jangDarkMode.js"/>"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
function goBoard(board_class) {
	if (board_class == 0) {
		location.href = `/project/board`	
	} else if (board_class == 1) {
		location.href = `/project/support`
	}
}

// 게시글 삭제
const contentsDelete = document.getElementById('contentsDelete');
const contentsClassNumber = document.getElementById('board_class').value;
if (contentsClassNumber == 0) {
	contentsClass = 'board';
} else if (contentsClassNumber == 1) {
	contentsClass = 'support';
}

contentsDelete.addEventListener('click', (e) => {
	Swal.fire({
		title: '삭제하시겠습니까?',
		text: '복구가 불가능합니다',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Yes'
	}).then((result) => {
		if (result.isConfirmed) {
  			location.href = `/project/${contentsClass}?delete=true`
  		}
	})
});

// 코멘트 저장

const xhttpComments = new XMLHttpRequest();
const comment_saveBtn = document.getElementById('comment_saveBtn');

comment_saveBtn.addEventListener('click', (e) => {
	
	console.log('저장버튼 눌림');
	const comments = document.querySelectorAll('#comment .commentForm');
	const newCommentData = {
		post_id: comments[0].value,
		category_id: comments[1].value,
		comments: comments[2].value,
		classnum: 0,
		ordernum: 0
	}
	xhttpComments.open('POST', '/project/main_paragraph', true);
	xhttpComments.setRequestHeader('content-type', 'application/json;charset=utf-8');
	xhttpComments.send(JSON.stringify(newCommentData));
	
	comments[2].value = null;
	
});

const comments_body = document.getElementById('comments_body');

xhttpComments.addEventListener('readystatechange', (e) => {
	const readyState = e.target.readyState;
	const status = e.target.status;
	
	console.log('readystate: ', readyState);
    console.log('httpstatus: ', status);
    
    if (readyState == 1) {
		console.log('비동기 연결을 서버로 전송함(수립)');	
	} else if (readyState == 2) {
		console.log('서버가 내 요청을 받았음');
	} else if (readyState == 3) {
		console.log('서버가 내 요청에 대한 처리를 시작함');
	} else if (readyState == 4 && status == 200)  {
		console.log('요청에 대한 처리가 끝난 후 응답이 도착함');
		console.log('readyState가 4번이므로 데이터 처리를 시작');
		console.log("responseText: ", e.target.responseText);
		
		const comment = JSON.parse(e.target.responseText);
		console.log('post_id: ', comment.post_id);
		console.log('comments: ', comment.comments);
		console.log('category_id: ', comment.category_id);
		console.log('member_id: ', comment.member_id);
		
		comments_body.innerHTML += mkComment(comment.member_id, comment.comments);
		
	}
	
});

// 코코멘트
const co_comment_newBtn = document.getElementById('co_comment_newBtn');
const co_comment_saveBtn = document.getElementById('co_comment_saveBtn');
const co_comment_cancelBtn = document.getElementById('co_comment_cancelBtn');


co_comment_saveBtn.addEventListener('click', (e) => {
	co_comment.style.display = 'none';
});

co_comment_cancelBtn.addEventListener('click', (e) => {
	co_comment.style.display = 'none';
});

// https://hianna.tistory.com/484 참고해서 다시 만들기

function mkComment(member_id, comments) {
	return `<div class="md-3">
				<span class="userId">${member_id}</span><br/>
				<div class="d-flex justify-content-start">
					<p>${comments}</p>
					<i class="bi bi-x-circle comment_icon"></i>
					<i id="co_comment_addBtn" class="bi bi-pen comment_icon"></i>
					<i id="co_comment_newBtn" class="bi bi-chat-dots comment_icon"></i>
				</div>
			</div>`;
}

function mkCoComment(member_id, comments) {
	return `<div class="md-3">
				<span class="userId">${member_id}</span><br/>
				<div class="d-flex justify-content-start">
					<p>${comments}</p>
					<i class="bi bi-x-circle comment_icon"></i>
					<i id="co_comment_addBtn" class="bi bi-pen comment_icon"></i>
					<i id="co_comment_newBtn" class="bi bi-chat-dots comment_icon"></i>
				</div>
			</div>`;
}



















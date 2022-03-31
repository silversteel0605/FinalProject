const post_id = document.getElementById('post_id').value;
const board_class = document.getElementById('board_class').value;

function goBoard(board_class) {
	if (board_class == 0) {
		location.href = `/project/board`	
	} else if (board_class == 1) {
		location.href = `/project/support`
	}
}

// 게시글 삭제
const editAuth = document.getElementById('editAuth').value;
console.log('edit권한: ', editAuth);
if (editAuth) {
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
}

// 코멘트 저장

const xhttpComments = new XMLHttpRequest();
const comment_saveBtn = document.getElementById('comment_saveBtn');

comment_saveBtn.addEventListener('click', (e) => {
	
	const comments = document.querySelectorAll('#comment .commentForm');
	const newCommentData = {
		post_id: comments[0].value,
		category_id: comments[1].value,
		comments: comments[2].value,
		classnum: 0,
		ordernum: 0
	}
	xhttpComments.open('POST', '/project/rest/main_paragraph', true);
	xhttpComments.setRequestHeader('content-type', 'application/json;charset=EUC-KR');
	xhttpComments.send(JSON.stringify(newCommentData));
	
	comments[2].value = null;
	
});

const comments_body = document.getElementById('comments_body');

xhttpComments.addEventListener('readystatechange', (e) => {
	console.log('확인');
	const readyState = e.target.readyState;
	const status = e.target.status;
	console.log('readyState: ', readyState);
	console.log('status: ', status);
	
  	if (readyState == 1) {
		console.log('비동기 연결을 서버로 전송함 (수립)');	
	} else if (readyState == 2) {
		console.log('서버가 내 요청을 받았음');
	} else if (readyState == 3) {
		console.log('서버가 내 요청에 대한 처리를 시작함');
	}	else if (readyState == 4 && status == 200)  {
		const comment = JSON.parse(e.target.responseText);
		
		if (comment.classnum == 0) {
			console.log(comment);
			comments_body.innerHTML += 
				mkComment (
						comment.member_id, comment.comments, comment.comment_id, comment.post_id, comment.ordernum, comment.category_id
					);
		}
	}
	
});

// 코코멘트

/* 코코멘트 input 생성 */
const co_comment_input = document.getElementById('co_comment_input');

document.addEventListener('click', (e) => {
	const commentsEA = document.querySelector('#commentsEA').value;
	console.log(commentsEA)
	if (commentsEA > 0) {
		const targetClass = e.target.className.substring('bi bi-chat-dots comment_icon '.length);
		const targetCommentId = e.target.id.substring('co_comment_newBtn_'.length); // comment_id
		const targetInput = document.getElementById(targetCommentId); //대댓글 div
		const targetPostId = document.getElementById('post_id').value; // post_id
		const targetOrdernum = document.getElementById('comment_ordernum').value; // ordernum
		const targetCategoryId = document.getElementById('comment_categoryId').value; //category_id
		const compare_co_comment_newBtn = 'co_comment_newBtn';
		const beforeInput = document.getElementById('co_commentInput'); // 이전 생성된 대댓글 input
		
		
		console.log('타켁id: ', targetCommentId);
		console.log('targetInput: ', targetInput)
		console.log('클릭클래스이름: ', targetClass);
		console.log('일치대상문자열: ', compare_co_comment_newBtn);
		console.log('클릭아이디: ', targetCommentId);
		console.log('post+id: ', targetPostId);	
		console.log('ordernum: ', targetOrdernum);
		console.log('categoryId: ', targetCategoryId);
		
		if (targetClass == compare_co_comment_newBtn) {
			
			if (beforeInput) {
				console.info('null 들어옴');
				beforeInput.remove();
			}
			
			targetInput.appendChild(mkCoCommentInput(targetCommentId));
			/* /코코멘트 input 생성 */
			
			/* 코코멘트 저장 */
			div2_savBtn.addEventListener('click', (e) => {
				
				const coCommentContents = document.getElementById('coCommentTextarea').value;
				
				console.log('종속된 post_id: ', targetPostId);
				console.log('종속된 comment_id', targetCommentId);
				console.log('대댓글 내용: ', coCommentContents);
				console.log('classnum: ', 1);
				console.log('ordernum: ', parseInt(targetOrdernum) + 1);
				console.log('groupnum: ', targetCommentId);
				console.log('categoryId: ', targetCategoryId);
				const tempTargetCommentId = targetCommentId;
				const newCoCommentData = {
					comment_id: targetCommentId,
					post_id: targetPostId,
					category_id: targetCategoryId,
					comments: coCommentContents,
					classnum: 1,
					ordernum: parseInt(targetOrdernum) + 1,
					groupnum: targetCommentId
				}
				
				xhttpComments.open('POST', '/project/rest/main_paragraph', true);
				xhttpComments.setRequestHeader('content-type', 'application/json;charset=utf-8');
				xhttpComments.send(JSON.stringify(newCoCommentData));
				
				//코코멘트 출력
				const targetCommentDiv = document.getElementById(tempTargetCommentId);
				console.log('tempTargetCommentId: ', tempTargetCommentId);
				xhttpComments.addEventListener('readystatechange', (e) => {
					const readyState = e.target.readyState;
					const status = e.target.status;
					if (readyState == 4 && status == 200)  {
						const comment = JSON.parse(e.target.responseText);
						console.log(comment);
						targetCommentDiv.innerHTML += mkComment(comment.member_id, comment.comments, comment.comment_id);
					}
				});
				beforeInput.style.display = 'none';
			});
		}
		
	}
	
});

function mkComment(member_id, comments, comment_id, post_id, ordernum, category_id) {
	return `<div id=${comment_id} class="mb-3 border-bottom">
				<span class="userId">${member_id}</span><br/>
				<div class="d-flex justify-content-start">
					<p>${comments}</p>
					<i class="bi bi-x-circle comment_icon"></i>
					<i id="comment_editBtn_${comment_id}" class="bi bi-pen comment_icon comment_editBtn"></i>
					<i id="co_comment_newBtn_${comment_id}" class="bi bi-chat-dots comment_icon co_comment_newBtn"></i>
					<input id="comment_commentId_${comment_id }" type="hidden" value="${comment_id }" />
					<input id="comment_postId" type="hidden" value="${post_id }" />
					<input id="comment_ordernum" type="hidden" value="${ordernum }" />
					<input id="comment_categoryId" type="hidden" value="${category_id }" />
				</div>
			</div>`;
}

function mkCoCommentInput(comment_id) {
	const coCommentInput = document.createElement('div');
	const innerDiv1 = document.createElement('div');
	const div1_textarea = document.createElement('textarea');
	const div1_label = document.createElement('label');
	const innerDiv2 = document.createElement('div');
	const div2_savBtn = document.createElement('button');
	const div2_cancelBtn = document.createElement('button');
	const commentIdHidden = document.createElement('input');
	
	coCommentInput.setAttribute('id', 'co_commentInput');
	coCommentInput.setAttribute('class', 'co_commentInput');
	innerDiv1.setAttribute('class', 'form-floating');
	innerDiv1.setAttribute('id', 'innerDiv1');
	div1_textarea.setAttribute('class', 'form-control');
	div1_textarea.setAttribute('placeholder', 'Leave a Comment');
	div1_textarea.setAttribute('id', 'coCommentTextarea');
	div1_label.setAttribute('id', 'div1_label');
	div1_label.setAttribute('for', 'coCommentTextarea');
	div1_label.appendChild(textNode('Comments'));
	innerDiv2.setAttribute('id', 'innerDiv2');
	innerDiv2.setAttribute('class', 'd-flex justify-content-end');
	div2_savBtn.setAttribute('id', 'div2_savBtn');
	div2_savBtn.setAttribute('class', 'btn btn-outline-success co_comment_saveBtn');
	div2_savBtn.appendChild(textNode('저장'));
	div2_cancelBtn.setAttribute('id', 'div2_cancelBtn');
	div2_cancelBtn.setAttribute('class', 'btn btn-outline-success co_comment_cancelBtn');
	div2_cancelBtn.appendChild(textNode('취소'));
	commentIdHidden.setAttribute('type', 'hidden');
	commentIdHidden.setAttribute('value', comment_id);
	
	coCommentInput.appendChild(innerDiv1).appendChild(div1_textarea);
	coCommentInput.appendChild(innerDiv1).appendChild(div1_label);
	coCommentInput.appendChild(innerDiv2).appendChild(div2_savBtn);
	coCommentInput.appendChild(innerDiv2).appendChild(div2_cancelBtn);
	coCommentInput.appendChild(commentIdHidden);
	
	return coCommentInput;
}

function textNode(str) {
	return document.createTextNode(str);
}

// 게시글 수정
const contentsEdit = document.getElementById('contentsEdit');
contentsEdit.addEventListener('click', (e) => {
	console.log('나 클릭됐어');
	location.href = `./write?post_id=${post_id}&edit=true&board_class=${board_class}&edit=true`;
});







const post_id = document.getElementById('post_id').value;
const board_class = document.getElementById('board_class').value;

function goBoard(board_class) {
	if (board_class == 0) {
		location.href = `/project/board`	
	} else if (board_class == 1) {
		location.href = `/project/support`
	}
}

function getCookie(cname) { 						// 다크모드        
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    console.log('c: ', c);
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
      console.log('while안의 c: ', c);
    }
    if (c.indexOf(name) == 0) {
      console.log('if안의 c: ', c);
      console.log('c.substring(name.length, c.length): ', c.substring(name.length, c.length))
      return c.substring(name.length, c.length);
    }
  }
  return "";
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
	const readyState = e.target.readyState;
	const status = e.target.status;
	
	if (readyState == 4 && status == 200)  {
		const comment = JSON.parse(e.target.responseText);
		
		if (comment.classnum == 0) {
			
			if (getCookie('DarkMode') == 'N') {
				
				comments_body.innerHTML += mkComment (
							comment.member_id, comment.comments, comment.comment_id, comment.post_id, comment.ordernum, comment.category_id
						);
			} else if (getCookie('DarkMode') == 'Y') {
				comments_body.innerHTML += mkCommentDark (
							comment.member_id, comment.comments, comment.comment_id, comment.post_id, comment.ordernum, comment.category_id
						);
			}
		}
	}
	
});

// 코코멘트

/* 코코멘트 input 생성 */
const co_comment_input = document.getElementById('co_comment_input');

document.addEventListener('click', (e) => {
	console.log('e.target.id: ', e.target.id);
	const commentsEA = document.querySelector('#commentsEA').value;
	console.log('commentsEA: ', commentsEA);
	
	if (commentsEA > 0) {
		const targetClass = e.target.className.substring('bi bi-chat-dots comment_icon '.length, 'bi bi-chat-dots comment_icon co_comment_newBtn'.length);
		const targetCommentId = e.target.id.substring('co_comment_newBtn_'.length); // comment_id
		const targetInput = document.getElementById(targetCommentId); //대댓글 div
		const targetPostId = document.getElementById('post_id').value; // post_id
		const targetOrdernum = document.getElementById('comment_ordernum').value; // ordernum
		const targetCategoryId = document.getElementById('comment_categoryId').value; //category_id
		const compare_co_comment_newBtn = 'co_comment_newBtn';
		const previousInput = document.getElementById('co_commentInput'); // 이전 생성된 대댓글 input
		
		console.log('cocoment in1');
		console.log('targetClass: ', targetClass);
		if (targetClass == compare_co_comment_newBtn) {
		console.log('cocoment in2');
			
			if (previousInput) {
				previousInput.remove();
			}
			
			
			if (getCookie('DarkMode') == 'N') {
				targetInput.appendChild(mkCoCommentInput(targetCommentId));
	 		} else if (getCookie('DarkMode') == 'Y') {
				targetInput.appendChild(mkCoCommentInputDark(targetCommentId));
			}
			/* /코코멘트 input 생성 */
			
			const div2_savBtn = document.getElementById('div2_savBtn');
			const div2_cancel = document.getElementById('div2_cancelBtn');
			const beforeInput = document.getElementById('co_commentInput');
			
			/* 코코멘트 저장 */
			div2_savBtn.addEventListener('click', (e) => {
				const coCommentContents = document.getElementById('coCommentTextarea').value;
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
				xhttpComments.addEventListener('readystatechange', (e) => {
					const readyState = e.target.readyState;
					const status = e.target.status;
					if (readyState == 4 && status == 200)  {
						const comment = JSON.parse(e.target.responseText);
						console.log(comment);
						
						if (getCookie('DarkMode') == 'N') {
							targetCommentDiv.innerHTML += mkCoComment(comment.member_id, comment.comments, comment.comment_id);
						} else if (getCookie('DarkMode') == 'Y') {
							targetCommentDiv.innerHTML += mkCoCommentDark(comment.member_id, comment.comments, comment.comment_id);
						}
					}
				});
				beforeInput.remove();
			});
			
			div2_cancel.addEventListener('click', (e) => {
				beforeInput.remove();
			});
		}
		
	}
	
});

function mkComment(member_id, comments, comment_id, post_id, ordernum, category_id) {
	return `<div id=${comment_id} class="mb-3 border-bottom">
				<span class="userId">${member_id}</span><br/>
				<div class="d-flex justify-content-start">
					<p class="pe-3">${comments}</p>
					<i id="comment_deleteBtn_${comment_id}" class="bi bi-x-circle comment_icon"></i>
					<i id="co_comment_newBtn_${comment_id}" class="bi bi-chat-dots comment_icon co_comment_newBtn"></i>
					<i id="co_comment_reportBtn_${comment_id }" class="bi bi-flag pointer"></i>
					<input id="comment_commentId_${comment_id }" type="hidden" value="${comment_id }" />
					<input id="comment_postId" type="hidden" value="${post_id }" />
					<input id="comment_ordernum" type="hidden" value="${ordernum }" />
					<input id="comment_categoryId" type="hidden" value="${category_id }" />
				</div>
			</div>`;
}

function mkCommentDark (member_id, comments, comment_id, post_id, ordernum, category_id) {
	return `<div id=${comment_id} class="mb-3 border-bottom darkmodeDiv">
				<span class="userId darkmodeFont">${member_id}</span><br/>
				<div class="d-flex justify-content-start">
					<p class="pe-3 darkmodeFont">${comments}</p>
					<i id="comment_deleteBtn_${comment_id}" class="bi bi-x-circle comment_icon darkmodeFont"></i>
					<i id="co_comment_newBtn_${comment_id}" class="bi bi-chat-dots comment_icon co_comment_newBtn darkmodeFont"></i>
					<i id="co_comment_reportBtn_${comment_id }" class="bi bi-flag pointer darkmodeFont"></i>
					<input id="comment_commentId_${comment_id }" type="hidden" value="${comment_id }" class="darkmodeDiv darkmodeFont" />
					<input id="comment_postId" type="hidden" value="${post_id }" class="darkmodeDiv darkmodeFont" />
					<input id="comment_ordernum" type="hidden" value="${ordernum }" class="darkmodeDiv darkmodeFont" />
					<input id="comment_categoryId" type="hidden" value="${category_id }" class="darkmodeDiv darkmodeFont" />
				</div>
			</div>`;
}

function mkCoComment(member_id, comments, comment_id, post_id, ordernum, category_id) {
	return `<div id=${comment_id} class="mb-3 border-bottom offset-1">
				<span class="userId">${member_id}</span><br/>
				<div class="d-flex justify-content-start">
					<p class="pe-3 darkmodeFont">${comments}</p>
					<i id="comment_deleteBtn_${comment_id}" class="bi bi-x-circle comment_icon darkmodeFont"></i>
					<i id="co_comment_newBtn_${comment_id}" class="bi bi-chat-dots comment_icon co_comment_newBtn darkmodeFont"></i>
					<i id="co_comment_reportBtn_${comment_id }" class="bi bi-flag pointer darkmodeFont"></i>
					<input id="comment_commentId_${comment_id }" type="hidden" value="${comment_id }" class="darkmodeFont darkmodeDiv" />
					<input id="comment_postId" type="hidden" value="${post_id }" class="darkmodeFont darkmodeDiv" />
					<input id="comment_ordernum" type="hidden" value="${ordernum }" class="darkmodeFont darkmodeDiv" />
					<input id="comment_categoryId" type="hidden" value="${category_id }" class="darkmodeFont darkmodeDiv" />
				</div>
			</div>`;
}

function mkCoCommentDark(member_id, comments, comment_id, post_id, ordernum, category_id) {
	return `<div id=${comment_id} class="mb-3 border-bottom offset-1 darkmodeDiv">
				<span class="userId darkmodeFont">${member_id}</span><br/>
				<div class="d-flex justify-content-start">
					<p class="pe-3 darkmodeFont">${comments}</p>
					<i id="comment_deleteBtn_${comment_id}" class="bi bi-x-circle comment_icon darkmodeFont"></i>
					<i id="co_comment_newBtn_${comment_id}" class="bi bi-chat-dots comment_icon co_comment_newBtn darkmodeFont"></i>
					<i id="co_comment_reportBtn_${comment_id }" class="bi bi-flag pointer darkmodeFont"></i>
					<input id="comment_commentId_${comment_id }" type="hidden" value="${comment_id }" class="darkmodeFont darkmodeDiv" />
					<input id="comment_postId" type="hidden" value="${post_id }" class="darkmodeFont darkmodeDiv" />
					<input id="comment_ordernum" type="hidden" value="${ordernum }" class="darkmodeFont darkmodeDiv" />
					<input id="comment_categoryId" type="hidden" value="${category_id }" class="darkmodeFont darkmodeDiv" />
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

function mkCoCommentInputDark(comment_id) {
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
if (contentsEdit != null) {
	contentsEdit.addEventListener('click', (e) => {
		location.href = `./write?post_id=${post_id}&edit=true&board_class=${board_class}&edit=true`;
	});
}

// 게시글 신고
const reportBtn = document.getElementById('reportBtn');
const report = document.getElementById('report');
const xhttpReport = new XMLHttpRequest();
report.innerHTML = `신고&nbsp${document.getElementById('reportNum').value}|`

reportBtn.addEventListener('click', (e) => {
		Swal.fire({
			title: '신고하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Yes'
		}).then((result) => {
			if (result.isConfirmed) {
	  			xhttpReport.open('PUT', `/project/rest/main_paragraph?post_id=${post_id}`)
	  			xhttpReport.send();
	  		}
		})
});

xhttpReport.addEventListener('readystatechange', (e) => {
	const readyState = e.target.readyState;
	const status = e.target.status;
	
	if (readyState == 4 && status == 200)  {
		const reportNum = JSON.parse(e.target.responseText);		
		report.innerHTML = `조회수&nbsp;${reportNum}|`;
	}
});

// 게시글 삭제
const xhttpDelete = new XMLHttpRequest();
let deleteObject = null;
const compareStr = 'comment_deleteBtn_';
const compareReport = 'co_comment_reportBtn_';
document.addEventListener('click', (e) => {
	if (e.target.id.substr(0, compareStr.length) === compareStr) {
		Swal.fire({
			title: '삭제하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Yes'
		}).then((result) => {
			if (result.isConfirmed) {
				const commentId = e.target.id.substring(compareStr.length);
				deleteObject = document.getElementById(e.target.id);
				xhttpDelete.open('DELETE', `/project/rest/comments?commentId=${commentId}`);
				xhttpDelete.send();
	  		}
		})
	}

	
});

xhttpDelete.addEventListener('readystatechange', (e) => {
	const readyState = e.target.readyState;
	const status = e.target.status;
	if (readyState == 4 && status == 200)  {
		
		deleteObject.parentNode.parentNode.remove();
	}
});

// 코멘트 신고
document.addEventListener('click', (e) => {
		
	if (e.target.id.substr(0, compareReport.length) === compareReport) {
		Swal.fire({
			title: '신고하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Yes'
		}).then((result) => {
			if (result.isConfirmed) {
	  			console.log('report');
	  			xhttpReport.open('PUT', `/project/rest/comments?post_id=${post_id}`)
	  			xhttpReport.send();
	  		}
		})
	}
});




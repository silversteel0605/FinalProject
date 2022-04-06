<<<<<<< HEAD
const post_id = document.getElementById('post_id').value;
const board_class = document.getElementById('board_class').value;

function goBoard(board_class) {
	if (board_class == 0) {
		location.href = `/project/board`	
	} else if (board_class == 1) {
		location.href = `/project/support`
	}
}

// °Ô½Ã±Û »èÁ¦
const editAuth = document.getElementById('editAuth').value;
console.log('edit±ÇÇÑ: ', editAuth);
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
			title: '»èÁ¦ÇÏ½Ã°Ú½À´Ï±î?',
			text: 'º¹±¸°¡ ºÒ°¡´ÉÇÕ´Ï´Ù',
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

// ÄÚ¸àÆ® ÀúÀå

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
=======
function goBoard(board_class) {
	if (board_class == 0) {
		location.href = `/project/board`	
	} else if (board_class == 1) {
		location.href = `/project/support`
	}
}

// °Ô½Ã±Û »èÁ¦
const editAuth = document.getElementById('editAuth').value;
console.log('edit±ÇÇÑ: ', editAuth);
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
			title: '»èÁ¦ÇÏ½Ã°Ú½À´Ï±î?',
			text: 'º¹±¸°¡ ºÒ°¡´ÉÇÕ´Ï´Ù',
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

// ÄÚ¸àÆ® ÀúÀå

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
	xhttpComments.open('POST', '/project/main_paragraph', true);
	xhttpComments.setRequestHeader('content-type', 'application/json;charset=utf-8');
>>>>>>> refs/heads/master
	xhttpComments.send(JSON.stringify(newCommentData));
	
	comments[2].value = null;
	
});

const comments_body = document.getElementById('comments_body');

xhttpComments.addEventListener('readystatechange', (e) => {
	console.log('È®ÀÎ');
	const readyState = e.target.readyState;
	const status = e.target.status;
	console.log('readyState: ', readyState);
	console.log('status: ', status);
	
  	if (readyState == 1) {
		console.log('ºñµ¿±â ¿¬°áÀ» ¼­¹ö·Î Àü¼ÛÇÔ (¼ö¸³)');	
	} else if (readyState == 2) {
		console.log('¼­¹ö°¡ ³» ¿äÃ»À» ¹Þ¾ÒÀ½');
	} else if (readyState == 3) {
		console.log('¼­¹ö°¡ ³» ¿äÃ»¿¡ ´ëÇÑ Ã³¸®¸¦ ½ÃÀÛÇÔ');
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
=======
<<<<<<< HEAD
const comments_body = document.getElementById('comments_body');

xhttpComments.addEventListener('readystatechange', (e) => {
	const readyState = e.target.readyState;
	const status = e.target.status;
	if (readyState == 4 && status == 200)  {
		const comment = JSON.parse(e.target.responseText);
		
		if (comment.classnum == 0) {
			console.log(comment);
			comments_body.innerHTML += 
				mkComment (
						comment.member_id, comment.comments, comment.comment_id, comment.post_id, comment.ordernum, comment.category_id
					);
		}
	}
<<<<<<< HEAD
=======
=======
const contentsDelete = document.getElementById('contentsDelete');
contentsDelete.addEventListener('click', (e) => {
	Swal.fire({
		template: '#deleteModal'
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire(
				document.getElementById('deleteForm').submit()
<<<<<<< HEAD

			)
		}
=======
		)}
>>>>>>> refs/heads/master
	})
>>>>>>> branch 'john' of https://github.com/leejohn0038/LastProject.git
<<<<<<< HEAD
>>>>>>> branch 'leejungho' of https://github.com/leejohn0038/LastProject.git
=======
>>>>>>> refs/heads/master
>>>>>>> branch 'master' of https://github.com/leejohn0038/LastProject.git
	
});

// ÄÚÄÚ¸àÆ®
=======
<<<<<<< HEAD
// ÄÚÄÚ¸àÆ®
// https://hianna.tistory.com/484 Âü°íÇØ¼­ ´Ù½Ã ¸¸µé±â
<<<<<<< HEAD
=======
=======

// ì½”ë©˜íŠ¸
const co_comment = document.getElementById('co_comment');
const co_comment_newBtn = document.getElementById('co_comment_newBtn');
const co_comment_saveBtn = document.getElementById('co_comment_saveBtn');
const co_comment_cancelBtn = document.getElementById('co_comment_cancelBtn');
>>>>>>> branch 'john' of https://github.com/leejohn0038/LastProject.git
>>>>>>> refs/heads/master
>>>>>>> branch 'master' of https://github.com/leejohn0038/LastProject.git

/* ÄÚÄÚ¸àÆ® input »ý¼º */
const co_comment_input = document.getElementById('co_comment_input');

document.addEventListener('click', (e) => {
<<<<<<< HEAD
	const commentsEA = document.querySelector('#commentsEA').value;
	console.log(commentsEA)
	if (commentsEA > 0) {
		const targetClass = e.target.className.substring('bi bi-chat-dots comment_icon '.length);
		const targetCommentId = e.target.id.substring('co_comment_newBtn_'.length); // comment_id
		const targetInput = document.getElementById(targetCommentId); //´ë´ñ±Û div
		const targetPostId = document.getElementById('post_id').value; // post_id
		const targetOrdernum = document.getElementById('comment_ordernum').value; // ordernum
		const targetCategoryId = document.getElementById('comment_categoryId').value; //category_id
		const compare_co_comment_newBtn = 'co_comment_newBtn';
		const beforeInput = document.getElementById('co_commentInput'); // ÀÌÀü »ý¼ºµÈ ´ë´ñ±Û input
		
		
		console.log('Å¸ÄÊid: ', targetCommentId);
		console.log('targetInput: ', targetInput)
		console.log('Å¬¸¯Å¬·¡½ºÀÌ¸§: ', targetClass);
		console.log('ÀÏÄ¡´ë»ó¹®ÀÚ¿­: ', compare_co_comment_newBtn);
		console.log('Å¬¸¯¾ÆÀÌµð: ', targetCommentId);
		console.log('post+id: ', targetPostId);	
		console.log('ordernum: ', targetOrdernum);
		console.log('categoryId: ', targetCategoryId);
		
		if (targetClass == compare_co_comment_newBtn) {
			
			if (beforeInput) {
				console.info('null µé¾î¿È');
				beforeInput.remove();
			}
			
			targetInput.appendChild(mkCoCommentInput(targetCommentId));
			/* /ÄÚÄÚ¸àÆ® input »ý¼º */
			
			/* ÄÚÄÚ¸àÆ® ÀúÀå */
			div2_savBtn.addEventListener('click', (e) => {
				
				const coCommentContents = document.getElementById('coCommentTextarea').value;
				
				console.log('Á¾¼ÓµÈ post_id: ', targetPostId);
				console.log('Á¾¼ÓµÈ comment_id', targetCommentId);
				console.log('´ë´ñ±Û ³»¿ë: ', coCommentContents);
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
				
				//ÄÚÄÚ¸àÆ® Ãâ·Â
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
	
=======
	const targetClass = e.target.className.substring('bi bi-chat-dots comment_icon '.length);
	const targetCommentId = e.target.id.substring('co_comment_newBtn_'.length); // comment_id
	const targetInput = document.getElementById(targetCommentId); //´ë´ñ±Û div
	const targetPostId = document.getElementById('comment_postId').value; // post_id
	const targetOrdernum = document.getElementById('comment_ordernum').value; // ordernum
	const targetCategoryId = document.getElementById('comment_categoryId').value; //category_id
	const coinsideName = 'co_comment_newBtn';
	const beforeInput = document.getElementById('co_commentInput'); // ÀÌÀü »ý¼ºµÈ ´ë´ñ±Û input
	
	
	console.log('Å¸ÄÊid: ', targetCommentId);
	console.log('targetInput: ', targetInput)
	console.log('Å¬¸¯Å¬·¡½ºÀÌ¸§: ', targetClass);
	console.log('ÀÏÄ¡´ë»ó¹®ÀÚ¿­: ', coinsideName);
	console.log('Å¬¸¯¾ÆÀÌµð: ', targetCommentId);
	console.log('post+id: ', targetPostId);	
	console.log('ordernum: ', targetOrdernum);
	console.log('categoryId: ', targetCategoryId);
	
	if (targetClass == coinsideName) {
		
		if (beforeInput) {
			//const beforeInput_commentId = document.querySelector('#co_commentInput > input');
			//console.log('beforeInput_commentId: ', beforeInput_commentId.value);
			console.info('null µé¾î¿È');
			beforeInput.remove();
		}
		
		targetInput.appendChild(mkCoCommentInput(targetCommentId));
		/* /ÄÚÄÚ¸àÆ® input »ý¼º */
		
		/* ÄÚÄÚ¸àÆ® ÀúÀå */
		div2_savBtn.addEventListener('click', (e) => {
			
			const coCommentContents = document.getElementById('coCommentTextarea').value;
			
			console.log('Á¾¼ÓµÈ post_id: ', targetPostId);
			console.log('Á¾¼ÓµÈ comment_id', targetCommentId);
			console.log('´ë´ñ±Û ³»¿ë: ', coCommentContents);
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
			
			xhttpComments.open('POST', '/project/main_paragraph', true);
			xhttpComments.setRequestHeader('content-type', 'application/json;charset=utf-8');
			xhttpComments.send(JSON.stringify(newCoCommentData));
			
			// coCommentContents = null;
			
			//ÄÚÄÚ¸àÆ® Ãâ·Â
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
>>>>>>> refs/heads/master
});

function mkComment(member_id, comments, comment_id, post_id, ordernum, category_id) {
	return `<div id=${comment_id} class="mb-3 border-bottom">
				<span class="userId">${member_id}</span><br/>
				<div class="d-flex justify-content-start">
					<p>${comments}</p>
					<i class="bi bi-x-circle comment_icon"></i>
<<<<<<< HEAD
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
	div2_savBtn.appendChild(textNode('ÀúÀå'));
	div2_cancelBtn.setAttribute('id', 'div2_cancelBtn');
	div2_cancelBtn.setAttribute('class', 'btn btn-outline-success co_comment_cancelBtn');
	div2_cancelBtn.appendChild(textNode('Ãë¼Ò'));
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

// °Ô½Ã±Û ¼öÁ¤
const contentsEdit = document.getElementById('contentsEdit');
contentsEdit.addEventListener('click', (e) => {
	console.log('³ª Å¬¸¯µÆ¾î');
	location.href = `./write?post_id=${post_id}&edit=true&board_class=${board_class}&edit=true`;
=======
					<i id="co_comment_editBtn" class="bi bi-pen comment_icon"></i>
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
	div2_savBtn.appendChild(textNode('ÀúÀå'));
	div2_cancelBtn.setAttribute('id', 'div2_cancelBtn');
	div2_cancelBtn.setAttribute('class', 'btn btn-outline-success co_comment_cancelBtn');
	div2_cancelBtn.appendChild(textNode('Ãë¼Ò'));
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

// ±Û ¼öÁ¤
const contentsEdit = document.getElementById('contentsEdit');

contentsEdit.addEventListener('click', (e) => {
	console.log(document.querySelector('#post_id').value);
	console.log('¹öÆ°´­¸²');
	location.href = `./write?post_id=${document.querySelector('#post_id').value}&board_class=${document.querySelector('#board_class').value}`;
>>>>>>> refs/heads/master
});





<<<<<<< HEAD
=======

>>>>>>> refs/heads/master


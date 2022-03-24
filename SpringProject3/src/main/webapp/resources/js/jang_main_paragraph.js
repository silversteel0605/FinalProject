/*const goBoard = document.getElementById('goBoard');
goBoard.addEventListener('click', (e) => {
	location.href = `/project/support`
});*/

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
		text: "복구가 불가능합니다!",
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

// 코멘트
const co_comment = document.getElementById('co_comment');
const co_comment_newBtn = document.getElementById('co_comment_newBtn');
const co_comment_saveBtn = document.getElementById('co_comment_saveBtn');
const co_comment_cancelBtn = document.getElementById('co_comment_cancelBtn');

co_comment_newBtn.addEventListener('click', (e) => {
	co_comment.style.display = 'block';
});

co_comment_saveBtn.addEventListener('click', (e) => {
	co_comment.style.display = 'none';
});

co_comment_cancelBtn.addEventListener('click', (e) => {
	co_comment.style.display = 'none';
});


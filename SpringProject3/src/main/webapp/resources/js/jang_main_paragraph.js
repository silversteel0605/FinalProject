const goBoard = document.getElementById('goBoard');
goBoard.addEventListener('click', (e) => {
	location.href = `/project/support`
});

const contentsDelete = document.getElementById('contentsDelete');
contentsDelete.addEventListener('click', (e) => {
	Swal.fire({
		template: '#deleteModal'
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire(
				document.getElementById('deleteForm').submit()
			)
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


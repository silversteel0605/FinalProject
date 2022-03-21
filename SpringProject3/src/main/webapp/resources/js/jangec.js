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

const paragraphDeleteBtn = document.getElementById('paragraphDeleteBtn');

paragraphDeleteBtn.addEventListener('click', (e) => {
	var deleteParagraph = swal.fire({
		template: '#deleteModal'
	});
	
	if (deleteParagraph.isConfirm) {
		alert("Delete");
	} else {
		alert("Cancel");
	}
});



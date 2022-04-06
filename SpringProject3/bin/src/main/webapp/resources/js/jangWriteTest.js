const writeSavBtn = document.getElementById('writeSavBtn');
const writeForm = document.getElementById('writeForm');

CKEDITOR.replace('writeEditor', {
	language: 'ko',
		// image upload
	filebrowserUploadUrl: './upload/image',
	//filebrowserImageUploadUrl: './upload/image?type=Images',
	filebrowserUploadMethod: 'form'
});

writeSavBtn.addEventListener('click', (e) => {
	
	const title = document.getElementById('title').value;
	const writeCategory = document.getElementById('writeCategory').value;
<<<<<<< HEAD
	const board_classNum = document.getElementById('board_class').value;
	const board_class = board_classNum == 0 ? 'freeBoard' : 'supportBoard';
	var contents = CKEDITOR.instances.writeEditor.getData();
	const post_id = 0;
	const edit = false;
	if (document.getElementById('edit')) {
		edit = document.getElementById('edit').value;
		post_id = document.getElementById('post_id').value;
	}
	console.log("클릭시 제목: ", title);
	console.log("클릭시 카테고리: ", writeCategory);
	console.log("클릭시 게시판종류: ", board_class);
	console.dir("클릭시 본문: ",  contents);
	console.log("클릭시 수정여부: ", edit);
	console.log("클릭시 게시글번호: ", post_id);
	
	var writeContents = [title, contents, board_class, writeCategory];
	
	if (edit) {
		console.log("수정이 트루임: " , edit);
		writeContents.push(post_id);
		writeContents.push(edit);
		console.log("수정을 추가한 배열: ", writeContents);
	}
	
	console.log("post보내기 직전");
	writeSend('./write', {'contents': writeContents});
	
});

function writeSend(url, params) {
	var form = document.createElement('form');
	form.setAttribute('method', 'POST');
	form.setAttribute('action', url);
=======
	const board_class = document.getElementById('board_class').value;
	var contents = CKEDITOR.instances.writeEditor.getData();
	
	console.log(title);
	console.log(writeCategory);
	console.log(board_class);
	console.dir(contents);
	
	var writeContents = [title, contents, board_class, writeCategory];
	
	writeSend('./write', {'contents': writeContents});
	
});

function writeSend(url, params) {
	var form = document.createElement('form');
	form.setAttribute('method', 'POST');
	form.setAttribute('action', url);
	
>>>>>>> refs/heads/master
	for (var key in params) {
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', key);
		hiddenField.setAttribute('value', params[key]);
		form.appendChild(hiddenField);
	}
	
	document.body.appendChild(form);
	form.submit();
};

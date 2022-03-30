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
	const board_class = document.getElementById('board_class').value;
	const edit = document.getElementById('edit').value;
	var contents = CKEDITOR.instances.writeEditor.getData();
	
	console.log(title);
	console.log(writeCategory);
	console.log(board_class);
	console.dir(contents);
	console.log(edit);
	
	var writeContents = [title, contents, board_class, writeCategory];
	
	if (edit) {
		console.log(edit);
		writeContents.push(edit);
		console.log(writeContents);
	}
	
	console.log("post焊郴扁 流傈");
	//writeSend('./write', {'contents': writeContents});
	
});

function writeSend(url, params) {
	var form = document.createElement('form');
	form.setAttribute('method', 'POST');
	form.setAttribute('action', url);
	console.log("map 积己 流傈");
	for (var key in params) {
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', key);
		hiddenField.setAttribute('value', params[key]);
		form.appendChild(hiddenField);
	}
	
	console.log("map 积己 流饶");
	document.body.appendChild(form);
	form.submit();
};

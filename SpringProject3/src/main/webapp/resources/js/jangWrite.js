const writeSavBtn = document.getElementById('writeSavBtn');
const writeEditor = document.getElementById('writeEditor');
const writeForm = document.getElementById('writeForm');

ClassicEditor
    .create(document.querySelector( '#writeEditor' ))
    .then(newEditor => {
		editor = newEditor;
	})
    .catch( error => {
		console.error( error );
	});

writeSavBtn.addEventListener('click', (e) => {
	console.log('버튼 클릭됨');
	const contents = editor.getData();
	const title = document.getElementById('title').value;
	const writeCategory = document.getElementById('writeCategory').value;
	const board_class = document.getElementById('board_class').value;
	
	console.log(title);
	console.log(contents);
	console.log(writeCategory);
	console.log(board_class);
	
	var writeContents = [title, contents, board_class, writeCategory];
	// writeForm.submit();
	wirteSend('./write', {'contents': writeContents});
});

function wirteSend(url, params) {
	var form = document.createElement('form');
	form.setAttribute('method', 'POST');
	form.setAttribute('action', url);
	
	// sendPost(url 경로, {'데이터명': 데이터})
	for (var key in params) {
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', key);
		hiddenField.setAttribute('value', params[key]);
		form.appendChild(hiddenField);
	}
	
	document.body.appendChild(form);
	form.submit();
}
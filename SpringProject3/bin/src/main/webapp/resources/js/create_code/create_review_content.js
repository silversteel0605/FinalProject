

//전체
function create_review_save_content(contentId){
	
	var testMainForm = document.getElementById("form");
	/*
	const newMainForm = document.createElement("form");
	newMainForm.setAttribute("id", "form");
	newMainForm.setAttribute("name", "form");
	newMainForm.setAttribute("method", "get");
	newMainForm.setAttribute("action", "./reviewSave");
	*/
	
	var testTextNode = document.createTextNode(contentId);
	
	var req_campingId = document.createElement("input");
	req_campingId.setAttribute("type", "text");
	req_campingId.setAttribute("name", "contentId");
	req_campingId.setAttribute("value", contentId);
	req_campingId.style.display = "none";
	
	//newMainForm.appendChild(campingId);
	
	let submit = document.createElement("input");
	let previous = document.createElement("button");
	let previousTxt = document.createTextNode("목록");
	
	submit.setAttribute("type", "submit");
	submit.setAttribute("class", "btn btn-sm btn-primary");
	
	previous.setAttribute("type", "button");
	previous.setAttribute("class", "btn btn-sm btn-primary");
	previous.setAttribute("id", "btnList");
	previous.setAttribute("onclick", "back()");
	previous.appendChild(previousTxt);
	
	testMainForm.appendChild(testTextNode);
	testMainForm.appendChild(req_campingId);
	testMainForm.appendChild(create_review_star_rank("캠핑장", 5));
	testMainForm.appendChild(create_review_save_user_title());
	testMainForm.appendChild(create_review_save_user_content());
	testMainForm.appendChild(submit);
	testMainForm.appendChild(previous);
}

//별 평점
function create_review_star_rank(text, starNum){
	
	//box
	var wrap = document.createElement("div");
	var starText = document.createTextNode("이 "+text+" 추천하시겠습니까?");
	var container = document.createElement("div");
	var content = document.createElement("div"); 
	var starIcon = document.createElement("div");
	
	console.log(starText);
	
	wrap.setAttribute("class", "text-center");
	container.setAttribute("class", "item-center");
	content.setAttribute("class", "rating-css");
	starIcon.setAttribute("class", "star-icon");
	
	//data
	let radio = [];
	let starLabel = [];
	for(index = 0; index < starNum; index++){
		
		radio.push(document.createElement("input"));
		radio[index].setAttribute("type", "radio");
		radio[index].setAttribute("name", "starRanking");
		radio[index].setAttribute("id", "rating"+(index+1));
		radio[index].setAttribute("value", index+1);
		
		starLabel.push(document.createElement("label"));
		starLabel[index].setAttribute("for", "rating"+(index+1));
		starLabel[index].setAttribute("class", "fa fa-star");
		
		starIcon.appendChild(radio[index]);
		starIcon.appendChild(starLabel[index]);
	}
	
	content.appendChild(starIcon);
	container.appendChild(content);
	
	wrap.appendChild(starText);
	wrap.appendChild(container);
	
	return wrap;
}

//유저 데이터
function create_review_save_user_title(){
	
	var content = document.createElement("div");
	content.setAttribute("class", "mb-3");
	
	let titleLabel = document.createElement("label");
	let titleLabelTxt = document.createTextNode("제목");
	let titleTxt = document.createElement("input");
	
	titleLabel.setAttribute("for", "title");
	titleLabel.appendChild(titleLabelTxt);
	
	titleTxt.setAttribute("type", "text");
	titleTxt.setAttribute("class","form-control");
	titleTxt.setAttribute("name", "title");
	titleTxt.setAttribute("id","title");
	titleTxt.setAttribute("placeholder", "제목을 입력해 주세요");
	
	content.appendChild(titleLabel);
	content.appendChild(titleTxt);
	
	return content;
}

function create_review_save_user_content(){
	
	var content = document.createElement("div");
	content.setAttribute("class", "mb-3");
	
	// start content
	let contentLabel = document.createElement("label");
	let contentLabelTxt = document.createTextNode("내용");
	let contentTextarea = document.createElement("textarea");
	let contentScript = document.createElement("script");
	let contentScriptTxt = document.createTextNode("CKEDITOR.replace('content', { filebrowserUploadUrl:'/food/imageUpload.do' });");
	
	contentLabel.setAttribute("for", "contentValue");
	contentLabel.appendChild(contentLabelTxt);
	
	contentTextarea.setAttribute("class", "form-control");
	contentTextarea.setAttribute("rows", "5");
	contentTextarea.setAttribute("name", "contentValue");
	contentTextarea.setAttribute("id", "content");
	contentTextarea.setAttribute("placeholder", "내용을 입력해 주세요");
	
	contentScript.setAttribute("type", "text/javascript");
	contentScript.appendChild(contentScriptTxt);
	
	content.appendChild(contentLabel);
	content.appendChild(contentTextarea);
	content.appendChild(contentScript);
	// end content
	
	return content;
}































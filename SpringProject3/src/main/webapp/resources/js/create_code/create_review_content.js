
//전체
function create_review_save_content(contentId, type, r_dto){
	
	console.log(contentId, type);
	var content = document.getElementById("contentBox");
	var testMainForm = create_review_form(type);
	
	var req_campingId = document.createElement("input");
	req_campingId.setAttribute("type", "text");
	req_campingId.setAttribute("name", "contentId");
	req_campingId.setAttribute("value", contentId);
	req_campingId.style.display = "none";
	
	//newMainForm.appendChild(campingId);
	
	let submit = document.createElement("input");
	let previous = document.createElement("button");
	let previousTxt = document.createTextNode("제목");
	
	submit.setAttribute("type", "submit");
	submit.setAttribute("class", "btn btn-sm btn-primary");
	
	previous.setAttribute("type", "button");
	previous.setAttribute("class", "btn btn-sm btn-primary");
	previous.setAttribute("id", "btnList");
	previous.setAttribute("onclick", "back()");
	previous.appendChild(previousTxt);
	
	testMainForm.appendChild(req_campingId);
	testMainForm.appendChild(create_review_star_rank(type));
	testMainForm.appendChild(create_review_user_title(type));
	testMainForm.appendChild(create_review_user_content(type));
	testMainForm.appendChild(submit);
	testMainForm.appendChild(previous);
	
	content.appendChild(testMainForm);
}

function create_review_form(type){
	
	const newMainForm = document.createElement("form");
	
	newMainForm.setAttribute("id", "form");
	newMainForm.setAttribute("name", "form");
	newMainForm.setAttribute("method", "get");
	
	console.log(type);
	
	if(type == 1){
		newMainForm.setAttribute("action", "./reviewUpdata");
	}else{
		newMainForm.setAttribute("action", "./reviewSave");	
	}
	
	return newMainForm;
}

//제목
function create_review_star_rank(type){
	
	//box
	var wrap = document.createElement("div");
	var starText = document.createTextNode("이 캠핑장을 추천하시겠습니까?");
	var container = document.createElement("div");
	var content = document.createElement("div"); 
	var starIcon = document.createElement("div");
	
	wrap.setAttribute("class", "text-center");
	container.setAttribute("class", "item-center");
	content.setAttribute("class", "rating-css");
	starIcon.setAttribute("class", "star-icon");
	
	//data
	let radio = [];
	let starLabel = [];
	for(index = 0; index < 5; index++){
		
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
function create_review_user_title(type, title){
	
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
	
	console.log(type);
	
	if(type == 1){
		titleTxt.setAttribute("placeholder", title);
		titleTxt.setAttribute("value", title);
	}else{
		titleTxt.setAttribute("placeholder", "제목을 입력해주세요");
	}
	
	
	content.appendChild(titleLabel);
	content.appendChild(titleTxt);
	
	return content;
}

function create_review_user_content(type, contentItem){
	
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
	if(type == 1){
		contentTextarea.setAttribute("placeholder", contentItem);
		contentTextarea.setAttribute("value", contentItem);
	}else{
		contentTextarea.setAttribute("placeholder", "내용을 입력해주세요");	
	}
	
	contentScript.setAttribute("type", "text/javascript");
	contentScript.appendChild(contentScriptTxt);
	
	content.appendChild(contentLabel);
	content.appendChild(contentTextarea);
	content.appendChild(contentScript);
	// end content
	
	return content;
}































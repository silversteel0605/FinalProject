
//all
function create_review_save_content(type, r_dto){
	
	console.log(r_dto.contentId, type, r_dto);
	var content = document.getElementById("contentBox");
	var testMainForm = create_review_form(type);
	
	var req_reviewId = document.createElement("input");
	var req_loginId = document.createElement("input");
	var req_campingId = document.createElement("input");
	var req_createDate = document.createElement("input");
	var req_imgUrl = document.createElement("input");
	var req_clickNum = document.createElement("input");
	
	req_campingId.setAttribute("name", "contentId");
	req_campingId.setAttribute("value", r_dto.contentId);
	req_campingId.style.display = "none";
	
	req_reviewId.setAttribute("name", "review_id");
	req_reviewId.setAttribute("value", r_dto.reviewId);
	req_reviewId.style.display = "none";
	
	req_loginId.setAttribute("name", "member_id");
	req_loginId.setAttribute("value", r_dto.memberId);
	req_loginId.style.display = "none";
	
	req_createDate.setAttribute("name", "reg_date");
	req_createDate.setAttribute("value", getYmd10(r_dto.regDate));
	req_createDate.style.display = "none";
	
	req_createDate.setAttribute("name", "up_date");
	req_createDate.setAttribute("value", getYmd10(r_dto.upDate));
	req_createDate.style.display = "none";
	
	req_imgUrl.setAttribute("name", "imgUrl");
	req_imgUrl.setAttribute("value", r_dto.imgUrl);
	req_imgUrl.style.display = "none";
	
	req_clickNum.setAttribute("name", "clickNum");
	req_clickNum.setAttribute("value", r_dto.clickNum);
	req_clickNum.style.display = "none";
	
	req_clickNum.setAttribute("name", "declNum");
	req_clickNum.setAttribute("value", r_dto.declkNum);
	req_clickNum.style.display = "none";
	
	//newMainForm.appendChild(campingId);
	
	let submit = document.createElement("input");
	let previous = document.createElement("button");
	let previousTxt = document.createTextNode("이전");
	
	submit.setAttribute("type", "submit");
	submit.setAttribute("class", "btn btn-sm btn-primary");
	
	previous.setAttribute("type", "button");
	previous.setAttribute("class", "btn btn-sm btn-primary");
	previous.setAttribute("id", "btnList");
	previous.setAttribute("onclick", "back()");
	previous.appendChild(previousTxt);
	
	testMainForm.appendChild(req_campingId);
	testMainForm.appendChild(req_reviewId);
	testMainForm.appendChild(req_loginId);
	testMainForm.appendChild(req_createDate);
	testMainForm.appendChild(req_imgUrl);
	testMainForm.appendChild(req_clickNum);
	testMainForm.appendChild(create_review_star_rank(type));
	testMainForm.appendChild(create_review_user_title(type, r_dto.title));
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

//Star Ranking
function create_review_star_rank(type){
	
	//box
	var wrap = document.createElement("div");
	var starText = document.createTextNode("이 캠핑장 추천하실 겁니까?");
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
		if(index == 4){
			radio[index].setAttribute("checked", "checked");	
		}
		
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


//Title
function create_review_user_title(type, title){
	var str =  str_replace(title);
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
		titleTxt.setAttribute("placeholder", str);
		titleTxt.setAttribute("value", str);
	}else{
		titleTxt.setAttribute("placeholder", "제목을 입력해주세요");
	}
	
	
	content.appendChild(titleLabel);
	content.appendChild(titleTxt);
	
	return content;
}

//Content Value
function create_review_user_content(){
	
	
	
	var content = document.createElement("div");
	content.setAttribute("class", "mb-3");
	
	// start content
	let contentLabel = document.createElement("label");
	let contentLabelTxt = document.createTextNode("내용을 입력해주세요");
	let contentTextarea = document.createElement("textarea");
	let contentScript = document.createElement("script");
	let contentScriptTxt = document.createTextNode("CKEDITOR.replace('content', { filebrowserUploadUrl:'/food/imageUpload.do' });");
	
	contentLabel.setAttribute("for", "review");
	contentLabel.appendChild(contentLabelTxt);
	
	contentTextarea.setAttribute("class", "form-control");
	contentTextarea.setAttribute("rows", "5");
	contentTextarea.setAttribute("name", "review");
	contentTextarea.setAttribute("id", "content");
	
	contentScript.setAttribute("type", "text/javascript");
	contentScript.appendChild(contentScriptTxt);
	
	content.appendChild(contentLabel);
	content.appendChild(contentTextarea);
	content.appendChild(contentScript);
	// end content
	
	return content;
}

function str_replace(str){
	
	str = str.replaceAll("&#32", " ");
	str = str.replaceAll("&#09", "	");
	str = str.replaceAll("&#10", "<br>");
	str = str.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	
	return str;
}

function getYmd10(d) {
    //yyyy-mm-dd
    if(d == 'Invalid Date'){
		d = new Date();
	}
	
	console.log(d);
	
	return d.getFullYear() + "-" + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "-" + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString());
    
}




























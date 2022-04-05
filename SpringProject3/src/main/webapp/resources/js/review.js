
function back(){
	window.history.back();
};

function listGo(reviewId, contentId){
	location.href="/project/CampInfo?contentId="+contentId+"#tab03";
}

function showPopUp(reviewId, contentId) {
	
	var result = confirm("삭제하시겠습니까 ?");
	
	if(result){
		location.href="/project/reviewDelete?reviewId="+reviewId+"&contentId="+contentId;
	}
}
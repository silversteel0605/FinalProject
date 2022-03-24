document.getElementById("btnList").addEventListener("click", back);
	
function back(){
	console.log("back");
	window.history.back();
};

function showPopUp(reviewId, contentId) {
	
	var result = confirm("삭제하시겠습니까 ?");
	
	
	if(result){
		location.href="/project/reviewDelete?reviewId="+reviewId+"&contentId="+contentId;
	}
}
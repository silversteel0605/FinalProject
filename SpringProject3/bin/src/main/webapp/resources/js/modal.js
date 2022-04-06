const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const modal_place_btn = document.getElementById('modal_place_btn');
const modal_day_btn = document.getElementById('modal_day_btn');
const modal_place = document.getElementById('modal_place');
const modal_day = document.getElementById('modal_day');
	window.addEventListener("keyup", e => { // esc 나가기
	    if(modal_place.style.display === "flex" && e.key === "Escape") {
	        modal_place.style.display = "none"
	    }else if(modal_day.style.display === "flex" && e.key === "Escape") {
	        modal_day.style.display = "none"
	    }
	})
  	modal_place_btn.addEventListener("click", e => { //모달창 키기
	    modal_place.style.display = "flex"
	})
		
	modal_day_btn.addEventListener("click", e => {
		    modal_day.style.display = "flex"
		})
	
	modal_place.addEventListener("click", e => {  // 다른화면클릭 나가기
    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	        modal_place.style.display = "none";
	    }
	})
	modal_day.addEventListener("click", e => {  
    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	        modal_day.style.display = "none";
	    }
	})
	const closeBtn1 = document.getElementById('close1');
	closeBtn1.addEventListener("click", e => {
	    modal_place.style.display = "none"
	})
	const closeBtn2 = document.getElementById('close2');
	closeBtn2.addEventListener("click", e => {
	    modal_day.style.display = "none"
	})
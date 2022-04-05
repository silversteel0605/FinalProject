/**
	리뷰 버튼
 */
 
 $(document).ready(function() {
	
	var ac = true;
	
	w_box = document.getElementById("write_box");
	
	//w_box.style.display = 'none';
	
	document.getElementById("write_btn").addEventListener('click', function(){
		if(ac == true){
			w_box.style.display = 'block';
			ac = false;	
		}else{
			w_box.style.display = 'none';
			ac = true;
		}
			
	});
});

var swiper = new Swiper(".mySwiper", {
    slidesPerView: 3,
    centeredSlides: true,
    spaceBetween: 30,
    pagination: {
      el: ".swiper-pagination",
      type: "fraction",
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });


function select_click_event(value, contentId){
	location.href="/project/reviewSort?value="+value+"&contentId="+contentId;
}


//tab
var triggerTabList = [].slice.call(document.querySelectorAll('#myTab a'))
triggerTabList.forEach(function (triggerEl) {
  var tabTrigger = new bootstrap.Tab(triggerEl)

  triggerEl.addEventListener('click', function (event) {
    event.preventDefault()
    tabTrigger.show()
  })
})

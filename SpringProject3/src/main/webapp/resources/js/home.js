var swiper = new Swiper(".fmySwiper", {
		        slidesPerView: 3,
		        spaceBetween: 30,
		        slidesPerGroup: 3,
		        loop: true,
		        loopFillGroupWithBlank: true,
		        pagination: {
		          el: ".fswiper-pagination",
		          clickable: true,
		        },
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      }); 

var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        loop: true,
        effect: "fade",
        navigation: {
          nextEl: ".fswiper-button-next",
          prevEl: ".fswiper-button-prev",
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });
      
var mql = window.matchMedia("screen and (max-width: 1140px)"); 
mql.addListener(function(e) { 
	if(e.matches) { 
		var swiper = new Swiper(".fmySwiper", {
		        slidesPerView: 1,
		        spaceBetween: 30,
		        slidesPerGroup: 1,
		        loop: true,
		        loopFillGroupWithBlank: true,
		        pagination: {
		          el: ".fswiper-pagination",
		          clickable: true,
		        },
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      });
	} else { 
		var swiper = new Swiper(".fmySwiper", {
		        slidesPerView: 3,
		        spaceBetween: 30,
		        slidesPerGroup: 3,
		        loop: true,
		        loopFillGroupWithBlank: true,
		        pagination: {
		          el: ".fswiper-pagination",
		          clickable: true,
		        },
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      }); 
	} 
});


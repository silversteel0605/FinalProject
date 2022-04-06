/**
	리뷰 버튼
 */

var content01 = document.getElementById("content01");
var camping_title = document.getElementById("camping_title");
var top_title = document.getElementById("top_title");
var tab01 = document.getElementById("home-tab");
var tab02 = document.getElementById("profile-tab");
var tab03 = document.getElementById("contact-tab");
var reg_date = document.getElementById("reg_date");
var write_btn = document.getElementById("write_btn");
var review_txt = document.getElementById("review_txt");
var title_wrap = document.getElementById("title_wrap");

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

function getCookie(cname) {        // 쿠키 체크 함수
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

if(getCookie("DarkMode")==""){  // 쿠키가 없을시 생성 제한(1일)
	var setCookie = '';
    setCookie += 'DarkMode = N;';
    setCookie += 'Expires =' + date.toUTCString();
    document.cookie=setCookie;
}

$("#checkBoxId").change(function(){   // 클릭시 쿠키의 값 변경 및 새로고침
	location.reload();
    if($("#checkBoxId").is(":checked")){
		document.cookie="DarkMode = Y;";
		getCookie("DarkMode");        
		darkmodeIcon.innerHTML="<ion-icon name='moon-outline'></ion-icon>"

    }else{
		document.cookie="DarkMode = N;";
		getCookie("DarkMode");       
		darkmodeIcon.innerHTML="<ion-icon name='sunny-outline'></ion-icon>"

    }
});

if(getCookie("DarkMode")=="Y"){  // 화면이동시에 쿠키값확인후 체크 변경
	
	title_wrap.classList.remove("bb");
	title_wrap.className += " dark-bb";
	
	top_title.style.color = "White";
	content01.style.background = "#3C056E";
	camping_title.style.background = "#86679C";
	
	tab01.className += " dark-nav-link";
	tab02.className += " dark-nav-link";
	tab03.className += " dark-nav-link";
	
	reg_date.style.background = "black";
	review_txt.className += "dark-a";
}


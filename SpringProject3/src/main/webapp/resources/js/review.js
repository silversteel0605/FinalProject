
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


var camping_title = document.getElementById("camping_title");
var top_title = document.getElementById("top_title");
var title_wrap = document.getElementById("title_wrap");

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
	camping_title.style.background = "#86679C";
	
}
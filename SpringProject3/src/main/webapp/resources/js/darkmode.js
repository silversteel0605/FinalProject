var darkmodeIcon = document.getElementById("moonsun");
var chkbox = document.getElementById("darkmodecheck");
var sky = document.getElementById("sky");
var bodytag = document.getElementsByTagName("body");
var navbar = document.getElementById("navbar");
var darkmodebg = document.getElementById("darkmodebg");
var main_ani = document.getElementById("main_ani");
var moon = document.getElementById("moon");
var date = new Date();
var potal = document.getElementsByClassName("potal")
date.setDate(date.getDate()+1);

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

$(document).ready(function(){
});

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
	$("#checkBoxId").prop("checked",true);
	darkmodeIcon.innerHTML="<ion-icon name='moon-outline'></ion-icon>"
	$(bodytag).addClass("darkmodeY");
    $(sky).attr('class','nightsky');
    $(navbar).removeClass("darkmodeN");
    $(navbar).addClass("darkmodeY");
    $(potal).addClass("darkmodeY");
    $(chkbox).removeClass('cbbgcd');
    $(chkbox).addClass('cbbgcn');
    bird1.style.display = "none"
	bird2.style.display = "none"
	$(main_ani).addClass('darkmode');
	moon.style.display = "flex"
	
}else if(getCookie("DarkMode")=="N"){
	$("#checkBoxId").prop("checked",false);
	darkmodeIcon.innerHTML="<ion-icon name='sunny-outline'></ion-icon>"
	$(bodytag).removeClass("darkmode");
    $(sky).removeAttr('class','nightsky'); 
	$(navbar).removeClass("darkmodeY");
	$(navbar).addClass("darkmodeN");
	$(potal).removeClass("darkmodeY");
	$(chkbox).addClass('cbbgcd');
    $(chkbox).removeClass('cbbgcn');
    $(main_ani).removeClass('darkmode');
}


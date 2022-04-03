var darkmodeIcon = document.getElementById("moonsun");
var chkbox = document.getElementById("darkmodecheck");
var sky = document.getElementById("sky");
var bodytag = document.getElementsByTagName("body");
var navbar = document.getElementById("ftco-navbar");
var darkmodebg = document.getElementById("darkmodebg");
var date = new Date();
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
		darkmodeIcon.innerHTML="<ion-icon name='moon-outline'></ion-icon>";
    }else{
		document.cookie="DarkMode = N;";
		getCookie("DarkMode");       
		darkmodeIcon.innerHTML="<ion-icon name='sunny-outline'></ion-icon>";
    }
});

$(window).scroll(function () {    // 스크롤의 현체 위치 찾는 함수
			var height = $(document).scrollTop();
			log(height);
			
	});
if(getCookie("DarkMode")=="Y"){  // 화면이동시에 쿠키값확인후 체크 변경
	$("#checkBoxId").prop("checked",true);
}else if(getCookie("DarkMode")=="N"){
	$("#checkBoxId").prop("checked",false);
}

function log(h){   // 높이에 따른 이벤트 (다크모드 이벤트)  
	if(h > 300){
		$('#darkmodecheck').addClass('cbbgc');
				 
		if(getCookie("DarkMode")=="Y"){
			darkmodeIcon.innerHTML="<ion-icon name='moon-outline'></ion-icon>"
	        $(bodytag).addClass("darkmode");
	        $(mainimg).addClass("maindarkimg");
	        $(sky).attr('class','nightsky');
			$('#dropmenu').removeClass('dropdownd');
			$('.dropdown-item').removeClass('dropdownd');
			$(chkbox).removeClass('cbbgcd');
			$(navbar).removeClass("navbd");
			$('.nav-link').removeClass("color-black");
			$('.navbar-brand').removeClass('color-white');
			$('#dropmenu').addClass('dropdownn');
			$('.dropdown-item').addClass('dropdownn');
			$(chkbox).addClass('cbbgcn');
			$(navbar).addClass('darkmode');
			$('.navbar-brand').addClass('color-white');
			
			

	    }else if(getCookie("DarkMode")=="N"){
			darkmodeIcon.innerHTML="<ion-icon name='sunny-outline'></ion-icon>"
	        $(bodytag).removeClass("darkmode");
	        $(mainimg).removeClass("maindarkimg");
	        $(sky).removeAttr('class','nightsky'); 
			$('#dropmenu').removeClass('dropdownn');
			$('.dropdown-item').removeClass('dropdownn');
			$(chkbox).removeClass('cbbgcn');
			$(navbar).removeClass('darkmode'); 
			$('#dropmenu').addClass('dropdownd');
			$('.dropdown-item').addClass('dropdownd');
			$(chkbox).addClass('cbbgcd');
			$(navbar).addClass("navbd");
			$('.nav-link').addClass("color-black");
	    }

	}
	if(h < 300){
		$('#darkmodecheck').removeClass('cbbgc');
		$('#darkmodecheck').removeClass('cbbgcn');
		$('#dropmenu').removeClass('dropdownd');
		$('.dropdown-item').removeClass('dropdownd');
		$('#dropmenu').removeClass('dropdownn');
		$('.dropdown-item').removeClass('dropdownn');
		$('.nav-link').removeClass("color-black");
		$('.navbar-brand').removeClass('color-white');
		$(chkbox).removeClass('cbbgcd');
		$(chkbox).removeClass('cbbgcn');
		$(navbar).removeClass("darkmode"); 
		$(navbar).removeClass("navbd");
		if(getCookie("DarkMode")=="Y"){
				darkmodeIcon.innerHTML="<ion-icon name='moon-outline'></ion-icon>"
		        $(bodytag).addClass("darkmode");
		        $(mainimg).addClass("maindarkimg");
		        $(sky).attr('class','nightsky');
			

		    }else if(getCookie("DarkMode")=="N"){
				darkmodeIcon.innerHTML="<ion-icon name='sunny-outline'></ion-icon>"
		        $(bodytag).removeClass("darkmode");
		        $(mainimg).removeClass("maindarkimg"); 
				$(sky).removeAttr('class','nightsky'); 
		    }
		$("#checkBoxId").change(function(){
			$('#dropmenu').removeClass('dropdownd');
			$('.dropdown-item').removeClass('dropdownd');
			$('#dropmenu').removeClass('dropdownn');
			$('.dropdown-item').removeClass('dropdownn');
			$('.nav-link').removeClass("color-black");
			$('.navbar-brand').removeClass('color-white');
			$(chkbox).removeClass('cbbgcd');
			$(chkbox).removeClass('cbbgcn');
			$(navbar).removeClass("darkmode"); 
			$(navbar).removeClass("navbd");

		});
	}
}

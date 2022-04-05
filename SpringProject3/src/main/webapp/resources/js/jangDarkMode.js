var bodytag = document.getElementsByTagName("body");
var sectiontag = document.getElementsByTagName('section');
var divtag = document.querySelectorAll('.section div');
var ptag = document.querySelectorAll('.section p');
var buttontag = document.querySelectorAll('.section button');
var selecttag = document.querySelectorAll('.section select');
var atag = document.querySelectorAll('.section a');
var thtag = document.querySelectorAll('.section th');
var tdtag = document.querySelectorAll('.section td');
var smalltag = document.querySelectorAll('.section small');
var h5tag = document.querySelectorAll('.section h5');
var spantag = document.querySelectorAll('.section span');
var seperator = document.querySelectorAll('.seperator');
var input = document.querySelectorAll('.section input');
var textarea = document.querySelectorAll('.section textarea');
var label = document.querySelectorAll('.section label');
var itag = document.querySelectorAll('.section i');

function getCookie(cname) {        
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    console.log('c: ', c);
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
      console.log('while안의 c: ', c);
    }
    if (c.indexOf(name) == 0) {
      console.log('if안의 c: ', c);
      console.log('c.substring(name.length, c.length): ', c.substring(name.length, c.length))
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

/*if(getCookie("DarkMode")==""){  
	var setCookie = '';
    setCookie += 'DarkMode = N;';
    setCookie += 'Expires =' + date.toUTCString();
    document.cookie=setCookie;
}*/

document.cookie="DarkMode=Y";

$(document).ready(function(){
	
	console.log(document.cookie);
	
	if (getCookie("DarkMode") == 'Y') {
		
		$(sectiontag).addClass("darkmodeSection");
		$(divtag).addClass('darkmodeDiv');
		$(ptag).addClass('darkmodeFont');
		$(buttontag).addClass('darkmodeFont');
		$(selecttag).addClass('darkmodeFont');
		$(selecttag).addClass('darkmodeDiv');
		$(input).addClass('darkmodeFont')
		$(input).addClass('darkmodeDiv')
		$(atag).addClass('darkmodeFont');
		$(thtag).addClass('darkmodeFont');
		$(tdtag).addClass('darkmodeFont');
		$(h5tag).addClass('darkmodeFont');
		$(spantag).addClass('darkmodeFont');
		$(smalltag).addClass('darkmodeFont');
		$(seperator).removeClass('border-dark');
		$(seperator).addClass('border-white');
		$(textarea).addClass('darkmodeFont');
		$(textarea).addClass('darkmodeDiv');
		$(label).addClass('darkmodeFont');
		$(itag).addClass('darkmodeFont');
		
	} else if (getCookie('DarkMode') == 'N') {
		
		$(sectiontag).removeClass('darkmodeSection');
		$(ptag).removeClass('darkmodeFont');
		$(buttontag).removeClass('darkmodeFont');
		$(selecttag).removeClass('darkmodeFont');
		$(atag).removeClass('darkmodeFont');
		$(thtag).removeClass('darkmodeFont');
		$(tdtag).removeClass('darkmodeFont');
	}
});
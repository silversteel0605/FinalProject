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
var h2tag = document.querySelectorAll('.section h2');
var h5tag = document.querySelectorAll('.section h5');
var spantag = document.querySelectorAll('.section span');
var seperator = document.querySelectorAll('.seperator');
var input = document.querySelectorAll('.section input');
var textarea = document.querySelectorAll('.section textarea');
var label = document.querySelectorAll('.section label');
var itag = document.querySelectorAll('.section i');
var litag = document.querySelectorAll('.section li');
var ultag = document.querySelectorAll('.section ul');
var pageActive = document.querySelectorAll('.page-item.active .page-link');
var modalDiv = document.querySelectorAll('.modal-content div');
var modalH5 = document.querySelectorAll('.modal-content h5');
var modalButton = document.querySelectorAll('.modal-content button');

function getCookie(cname) {        
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

if(getCookie("DarkMode")==""){  
	var setCookie = '';
    setCookie += 'DarkMode = N;';
    setCookie += 'Expires =' + date.toUTCString();
    document.cookie=setCookie;
}


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
		$(atag).removeClass('text-dark');
		$(atag).addClass('darkmodeFont');
		$(atag).addClass('darkmodeDiv');
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
		$(pageActive).addClass('darkmodeDiv');
		$(pageActive).attr('style', 'color: #D6D6D7 !important; background: #202124 !important;');		
		$(litag).addClass('darkmodeDiv');
		$(ultag).addClass('darkmodeDiv');
		$(modalDiv).addClass('darkmodeDiv');
		$(modalH5).addClass('darkmodeFont');
		$(modalButton).addClass('darkmodeFont');
		$(h2tag).addClass('darkmodeFont');
		$(h2tag).removeAttr('style');
		$(h2tag).attr('style', 'border-bottom: 2px solid #D6D6D7')
		
	} else if (getCookie('DarkMode') == 'N') {
		
		$(sectiontag).removeClass('darkmodeSection');
		$(divtag).removeClass('darkmodeDiv');
		$(ptag).removeClass('darkmodeFont');
		$(buttontag).removeClass('darkmodeFont');
		$(selecttag).removeClass('darkmodeFont');
		$(selecttag).removeClass('darkmodeDiv');
		$(input).removeClass('darkmodeDiv');
		$(input).removeClass('darkmodeFont');
		$(atag).removeClass('darkmodeFont');
		$(atag).removeClass('darkmodeDiv');
		$(thtag).removeClass('darkmodeFont');
		$(tdtag).removeClass('darkmodeFont');
		$(h2tag).removeClass('darkmodeFont');
		$(h5tag).removeClass('darkmodeFont');
		$(spantag).removeClass('darkmodeFont');
		$(smalltag).removeClass('darkmodeFont');
		$(seperator).removeClass('border-white');
		$(seperator).addClass('border-dark');
		$(textarea).removeClass('darkmodeFont');
		$(textarea).removeClass('darkmodeDiv');
		$(label).removeClass('darkmodeFont');
		$(itag).removeClass('darkmodeFont');
		$(modalDiv).removeClass('darkmodeDiv');
		$(modalH5).removeClass('darkmodeFont');
		$(modalButton).removeClass('darkmodeFont');
		$(h2tag).removeAttr('style');
		$(h2tag).attr('style', 'border-bottom: 2px solid #111');
		$(pageActive).attr('style', 'color: #202124 !important; background: #D6D6D7 !important;');	
	}
});
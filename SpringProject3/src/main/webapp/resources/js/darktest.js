function getCookie(cname) {        // 쿠키 체크 함수
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

if(getCookie("DarkMode")==""){  // 쿠키가 없을시 생성 제한(1일)
	var setCookie = '';
    setCookie += 'DarkMode = N;';
    setCookie += 'Expires =' + date.toUTCString();
    document.cookie=setCookie;
}

console.log(document.cookie);
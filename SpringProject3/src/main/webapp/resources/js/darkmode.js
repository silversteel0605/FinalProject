var darkmodeIcon = document.getElementById("moonsun");
var sky = document.getElementById("sky");
var bodytag = document.getElementsByTagName("body");
var navbar = document.getElementById("ftco-navbar");
var darkmodebg = document.getElementById("darkmodebg");

$(document).ready(function(){
    $("#checkBoxId").change(function(){
        if($("#checkBoxId").is(":checked")){
            darkmodeIcon.innerHTML="<ion-icon name='sunny-outline'></ion-icon>"
            $(bodytag).removeClass("darkmode");
            $(mainimg).removeClass("maindarkimg");     
            $(navbar).removeClass("darkmode");    
            $(sky).attr('class','skybird');
        }else{
            darkmodeIcon.innerHTML="<ion-icon name='moon-outline'></ion-icon>"
            $(bodytag).addClass("darkmode");
            $(navbar).addClass("darkmode");
            $(mainimg).addClass("maindarkimg");
            $(sky).attr('class','nightsky');

            
        }
    });
});
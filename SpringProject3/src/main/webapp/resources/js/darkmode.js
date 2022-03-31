var darkmodeIcon = document.getElementById("moonsun");
var chkbox = document.getElementById("darkmodecheck");
var sky = document.getElementById("sky");
var bodytag = document.getElementsByTagName("body");
var navbar = document.getElementById("ftco-navbar");
var darkmodebg = document.getElementById("darkmodebg");

$(document).ready(function(){
});
$("#checkBoxId").change(function(){
    if($("#checkBoxId").is(":checked")){
        darkmodeIcon.innerHTML="<ion-icon name='sunny-outline'></ion-icon>"
        $(bodytag).removeClass("darkmode");
        $(mainimg).removeClass("maindarkimg");     
           
        $(sky).attr('class','skybird');


        

    }else{
        darkmodeIcon.innerHTML="<ion-icon name='moon-outline'></ion-icon>"
        $(bodytag).addClass("darkmode");
        $(mainimg).addClass("maindarkimg");
        $(sky).attr('class','nightsky');

        
    }
});

$(window).scroll(function () {
			var height = $(document).scrollTop();
			log(height);
			
	});

function log(h){
	if(h > 300){
		$('#darkmodecheck').addClass('cbbgc');
				 
    		if($("#checkBoxId").is(":checked")){
				$('#dropmenu').removeClass('dropdownn');
				$('.dropdown-item').removeClass('dropdownn');
				$(chkbox).removeClass('cbbgcn');
				$(navbar).removeClass('darkmode'); 
				$('#dropmenu').addClass('dropdownd');
				$('.dropdown-item').addClass('dropdownd');
				$(chkbox).addClass('cbbgcd');
				$(navbar).addClass("navbd");
				$('.nav-link').addClass("color-black");
				

		    }else if(!($("#checkBoxId").is(":checked"))){
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
		    }
		    
	    $("#checkBoxId").change(function(){
		    if($("#checkBoxId").is(":checked")){
				$('#dropmenu').removeClass('dropdownn');
				$('.dropdown-item').removeClass('dropdownn');
				$(chkbox).removeClass('cbbgcn');
				$(navbar).removeClass("darkmode");
				$('.navbar-brand').removeClass('color-white'); 
		        $('#dropmenu').addClass('dropdownd');
				$('.dropdown-item').addClass('dropdownd');
				$(chkbox).addClass('cbbgcd');
				$(navbar).addClass("navbd");
				$('.nav-link').addClass("color-black");	
		    }else if(!($("#checkBoxId").is(":checked"))){
		       $('#dropmenu').removeClass('dropdownd');
				$('.dropdown-item').removeClass('dropdownd');
				$('.nav-link').removeClass("color-black");
		        $(chkbox).removeClass('cbbgcd');
				$(navbar).removeClass("navbd");
				$('#dropmenu').addClass('dropdownn');
				$('.dropdown-item').addClass('dropdownn');
				$(chkbox).addClass('cbbgcn');
				$(navbar).addClass("darkmode");
				$('.navbar-brand').addClass('color-white');
		    }
		});

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

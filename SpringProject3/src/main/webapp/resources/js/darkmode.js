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

$(window).scroll(function () {
			var height = $(document).scrollTop();
			log(height);
			
	});

function log(h){
	if(h > 300){
		$('#darkmodecheck').addClass('cbbgc');
				 
    		if($("#checkBoxId").is(":checked")){
				$('#dropmenu').addClass('dropdownd');
				$('.dropdown-item').addClass('dropdownd');
				$('#dropmenu').removeClass('dropdownn');
				$('.dropdown-item').removeClass('dropdownn');
				$(chkbox).removeClass('cbbgcn');
				$(chkbox).addClass('cbbgcd');

		    }else if(!($("#checkBoxId").is(":checked"))){
				$('#dropmenu').removeClass('dropdownd');
				$('.dropdown-item').removeClass('dropdownd');
				$('#dropmenu').addClass('dropdownn');
				$('.dropdown-item').addClass('dropdownn');
				$(chkbox).removeClass('cbbgcd');
				$(chkbox).addClass('cbbgcn');
		    }
	    $("#checkBoxId").change(function(){
		    if($("#checkBoxId").is(":checked")){
		        $('#dropmenu').addClass('dropdownd');
				$('.dropdown-item').addClass('dropdownd');
				$('#dropmenu').removeClass('dropdownn');
				$('.dropdown-item').removeClass('dropdownn');
				$(chkbox).removeClass('cbbgcn');
				$(chkbox).addClass('cbbgcd');	
		    }else if(!($("#checkBoxId").is(":checked"))){
		       $('#dropmenu').removeClass('dropdownd');
				$('.dropdown-item').removeClass('dropdownd');
				$('#dropmenu').addClass('dropdownn');
				$('.dropdown-item').addClass('dropdownn');
		        $(chkbox).removeClass('cbbgcd');
				$(chkbox).addClass('cbbgcn');
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
		$(chkbox).removeClass('cbbgcd');
		$(chkbox).removeClass('cbbgcn');
		
		$("#checkBoxId").change(function(){
			$('#dropmenu').removeClass('dropdownd');
			$('.dropdown-item').removeClass('dropdownd');
			$('#dropmenu').removeClass('dropdownn');
			$('.dropdown-item').removeClass('dropdownn');
			$(chkbox).removeClass('cbbgcd');
			$(chkbox).removeClass('cbbgcn');
		});
	}
}

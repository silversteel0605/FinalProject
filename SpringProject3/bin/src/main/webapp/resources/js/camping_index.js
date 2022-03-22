/**
	리뷰 버튼
 */
 
 $(document).ready(function() {
	
	var ac = true;
	
	w_box = document.getElementById("write_box");
	
	w_box.style.display = 'none';
	
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
 
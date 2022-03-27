/**
 * 
 */
 
function review(){
	var url = document.location.toString();
	
	if (url.match('#')) {
    	$('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
	}

	// Change hash for page-reload
	$('.nav-tabs a').on('shown.bs.tab', function (e) {
		nav_height = document.getElementById("ftco-navbar").scrollHeight;
		tab_height = document.getElementById("tab").scrollHeight;
    	window.location.hash = e.target.hash;
    	window.scrollBy(0, -(nav_height+tab_height));
	})
}


	
const tags = document.querySelectorAll('.tag');
tags.forEach(tag => {
	tag.onclick = () => {
		if (tag.classList.contains('active')) {				
			tag.style.backgroundColor = "#ffffff";
			tag.style.color = "#212529";
			tag.classList.remove('active');
			
		} else {
			tag.style.backgroundColor = "#212529";
			tag.style.color = "#ffffff";
			tag.classList.add('active');
		}
	}
})
	


$('#submit').click(function() {
	const form = document.condition;
	if ($('#condition').hasClass('active')) {
		form.method = "get";
		form.action = './search';
		form.submit();
	} else {		
		let uri = location.pathname + '?searchTy=tag';
		tags.forEach(tag => {
			if(tag.classList.contains('active')) {
				var id = tag.id;
				uri += '&tagId=' + id;
			}
		})
		location.href = uri;
	}
})
/*		
	var order = document.getElementById('order');
	
	order.addEventListener('change', (e) => {
		var value = e.target.value;
		var pathname = location.pathname;
		var search = location.search;
		var index = search.indexOf('order');
		if(index > -1) {
			search = search.substr(0, index) + 'order=' + value;
		} else {
			if (search === '') {
				search += '?order=' + value;
				console.log(search);				
			} else {
				search += '&order=' + value;
				console.log(search);
			}
		}
		pathname = pathname.replace('nowPage=[0-9]+', 'nowPage=1');
		location.href = pathname + search;
	})
*/
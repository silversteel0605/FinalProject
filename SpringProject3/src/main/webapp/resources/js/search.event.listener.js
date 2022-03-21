function moreInfoFunc() {
	  var mores = document.getElementById("mores");
	  if (mores.style.display === "none" || mores.style.display === "") {
	    mores.style.display = "block";
	  } else {
	    mores.style.display = "none";
	  }
	}
	
	var tags = document.querySelectorAll('.tag ');
	tags.forEach(tag => {
		tag.onclick = () => {
			if (tag.classList.contains('active')) {				
				tag.style.backgroundColor = "#ffffff";
				tag.style.color = "#343a40";
				tag.classList.remove('active');
				
			} else {
				tag.style.backgroundColor = "#343a40";
				tag.style.color = "#ffffff";
				tag.classList.add('active');
			}
		}
	})
	
	var searchBtn = document.getElementsByClassName('tagSearch')[0];
	searchBtn.onclick = () => {
		let uri = location.pathname + '?searchTy=tag';
		tags.forEach(tag => {
			if(tag.classList.contains('active')) {
				let id = tag.id;
				uri += '&tagId=' + id;
			}
		})
		location.href = uri;
	}
	
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
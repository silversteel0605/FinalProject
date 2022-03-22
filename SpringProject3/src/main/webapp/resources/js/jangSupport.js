const popUpMenu = document.getElementById('popUpMenu');

document.addEventListener('click', (e) => {
	const id = e.target.id;
	const className = e.target.className;
	const tempId = id;
	
	if (className === 'userId') {
		popUpMenu.style.position = 'absolute';
		popUpMenu.style.zIndex = 99999;
		popUpMenu.style.left = `${e.pageX}px`;
		popUpMenu.style.top = `${e.pageY}px`;
		popUpMenu.style.display = 'block';
	} else {
		popUpMenu.style.display = 'none';
	}
	
	const memberInfo = document.getElementById('memberInfo');
	const memberPost = document.getElementById('memberPost');
	
	memberInfo.addEventListener('click', (e) => {
		console.log(tempId);
		location.href = `/project/tempIndividualInfo?id=${tempId}`;
	});
	
	memberPost.addEventListener('click', (e) => {
		console.log(tempId);
		location.href = `/project/tempIndividualPost?id=${tempId}`;
	});
	
});


















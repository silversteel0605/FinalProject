// PopUp 메뉴
const popUpMenu = document.getElementById('popUpMenu');

document.addEventListener('click', (e) => {
	const className = e.target.className;
	const targetId = e.target.id;
<<<<<<< HEAD

	if (className === 'userId') {
=======
	
	if (className === 'userId pointer') {
>>>>>>> refs/heads/jang
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
		console.log(targetId);
		location.href = `/project/tempIndividualInfo?id=${targetId}`;
	});
	
	memberPost.addEventListener('click', (e) => {
		console.log(targetId);
		location.href = `/project/tempIndividualPost?id=${targetId}`;
	});
	
});

// 게시글보기
function mainContents(post_id) {
	location.href = `/project/main_paragraph?post_id=${post_id}`
};
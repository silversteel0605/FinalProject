let text = document.getElementById('main_text');
let bird1 = document.getElementById('bird1');
let bird2 = document.getElementById('bird2');
let forest = document.getElementById('forest');
let rocks = document.getElementById('rocks');
let water = document.getElementById('water');
let check = true;

const ham = document.getElementById('ham');
const main_nav = document.getElementById('main_nav');
const find = document.getElementById('find');

window.addEventListener('scroll',function(){
	let value = window.scrollY;
	
	text.style.top = 50+ value * -0.2 + '%';
	moon.style.top =  value * -0.2 + '%';
	bird1.style.top = value * -1.5 + 'px';
	bird1.style.left = value * 2 + 'px';
	bird2.style.top = value * -1.5 + 'px';
	bird2.style.left = value * -5 + 'px';
	rocks.style.top= value*-0.12+'px';
})

	ham.addEventListener("click", e => {
		if(check){
		    main_nav.style.display = "flex"
		    find.style.display = "flex"
		    navbar.style.height = "470px";
		    check = false;
		}else{
			main_nav.style.display = "none"
		    find.style.display = "none"
		    navbar.style.height = "0";
		    check = true;
		}
	})
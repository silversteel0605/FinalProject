const joinProhibitSwitch = document.getElementById('joinProhibitSwitch');
const joinProhibitSentence = document.getElementById('joinProhibitSentence');

var joinProhibit = false;

if (joinProhibit == false) {
	joinProhibitSwitch.checked = false;
	joinProhibitSentence.innerHTML = '가입허용';
} else {
	joinProhibitSwitch.checked = true;
	joinProhibitSentence.innerHTML = '가입금지';
}

joinProhibitSwitch.addEventListener('change', (e) => {
	
	if (joinProhibitSwitch.checked == true) {
		joinProhibit = true;
		console.log("회원가입 허용")
		joinProhibitSentence.innerHTML = '가입허용';
		
		
	} else {
		console.log("회원가입 금지")
		joinProhibit = false;
		joinProhibitSentence.innerHTML = '가입금지';
	}
});




function findAdr() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        console.log(data);
	        console.log(data.zonceode);
			var postNumInput = document.getElementById('postNumOfSite');
			var adrOfSiteInput = document.getElementById('adrOfSite');
			
	        postNumInput.value = data.zonecode;
	        adrOfSiteInput.value = data.address;
	    }
	}).open();
}


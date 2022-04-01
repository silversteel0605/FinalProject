let specific;
let addr1;
let sido;
let sigungu;

function findAdr() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        addr1 = data.address;
	        sido = data.sido;
	        sigungu = data.sigungu;

			$('#post').val(data.zonecode);
			$('#addr1').val(data.address);
	    }
	}).open();
}
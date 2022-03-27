$('#camp_update').click(function () {
	setData();
	updateCampingInfo();
});

function updateCampingInfo() {
	const data =  JSON.stringify({
		contentId : $('#contentId').val(),
		addr1 : addr1,
		addr2: addr2,
		doNm : sido,
		sigunguNm : sigungu,
		facltNm : siteNm,
		lineIntro : line
	})
	console.log(data);
	$.ajax({
	  url: `${Url}/data`,
	  type: "put",
	  dataType: "json",
	  data : data,
	  contentType : 'application/json',
	  success : function(result) {
      	alert("업데이트를 완료했습니다");
      	window.close();
      	opener.location.reload();
    },
    error: function(request, status, error) {
        console.log(request + "/" + status + "/" + error);
    }
  });
 }